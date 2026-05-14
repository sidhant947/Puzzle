import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'stroop_test_provider.dart';

class StroopTestScreen extends ConsumerStatefulWidget {
  const StroopTestScreen({super.key});

  @override
  ConsumerState<StroopTestScreen> createState() => _StroopTestScreenState();
}

class _StroopTestScreenState extends ConsumerState<StroopTestScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(stroopTestNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 10;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('stroop_test');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'NEURO-MASTER!' : 'BRAIN FOG',
        message: 'You scored $score correctly! Focus on the color of the ink, not the word.',
        onPlayAgain: () {
          ref.read(stroopTestNotifierProvider.notifier).initGame();
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
    final state = ref.watch(stroopTestNotifierProvider);
    final notifier = ref.read(stroopTestNotifierProvider.notifier);

    ref.listen(stroopTestNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.stroopTestTitle.toUpperCase(),
      subtitle: l10n.stroopTestSubtitle,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      Spacer(),
                      Text(
                        'IDENTIFY THE COLOR',
                        style: TextStyle(
                          letterSpacing: 2, 
                          fontWeight: FontWeight.w800, 
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          fontSize: isSmall ? 10 : 12,
                        ),
                      ),
                      SizedBox(height: isSmall ? 12 : 24),
                      TangibleContainer(
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        depth: 2.0, // Reduced depth
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmall ? 16 : 32, 
                          vertical: isSmall ? 8 : 16
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 0.7,
                            maxHeight: constraints.maxHeight * 0.25,
                          ),
                          child: FittedBox(
                            child: Text(
                              state.currentItem.text,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: state.currentItem.color,
                                fontSize: 48,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: isSmall ? 8 : 12,
                          crossAxisSpacing: isSmall ? 8 : 12,
                          childAspectRatio: 2.2,
                          children: state.allColorNames.map((name) {
                            return TangibleButton(
                              onTap: () {
                                HapticFeedbackUtil.lightImpact();
                                notifier.onColorSelected(name);
                              },
                              color: colorScheme.surface,
                              shadowColor: colorScheme.outline,
                              depth: 3.0,
                              padding: EdgeInsets.zero,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900, 
                                      fontSize: isSmall ? 14 : 16,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildStats(StroopTestState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('SCORE', '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 16 : 24, 
        vertical: isSmall ? 4 : 8
      ),
      child: Column(
        children: [
          Text(
            label, 
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value, 
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: isSmall ? 18 : 24,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
