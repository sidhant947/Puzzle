import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'odd_rotation_provider.dart';

class OddRotationScreen extends ConsumerStatefulWidget {
  const OddRotationScreen({super.key});

  @override
  ConsumerState<OddRotationScreen> createState() => _OddRotationScreenState();
}

class _OddRotationScreenState extends ConsumerState<OddRotationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(oddRotationNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    final l10n = AppLocalizations.of(context)!;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('odd_rotation');
      HapticFeedbackUtil.victory();
    } else {
      HapticFeedbackUtil.error();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SHARP EYE!' : 'MISMATCHED',
        message: won ? 'You spotted the odd rotation!' : 'Look closer next time.',
        onPlayAgain: () {
          ref.read(oddRotationNotifierProvider.notifier).initGame();
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
    final state = ref.watch(oddRotationNotifierProvider);
    final notifier = ref.read(oddRotationNotifierProvider.notifier);

    ref.listen(oddRotationNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: l10n.oddRotationTitle.toUpperCase(),
      subtitle: l10n.oddRotationSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(oddRotationNotifierProvider.notifier).initGame();
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
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 400,
                    maxHeight: constraints.maxHeight * 0.6,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final option = state.options[index];
                      final isSelected = state.selectedIndex == index;
                      
                      Color color = colorScheme.surface;
                      if (isSelected) {
                        color = state.isGameWon ? DesignSystem.accentEmerald : DesignSystem.accentBerry;
                      }

                      return TangibleContainer(
                        depth: isSelected ? 0 : 2,
                        radius: DesignSystem.radiusMD,
                        color: color,
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.selectOption(index);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: FittedBox(
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationZ(option.rotation),
                                child: Transform.scale(
                                  scaleX: option.isMirrored ? -1.0 : 1.0,
                                  child: Icon(
                                    state.shape, 
                                    size: 48, 
                                    color: isSelected ? Colors.white : DesignSystem.primary
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
