import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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
    Future.microtask(
        () => ref.read(quickMathNotifierProvider.notifier).initGame());
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

    ref.listen(quickMathNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'QUICK MATH',
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat('TIME', '${state.timeLeft}s',
                          DesignSystem.accentBerry),
                      _buildStat('SCORE', '${state.score}',
                          DesignSystem.accentEmerald),
                    ],
                  ),
                  const Spacer(),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: constraints.maxHeight * 0.3),
                    child: TangibleContainer(
                      depth: 4.0,
                      color: DesignSystem.ink,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                state.currentProblem.equation,
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TangibleContainer(
                            depth: 2.0,
                            color: DesignSystem.surface,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            child: Text(
                              state.currentInput.isEmpty
                                  ? '?'
                                  : state.currentInput,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: DesignSystem.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildNumberPad(notifier, constraints),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: DesignSystem.ink,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberPad(
      QuickMathNotifier notifier, BoxConstraints constraints) {
    return Column(
      children: [
        for (var row in [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9]
        ])
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row
                  .map((n) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: _PadKey(
                          label: n.toString(),
                          onTap: () => notifier.onNumberPressed(n.toString()),
                          width: (constraints.maxWidth - 64) / 3,
                        ),
                      ))
                  .toList(),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: 'C',
                onTap: notifier.clearInput,
                color: DesignSystem.accentBerry,
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '0',
                onTap: () => notifier.onNumberPressed('0'),
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '⌫',
                onTap: notifier.onBackspace,
                color: DesignSystem.outline,
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
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
  final double width;

  const _PadKey(
      {required this.label,
      required this.onTap,
      this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.clamp(0, 80),
      height: 60,
      child: TangibleButton(
        onTap: onTap,
        color: color ?? DesignSystem.surface,
        shadowColor:
            color?.withValues(alpha: 0.2) ?? DesignSystem.outlineVariant,
        padding: EdgeInsets.zero,
        child: Center(
          child: FittedBox(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color != null && color != DesignSystem.surface
                    ? Colors.white
                    : DesignSystem.ink,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
