import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'divided_attention_provider.dart';
import 'divided_attention_engine.dart';

class DividedAttentionScreen extends ConsumerStatefulWidget {
  const DividedAttentionScreen({super.key});

  @override
  ConsumerState<DividedAttentionScreen> createState() => _DividedAttentionScreenState();
}

class _DividedAttentionScreenState extends ConsumerState<DividedAttentionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dividedAttentionNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'FOCUS BROKEN',
        message: 'Multitasking is hard! Your score was ${ref.read(dividedAttentionNotifierProvider).score}.',
        isVictory: false,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(dividedAttentionNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dividedAttentionNotifierProvider);
    final notifier = ref.read(dividedAttentionNotifierProvider.notifier);

    ref.listen(dividedAttentionNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        _showCompletionDialog();
      } else if (next.score > (previous?.score ?? 0)) {
        HapticFeedbackUtil.selectionClick();
        if (next.score % 10 == 0) {
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('divided_attention');
        }
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Divided Attention',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Divided Attention',
      subtitle: 'Tap LEFT for STAR ⭐ | Tap RIGHT for RED 🔴',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusMD,
                  color: DesignSystem.surface,
                  child: Text(
                    'SCORE: ${state.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Left Task
                Expanded(
                  child: _buildTaskSide(
                    item: state.leftItem,
                    onTap: notifier.onTapLeft,
                    isLeft: true,
                  ),
                ),
                // Divider
                Container(
                  width: 2,
                  color: DesignSystem.outline,
                  margin: const EdgeInsets.symmetric(vertical: DesignSystem.spaceXL),
                ),
                // Right Task
                Expanded(
                  child: _buildTaskSide(
                    item: state.rightItem,
                    onTap: notifier.onTapRight,
                    isLeft: false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildTaskSide({
    required DividedAttentionItem? item,
    required VoidCallback onTap,
    required bool isLeft,
  }) {
    if (item == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _buildItemWidget(item, isLeft),
        ),
      ),
    );
  }

  Widget _buildItemWidget(DividedAttentionItem item, bool isLeft) {
    if (isLeft) {
      IconData icon;
      switch (item.value) {
        case 'star': icon = Icons.star_rounded; break;
        case 'square': icon = Icons.square_rounded; break;
        case 'circle': icon = Icons.circle; break;
        case 'triangle': icon = Icons.change_history_rounded; break;
        default: icon = Icons.help_outline_rounded;
      }
      return Icon(
        icon,
        key: ValueKey(item.id),
        size: 80,
        color: DesignSystem.ink,
      );
    } else {
      Color color;
      switch (item.value) {
        case 'red': color = DesignSystem.error; break;
        case 'blue': color = DesignSystem.primary; break;
        case 'green': color = DesignSystem.success; break;
        case 'yellow': color = DesignSystem.accentAmber; break;
        default: color = DesignSystem.ink;
      }
      return Container(
        key: ValueKey(item.id),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
      );
    }
  }
}
