import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'flanker_test_provider.dart';

class FlankerTestScreen extends ConsumerStatefulWidget {
  const FlankerTestScreen({super.key});

  @override
  ConsumerState<FlankerTestScreen> createState() => _FlankerTestScreenState();
}

class _FlankerTestScreenState extends ConsumerState<FlankerTestScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(flankerTestNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 15;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('flanker_test');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'LASER FOCUS!' : 'DISTRACTED',
        message: 'You scored $score correctly!',
        onPlayAgain: () {
          ref.read(flankerTestNotifierProvider.notifier).initGame();
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
    final state = ref.watch(flankerTestNotifierProvider);
    final notifier = ref.read(flankerTestNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(flankerTestNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'FLANKER TEST',
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
                      'INDICATE THE DIRECTION OF THE CENTER ARROW',
                      textAlign: TextAlign.center,
                      style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
                      ),
                      child: Center(
                        child: Text(
                          state.currentDisplay,
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 10,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _DirectionButton(
                          icon: Icons.arrow_back_rounded,
                          label: 'LEFT',
                          onTap: () => notifier.onDirectionSelected(0),
                        ),
                        _DirectionButton(
                          icon: Icons.arrow_forward_rounded,
                          label: 'RIGHT',
                          onTap: () => notifier.onDirectionSelected(1),
                        ),
                      ],
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

class _DirectionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DirectionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.5), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: theme.colorScheme.onPrimaryContainer),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
