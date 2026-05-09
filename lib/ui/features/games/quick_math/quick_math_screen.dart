import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'quick_math_provider.dart';

class QuickMathScreen extends ConsumerStatefulWidget {
  const QuickMathScreen({super.key});

  @override
  ConsumerState<QuickMathScreen> createState() => _QuickMathScreenState();
}

class _QuickMathScreenState extends ConsumerState<QuickMathScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(quickMathNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 5;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('quick_math');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MATH GENIUS!' : 'TIME UP',
        message: 'You solved $score problems!',
        onPlayAgain: () {
          ref.read(quickMathNotifierProvider.notifier).initGame();
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
    final state = ref.watch(quickMathNotifierProvider);
    final notifier = ref.read(quickMathNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(quickMathNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'QUICK MATH',
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
                    Text(
                      state.currentProblem.equation,
                      style: theme.textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 80,
                      width: 200,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: theme.colorScheme.primary, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          state.currentInput,
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    _buildNumberPad(notifier, theme),
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

  Widget _buildNumberPad(QuickMathNotifier notifier, ThemeData theme) {
    return Column(
      children: [
        for (var row in [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((n) => _PadKey(
              label: n.toString(),
              onTap: () => notifier.onNumberPressed(n.toString()),
            )).toList(),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PadKey(label: 'C', onTap: notifier.clearInput, color: DesignSystem.gameRose),
            _PadKey(label: '0', onTap: () => notifier.onNumberPressed('0')),
            _PadKey(label: '⌫', onTap: notifier.onBackspace, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}

class _PadKey extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _PadKey({required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 70,
          height: 60,
          decoration: BoxDecoration(
            color: color?.withValues(alpha: 0.1) ?? theme.colorScheme.surface,
            border: Border.all(color: color ?? theme.colorScheme.outline.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color ?? theme.colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
