import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'reverse_stroop_provider.dart';
import 'reverse_stroop_engine.dart';

class ReverseStroopScreen extends ConsumerStatefulWidget {
  const ReverseStroopScreen({super.key});

  @override
  ConsumerState<ReverseStroopScreen> createState() => _ReverseStroopScreenState();
}

class _ReverseStroopScreenState extends ConsumerState<ReverseStroopScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(reverseStroopNotifierProvider.notifier).startGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 50; // Threshold for winning
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('reverse_stroop');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'FOCUS MASTER!' : 'CONCENTRATION BROKEN',
        message: 'You scored $score points! Keep your eye on the instructions.',
        onPlayAgain: () {
          ref.read(reverseStroopNotifierProvider.notifier).startGame();
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
    final state = ref.watch(reverseStroopNotifierProvider);
    final notifier = ref.read(reverseStroopNotifierProvider.notifier);

    ref.listen(reverseStroopNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    if (state.currentStimulus == null) {
      return const GameScaffold(
        title: 'REVERSE STROOP',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.reverseStroopTitle.toUpperCase(),
      subtitle: l10n.reverseStroopSubtitle,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            final stimulus = state.currentStimulus!;
            
            return Column(
              children: [
                SizedBox(height: isSmall ? 8 : 16),
                _buildStats(state, isSmall),
                const Spacer(),
                TangibleContainer(
                  color: colorScheme.surface,
                  shadowColor: colorScheme.outline,
                  depth: 2.0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(
                    stimulus.rule == StroopRule.text ? 'MATCH TEXT' : 'MATCH COLOR',
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      color: stimulus.rule == StroopRule.text 
                          ? DesignSystem.primary 
                          : DesignSystem.secondary,
                      fontSize: isSmall ? 14 : 18,
                    ),
                  ),
                ),
                SizedBox(height: isSmall ? 16 : 32),
                TangibleContainer(
                  color: colorScheme.surface,
                  shadowColor: colorScheme.outline,
                  depth: 4.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmall ? 24 : 48,
                    vertical: isSmall ? 12 : 24
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: constraints.maxWidth * 0.8,
                    ),
                    child: FittedBox(
                      child: Text(
                        stimulus.word,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: stimulus.color,
                          fontSize: 64,
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
                    mainAxisSpacing: isSmall ? 12 : 16,
                    crossAxisSpacing: isSmall ? 12 : 16,
                    childAspectRatio: 2.5,
                    children: stimulus.options.map((option) {
                      return TangibleButton(
                        onTap: () {
                          if (option == stimulus.correctAnswer) {
                            HapticFeedbackUtil.lightImpact();
                          } else {
                            HapticFeedbackUtil.error();
                          }
                          notifier.submitAnswer(option);
                        },
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        depth: 4.0,
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: isSmall ? 16 : 18,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: isSmall ? 16 : 32),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStats(ReverseStroopState state, bool isSmall) {
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
