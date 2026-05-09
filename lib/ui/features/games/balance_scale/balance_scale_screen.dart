import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'balance_scale_provider.dart';
import 'balance_scale_engine.dart';

class BalanceScaleScreen extends ConsumerStatefulWidget {
  const BalanceScaleScreen({super.key});

  @override
  ConsumerState<BalanceScaleScreen> createState() => _BalanceScaleScreenState();
}

class _BalanceScaleScreenState extends ConsumerState<BalanceScaleScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(balanceScaleNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('balance_scale');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'BALANCED!' : 'UNBALANCED',
        message: won ? 'You correctly deduced the weight!' : 'Try again.',
        onPlayAgain: () {
          ref.read(balanceScaleNotifierProvider.notifier).initGame();
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
    final state = ref.watch(balanceScaleNotifierProvider);
    final notifier = ref.read(balanceScaleNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(balanceScaleNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'BALANCE SCALE',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Deduce the weight of the last item!'),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: state.equations.map((eq) => _buildScale(eq, state.unitIcon, theme)).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Input Area
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.help_outline_rounded),
                        const SizedBox(width: 8),
                        const Text('=', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 8),
                        Text(
                          state.currentInput.isEmpty ? '?' : state.currentInput,
                          style: TextStyle(
                            fontSize: 32, 
                            fontWeight: FontWeight.bold,
                            color: state.isInvalidGuess ? DesignSystem.gameRose : theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(state.unitIcon, size: 32),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildNumberPad(notifier, theme),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildScale(WeightEquation eq, IconData unitIcon, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWeightGroup(eq.left, theme),
              const Icon(Icons.balance_rounded, color: Colors.grey),
              eq.isQuestion ? _buildQuestionSide(unitIcon, theme) : _buildWeightGroup(eq.right, theme),
            ],
          ),
          const SizedBox(height: 8),
          Container(height: 2, width: 200, color: Colors.grey.withValues(alpha: 0.3)), // Scale beam
        ],
      ),
    );
  }

  Widget _buildWeightGroup(Map<IconData, int> items, ThemeData theme) {
    List<Widget> icons = [];
    items.forEach((icon, count) {
      for (int i = 0; i < count; i++) {
        icons.add(Icon(icon, size: 24, color: theme.colorScheme.primary));
      }
    });
    return Wrap(children: icons);
  }

  Widget _buildQuestionSide(IconData unitIcon, ThemeData theme) {
    return Row(
      children: [
        const Text('?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(width: 4),
        Icon(unitIcon, size: 24, color: theme.colorScheme.primary.withValues(alpha: 0.5)),
      ],
    );
  }

  Widget _buildNumberPad(BalanceScaleNotifier notifier, ThemeData theme) {
    return Column(
      children: [
        for (var row in [[1, 2, 3, 4, 5], [6, 7, 8, 9, 0]])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((n) => _PadButton(
              label: n.toString(),
              onTap: () => notifier.onNumberPressed(n.toString()),
            )).toList(),
          ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: notifier.onBackspace,
              icon: const Icon(Icons.backspace_rounded),
              label: const Text('BACK'),
              style: ElevatedButton.styleFrom(backgroundColor: DesignSystem.gameRose, foregroundColor: Colors.white),
            ),
            const SizedBox(width: 20),
            ElevatedButton.icon(
              onPressed: notifier.submitGuess,
              icon: const Icon(Icons.check_rounded),
              label: const Text('SUBMIT'),
              style: ElevatedButton.styleFrom(backgroundColor: DesignSystem.gameGreen, foregroundColor: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class _PadButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PadButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
          ),
          child: Center(
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
