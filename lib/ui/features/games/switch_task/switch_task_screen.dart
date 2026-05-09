import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'switch_task_provider.dart';
import 'switch_task_engine.dart';

class SwitchTaskScreen extends ConsumerStatefulWidget {
  const SwitchTaskScreen({super.key});

  @override
  ConsumerState<SwitchTaskScreen> createState() => _SwitchTaskScreenState();
}

class _SwitchTaskScreenState extends ConsumerState<SwitchTaskScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(switchTaskNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 15;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('switch_task');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MENTAL GYMNAST!' : 'WIRES CROSSED',
        message: 'You scored $score correctly!',
        onPlayAgain: () {
          ref.read(switchTaskNotifierProvider.notifier).initGame();
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
    final state = ref.watch(switchTaskNotifierProvider);
    final notifier = ref.read(switchTaskNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(switchTaskNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'SWITCH TASK',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStat('TIME', '${state.timeLeft}s', DesignSystem.gameRose, theme),
                        _buildStat('SCORE', '${state.score}', DesignSystem.gameGreen, theme),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: state.rule == SwitchRule.color 
                          ? DesignSystem.gameBlue.withValues(alpha: 0.2)
                          : DesignSystem.gamePurple.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: state.rule == SwitchRule.color ? DesignSystem.gameBlue : DesignSystem.gamePurple,
                          width: 3,
                        ),
                      ),
                      child: Text(
                        state.rule == SwitchRule.color ? 'MATCH COLOR' : 'MATCH SHAPE',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2,
                          color: state.rule == SwitchRule.color ? DesignSystem.gameBlue : DesignSystem.gamePurple,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Icon(
                      state.item.shape,
                      size: 150,
                      color: state.item.color,
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: state.options.map((option) {
                        return InkWell(
                          onTap: () => notifier.onOptionSelected(option),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 140,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
                            ),
                            child: Center(
                              child: Text(
                                option,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildStat(String label, String value, Color color, ThemeData theme) {
    return Column(
      children: [
        Text(label, style: theme.textTheme.labelSmall),
        Text(value, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900, color: color)),
      ],
    );
  }
}
