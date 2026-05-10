import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('flanker_test');
    } else {
      HapticFeedbackUtil.error();
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

    ref.listen(flankerTestNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'FLANKER TEST',
      subtitle: 'Indicate the direction of the center arrow, ignoring the flanking arrows.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Row(
                        children: [
                          Expanded(child: _buildStat('TIME', '${state.timeLeft}s', DesignSystem.accentBerry)),
                          const SizedBox(width: DesignSystem.spaceMD),
                          Expanded(child: _buildStat('SCORE', '${state.score}', DesignSystem.accentEmerald)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.35),
                        child: TangibleContainer(
                          color: DesignSystem.ink,
                          shadowColor: DesignSystem.inkSlate,
                          depth: 4.0,
                          padding: const EdgeInsets.all(DesignSystem.spaceLG),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                state.currentDisplay,
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Row(
                        children: [
                          Expanded(
                            child: TangibleButton(
                              color: DesignSystem.surface,
                              shadowColor: DesignSystem.outlineVariant,
                              onTap: () {
                                HapticFeedbackUtil.lightImpact();
                                notifier.onDirectionSelected(0);
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.arrow_back_rounded, size: 32, color: DesignSystem.primary),
                                  SizedBox(height: 4),
                                  Text('LEFT', style: TextStyle(color: DesignSystem.primary, fontSize: 12, fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: DesignSystem.spaceLG),
                          Expanded(
                            child: TangibleButton(
                              color: DesignSystem.surface,
                              shadowColor: DesignSystem.outlineVariant,
                              onTap: () {
                                HapticFeedbackUtil.lightImpact();
                                notifier.onDirectionSelected(1);
                              },
                              child: const Column(
                                children: [
                                  Icon(Icons.arrow_forward_rounded, size: 32, color: DesignSystem.primary),
                                  SizedBox(height: 4),
                                  Text('RIGHT', style: TextStyle(color: DesignSystem.primary, fontSize: 12, fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceXS),
      color: DesignSystem.surface,
      depth: 3.0,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: DesignSystem.inkSlate.withValues(alpha: 0.6),
              letterSpacing: 1.0,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
