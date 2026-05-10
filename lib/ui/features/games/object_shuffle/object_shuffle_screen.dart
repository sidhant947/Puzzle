import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'object_shuffle_provider.dart';

class ObjectShuffleScreen extends ConsumerStatefulWidget {
  const ObjectShuffleScreen({super.key});

  @override
  ConsumerState<ObjectShuffleScreen> createState() => _ObjectShuffleScreenState();
}

class _ObjectShuffleScreenState extends ConsumerState<ObjectShuffleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(objectShuffleNotifierProvider.notifier).initGame();
    });
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('object_shuffle');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SHARP EYES!' : 'LOST TRACK',
        message: won 
            ? 'You successfully tracked the target!' 
            : 'Better luck next time!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(objectShuffleNotifierProvider.notifier).initGame();
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
    final state = ref.watch(objectShuffleNotifierProvider);
    final notifier = ref.read(objectShuffleNotifierProvider.notifier);

    ref.listen(objectShuffleNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        // We need to know if the user's last tap was correct. 
        // In our new logic, if it's game over, we check if they won.
        final won = next.phase == ObjectShufflePhase.result;
        
        if (won) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        _showGameOverDialog(won);
      }
    });

    if (state.isLoading) {
      return const GameScaffold(title: 'OBJECT SHUFFLE', body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: 'OBJECT SHUFFLE',
      subtitle: state.phase == ObjectShufflePhase.showing 
          ? 'Watch the target object...' 
          : (state.phase == ObjectShufflePhase.shuffling ? 'Keep your eyes on it!' : 'Where is the target object?'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStat('TARGET', 'TRACK STAR', DesignSystem.primary),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              height: 180,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final shellWidth = 60.0; // Reduced for 5 items
                  final totalWidth = constraints.maxWidth - 40;
                  final spacing = (totalWidth - (state.objectSlots.length * shellWidth)) / (state.objectSlots.length - 1);

                  return Stack(
                    clipBehavior: Clip.none,
                    children: List.generate(state.objectSlots.length, (objectIndex) {
                      final slotIndex = state.objectSlots[objectIndex];
                      final isTarget = objectIndex == state.targetObjectIndex;
                      final isSwapping = state.swappingA == slotIndex || state.swappingB == slotIndex;
                      
                      return AnimatedPositioned(
                        key: ValueKey('object_$objectIndex'),
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOutBack,
                        left: 20 + slotIndex * (shellWidth + spacing),
                        top: isSwapping ? -30 : 40,
                        child: GestureDetector(
                          onTap: () {
                            if (state.phase == ObjectShufflePhase.waiting) {
                              HapticFeedbackUtil.lightImpact();
                              notifier.onShellTap(slotIndex);
                            }
                          },
                          child: _Shell(
                            isTarget: isTarget,
                            isRevealed: state.phase == ObjectShufflePhase.showing || (state.isGameOver && isTarget),
                            isSwapping: isSwapping,
                            isWrong: state.isGameOver && state.phase != ObjectShufflePhase.result && isTarget == false, 
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(DesignSystem.spaceXL),
            child: Text(
              'TRACK THE STAR AS IT SHUFFLES',
              style: TextStyle(
                color: DesignSystem.inkSlate,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}

class _Shell extends StatelessWidget {
  final bool isTarget;
  final bool isRevealed;
  final bool isSwapping;
  final bool isWrong;

  const _Shell({
    required this.isTarget,
    required this.isRevealed,
    this.isSwapping = false,
    this.isWrong = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 200),
      scale: isSwapping ? 1.15 : 1.0,
      child: TangibleContainer(
        depth: isSwapping ? 8.0 : 4.0,
        radius: 30,
        color: isWrong ? DesignSystem.error.withValues(alpha: 0.1) : DesignSystem.surface,
        shadowColor: isWrong ? DesignSystem.error.withValues(alpha: 0.2) : DesignSystem.outlineVariant,
        padding: const EdgeInsets.all(12),
        child: Container(
          width: 36,
          height: 60,
          decoration: BoxDecoration(
            color: isRevealed 
              ? (isTarget ? DesignSystem.primary : DesignSystem.outlineVariant.withValues(alpha: 0.3))
              : (isSwapping ? DesignSystem.primary.withValues(alpha: 0.05) : DesignSystem.inkSlate.withValues(alpha: 0.1)),
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            border: isSwapping ? Border.all(color: DesignSystem.primary.withValues(alpha: 0.3), width: 2) : null,
          ),
          child: isRevealed && isTarget 
            ? const Icon(Icons.star_rounded, color: Colors.white, size: 24)
            : (isRevealed ? null : const Icon(Icons.help_outline_rounded, color: DesignSystem.inkSlate, size: 18)),
        ),
      ),
    );
  }
}
