import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'symmetry_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class SymmetryScreen extends ConsumerStatefulWidget {
  const SymmetryScreen({super.key});

  @override
  ConsumerState<SymmetryScreen> createState() => _SymmetryScreenState();
}

class _SymmetryScreenState extends ConsumerState<SymmetryScreen> {
  final Set<int> _toggledThisDrag = {};

  void _handleDragUpdate(Offset localPosition, double cellSize, SymmetryState state) {
    final x = (localPosition.dx / cellSize).floor();
    final y = (localPosition.dy / cellSize).floor();

    if (x >= 3 && x < 6 && y >= 0 && y < 6) {
      final index = y * 6 + x;
      if (!_toggledThisDrag.contains(index)) {
        HapticFeedbackUtil.selectionClick();
        ref.read(symmetryNotifierProvider.notifier).toggleCell(x, y);
        _toggledThisDrag.add(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(symmetryNotifierProvider);

    ref.listen(symmetryNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.symmetryTitle.toUpperCase(),
      subtitle: l10n.symmetrySubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(symmetryNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).colorScheme.onSurface,
            size: 18,
          ),
        ),
      ],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            final gridPadding = isSmall ? 16.0 : 24.0;
            final availableWidth = constraints.maxWidth - (gridPadding * 2);
            final cellSize = availableWidth / 6;

            return Column(
              children: [
                const Spacer(),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: gridPadding),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onPanStart: (details) {
                              _toggledThisDrag.clear();
                              _handleDragUpdate(details.localPosition, cellSize, state);
                            },
                            onPanUpdate: (details) {
                              _handleDragUpdate(details.localPosition, cellSize, state);
                            },
                            child: Column(
                              children: List.generate(6, (y) {
                                return Expanded(
                                  child: Row(
                                    children: List.generate(6, (x) {
                                      final isActive = state.grid[y][x];
                                      final isEditable = x >= 3;
                                      
                                      return Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: TangibleContainer(
                                            depth: isActive ? 0.0 : 1.0,
                                            radius: DesignSystem.radiusXS,
                                            color: isActive 
                                              ? (isEditable ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))
                                              : Theme.of(context).colorScheme.surface,
                                            onTap: () {
                                              if (isEditable) {
                                                HapticFeedbackUtil.selectionClick();
                                                ref.read(symmetryNotifierProvider.notifier).toggleCell(x, y);
                                              }
                                            },
                                            child: isActive && !isEditable 
                                              ? Center(
                                                  child: FittedBox(
                                                    child: Icon(
                                                      Icons.circle, 
                                                      color: Colors.white, 
                                                      size: isSmall ? 6 : 8
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox.expand(),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Center(
                            child: IgnorePointer(
                              child: Container(
                                width: isSmall ? 2 : 4, 
                                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3), 
                                height: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(height: isSmall ? 16 : 40),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('symmetry', xpAmount: 25);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'PERFECT MIRROR!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(symmetryNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
        message: 'You mirrored the pattern perfectly with surgical precision.',
      ),
    );
  }
}
