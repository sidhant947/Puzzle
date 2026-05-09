import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
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
    bool won = score >= 10;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('stroop_test');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'NEURO-MASTER!' : 'BRAIN FOG',
        message: 'You scored $score correctly!',
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
    final state = ref.watch(stroopTestNotifierProvider);
    final notifier = ref.read(stroopTestNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(stroopTestNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'STROOP TEST',
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
                    const Text(
                      'IDENTIFY THE COLOR',
                      style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.currentItem.text,
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: state.currentItem.color,
                        fontSize: 80,
                      ),
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: state.allColorNames.map((name) {
                        return _ColorButton(
                          name: name,
                          onTap: () => notifier.onColorSelected(name),
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

class _ColorButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _ColorButton({required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
