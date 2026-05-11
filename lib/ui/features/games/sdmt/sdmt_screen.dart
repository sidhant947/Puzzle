import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'sdmt_provider.dart';

class SDMTScreen extends ConsumerStatefulWidget {
  const SDMTScreen({super.key});

  @override
  ConsumerState<SDMTScreen> createState() => _SDMTScreenState();
}

class _SDMTScreenState extends ConsumerState<SDMTScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(sdmtNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 30;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('sdmt');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SPEED DEMON!' : 'SLOW & STEADY',
        message: 'You matched $score symbols! This test measures your scanning speed and visual attention.',
        onPlayAgain: () {
          ref.read(sdmtNotifierProvider.notifier).initGame();
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
    final state = ref.watch(sdmtNotifierProvider);
    final notifier = ref.read(sdmtNotifierProvider.notifier);

    ref.listen(sdmtNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'SDMT TEST',
      subtitle: 'Use the key above to find the digit for the symbol shown.',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      const SizedBox(height: 20),
                      _buildKey(state),
                      const Spacer(),
                      _buildTargetSymbol(state),
                      const Spacer(),
                      _buildNumpad(notifier, isSmall),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildKey(SdmtState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TangibleContainer(
        color: DesignSystem.surface,
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: state.symbolKey.entries.map((entry) {
            return Column(
              children: [
                Icon(entry.key, size: 24, color: DesignSystem.primary),
                const SizedBox(height: 4),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(color: DesignSystem.outline),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      entry.value.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTargetSymbol(SdmtState state) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: TangibleContainer(
        key: ValueKey(state.currentSymbol),
        color: DesignSystem.surface,
        padding: const EdgeInsets.all(40),
        child: Icon(state.currentSymbol, size: 80, color: DesignSystem.ink),
      ),
    );
  }

  Widget _buildNumpad(SdmtNotifier notifier, bool isSmall) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          final digit = index + 1;
          return TangibleButton(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.onDigitTap(digit);
            },
            color: DesignSystem.surface,
            child: Center(
              child: Text(
                digit.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: DesignSystem.ink,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStats(SdmtState state, bool isSmall) {
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
      color: DesignSystem.surface,
      shadowColor: DesignSystem.outlineVariant,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16, 
        vertical: isSmall ? 4 : 8
      ),
      child: Column(
        children: [
          Text(
            label, 
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: DesignSystem.inkSlate,
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value, 
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
