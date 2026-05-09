import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'reflex_tap_provider.dart';

class ReflexTapScreen extends ConsumerStatefulWidget {
  const ReflexTapScreen({super.key});

  @override
  ConsumerState<ReflexTapScreen> createState() => _ReflexTapScreenState();
}

class _ReflexTapScreenState extends ConsumerState<ReflexTapScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(reflexTapNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 15;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('reflex_tap');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SHARP REFLEXES!' : 'OUT OF TIME',
        message: 'You tapped $score targets!',
        onPlayAgain: () {
          ref.read(reflexTapNotifierProvider.notifier).initGame();
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
    final state = ref.watch(reflexTapNotifierProvider);
    final notifier = ref.read(reflexTapNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(reflexTapNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'REFLEX TAP',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStat('TIME', '${state.timeLeft}s', DesignSystem.gameRose, theme),
                        _buildStat('TAPS', '${state.score}', DesignSystem.gameAmber, theme),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: notifier.onMissed,
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              children: [
                                Positioned(
                                  left: state.targetPosition.x * constraints.maxWidth - (state.targetSize / 2),
                                  top: state.targetPosition.y * constraints.maxHeight - (state.targetSize / 2),
                                  child: _Target(
                                    size: state.targetSize,
                                    onTap: notifier.onTargetTapped,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text('Tap the targets as fast as you can!', style: TextStyle(color: Colors.grey)),
                  ),
                ],
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

class _Target extends StatelessWidget {
  final double size;
  final VoidCallback onTap;

  const _Target({required this.size, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: DesignSystem.gameRose,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: DesignSystem.gameRose.withValues(alpha: 0.4), blurRadius: 12, spreadRadius: 2),
          ],
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: const Center(
          child: Icon(Icons.gps_fixed_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
