import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'pixel_mimic_provider.dart';

class PixelMimicScreen extends ConsumerStatefulWidget {
  const PixelMimicScreen({super.key});

  @override
  ConsumerState<PixelMimicScreen> createState() => _PixelMimicScreenState();
}

class _PixelMimicScreenState extends ConsumerState<PixelMimicScreen> {
  final List<Color> _colors = [
    Colors.transparent,
    DesignSystem.primary,
    DesignSystem.accentEmerald,
    DesignSystem.accentAmber,
    DesignSystem.accentBerry,
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(pixelMimicNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('pixel_mimic');
      HapticFeedbackUtil.victory();
    } else {
      HapticFeedbackUtil.error();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MIMIC MASTER!' : 'PATTERN MISMATCH',
        message: won ? 'Perfect memory!' : 'Try again.',
        onPlayAgain: () {
          ref.read(pixelMimicNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(pixelMimicNotifierProvider);
    final notifier = ref.read(pixelMimicNotifierProvider.notifier);

    ref.listen(pixelMimicNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: l10n.pixelMimicTitle.toUpperCase(),
      subtitle: state.isShowingPattern ? 'Memorize this pattern!' : 'Recreate the pattern!',
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(pixelMimicNotifierProvider.notifier).initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                child: Center(
                  child: _buildGrid(state, notifier),
                ),
              ),
              const Spacer(),
              if (!state.isShowingPattern) ...[
                _buildColorPicker(state, notifier),
                const SizedBox(height: DesignSystem.spaceLG),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
                  child: TangibleButton(
                    onTap: notifier.submitMimic,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: const Center(
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGrid(PixelMimicState state, PixelMimicNotifier notifier) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: GridView.builder(
        padding: const EdgeInsets.all(DesignSystem.spaceXS),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          final r = index ~/ 4;
          final c = index % 4;
          final colorId = state.isShowingPattern ? state.targetGrid[r][c] : state.userGrid[r][c];
          
          return TangibleContainer(
            depth: colorId == 0 ? 2.0 : 0.0,
            radius: DesignSystem.radiusXS,
            color: colorId == 0 ? Theme.of(context).colorScheme.surface : _colors[colorId],
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.onTileTapped(r, c);
            },
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }

  Widget _buildColorPicker(PixelMimicState state, PixelMimicNotifier notifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final colorId = index + 1;
        final isSelected = state.selectedColor == colorId;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: TangibleContainer(
            depth: isSelected ? 0 : 2,
            radius: DesignSystem.radiusFull,
            color: _colors[colorId],
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              notifier.selectColor(colorId);
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: isSelected 
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 20) 
                : null,
            ),
          ),
        );
      }),
    );
  }
}
