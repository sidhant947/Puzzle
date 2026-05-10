import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('balance_scale');
    } else {
      HapticFeedbackUtil.error();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: won,
        title: won ? 'BALANCED!' : 'UNBALANCED',
        message: won ? 'You correctly deduced the weight!' : 'Try again to find the correct balance.',
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

    ref.listen(balanceScaleNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'BALANCE SCALE',
      subtitle: 'Deduce the weight of the last item based on the scales.',
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
                    const Spacer(),
                    _buildScalesArea(state, constraints.maxHeight * 0.4),
                    const Spacer(),
                    // Input Area
                    TangibleContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: DesignSystem.surface,
                      depth: 3.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.help_outline_rounded, color: DesignSystem.inkSlate, size: 20),
                          const SizedBox(width: 6),
                          const Text(
                            '=', 
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.w900,
                              color: DesignSystem.ink,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            state.currentInput.isEmpty ? '?' : state.currentInput,
                            style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.w900,
                              color: state.isInvalidGuess ? DesignSystem.error : DesignSystem.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(state.unitIcon, size: 24, color: DesignSystem.primary),
                        ],
                      ),
                    ),
                    const Spacer(),
                    _buildNumberPad(notifier),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildScalesArea(BalanceScaleState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: TangibleContainer(
          color: DesignSystem.ink,
          shadowColor: DesignSystem.inkSlate,
          depth: 4.0, // Reduced from 6.0
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
              child: ListView(
                padding: const EdgeInsets.all(DesignSystem.spaceSM),
                shrinkWrap: true,
                children: state.equations.map((eq) => _buildScale(eq, state.unitIcon)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScale(WeightEquation eq, IconData unitIcon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: DesignSystem.spaceXS),
      padding: const EdgeInsets.all(DesignSystem.spaceSM),
      decoration: BoxDecoration(
        color: DesignSystem.background,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: DesignSystem.outline, width: 0.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: _buildWeightGroup(eq.left)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(Icons.balance_rounded, color: DesignSystem.inkSlate, size: 20),
              ),
              Expanded(
                child: eq.isQuestion 
                  ? _buildQuestionSide(unitIcon) 
                  : _buildWeightGroup(eq.right),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 2, 
            width: double.infinity, 
            decoration: BoxDecoration(
              color: DesignSystem.inkSlate,
              borderRadius: BorderRadius.circular(1),
            ),
          ), // Scale beam
        ],
      ),
    );
  }

  Widget _buildWeightGroup(Map<IconData, int> items) {
    List<Widget> icons = [];
    items.forEach((icon, count) {
      for (int i = 0; i < count; i++) {
        icons.add(
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Icon(icon, size: 16, color: DesignSystem.primary),
          ),
        );
      }
    });
    return Wrap(
      alignment: WrapAlignment.center,
      children: icons,
    );
  }

  Widget _buildQuestionSide(IconData unitIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '?', 
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w900,
            color: DesignSystem.ink,
          ),
        ),
        const SizedBox(width: 2),
        Icon(unitIcon, size: 16, color: DesignSystem.primary.withValues(alpha: 0.5)),
      ],
    );
  }

  Widget _buildNumberPad(BalanceScaleNotifier notifier) {
    return Column(
      children: [
        for (var row in [[1, 2, 3, 4, 5], [6, 7, 8, 9, 0]])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((n) => Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceXS),
              child: TangibleButton(
                color: DesignSystem.surface,
                shadowColor: DesignSystem.outlineVariant,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  notifier.onNumberPressed(n.toString());
                },
                child: Text(
                  n.toString(),
                  style: const TextStyle(
                    color: DesignSystem.ink,
                    fontWeight: FontWeight.w900,
                    fontSize: 14, // Reduced from 20
                  ),
                ),
              ),
            )).toList(),
          ),
        const SizedBox(height: DesignSystem.spaceSM),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: Row(
            children: [
              Expanded(
                child: TangibleButton(
                  color: DesignSystem.accentBerry,
                  shadowColor: const Color(0xFFBE185D),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onTap: () {
                    HapticFeedbackUtil.mediumImpact();
                    notifier.onBackspace();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.backspace_rounded, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text('BACK', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: DesignSystem.spaceMD),
              Expanded(
                child: TangibleButton(
                  color: DesignSystem.accentEmerald,
                  shadowColor: const Color(0xFF059669),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  onTap: () {
                    HapticFeedbackUtil.selectionClick();
                    notifier.submitGuess();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_rounded, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text('SUBMIT', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

