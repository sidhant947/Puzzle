import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'go_no_go_provider.dart';
import 'go_no_go_engine.dart';

class GoNoGoScreen extends ConsumerStatefulWidget {
  const GoNoGoScreen({super.key});

  @override
  ConsumerState<GoNoGoScreen> createState() => _GoNoGoScreenState();
}

class _GoNoGoScreenState extends ConsumerState<GoNoGoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(goNoGoNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'REACTION STOPPED',
        message: 'Your inhibitory control is being tested!',
        isVictory: false,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(goNoGoNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(goNoGoNotifierProvider);
    final notifier = ref.read(goNoGoNotifierProvider.notifier);

    ref.listen(goNoGoNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        _showCompletionDialog();
      } else if (next.score > (previous?.score ?? 0)) {
        HapticFeedbackUtil.selectionClick();
        if (next.score % 10 == 0) {
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('go_no_go');
        }
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Go / No-Go',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Go / No-Go',
      subtitle: 'Tap for Green, IGNORE Red!',
      body: GestureDetector(
        onTap: notifier.onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
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
              child: Center(
                child: _buildSymbol(state.currentSymbol),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(DesignSystem.space2XL),
              child: Text(
                'TAP ANYWHERE TO GO',
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
      ),
    );
  }

  Widget _buildSymbol(GoNoGoSymbol? symbol) {
    if (symbol == null) return const SizedBox.shrink();

    final isGo = symbol == GoNoGoSymbol.go;
    final color = isGo ? DesignSystem.success : DesignSystem.error;
    final icon = isGo ? Icons.play_arrow_rounded : Icons.close_rounded;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
      },
      child: TangibleContainer(
        key: ValueKey(symbol),
        radius: DesignSystem.radiusFull,
        depth: 8.0,
        color: color,
        shadowColor: color.withValues(alpha: 0.7),
        padding: const EdgeInsets.all(DesignSystem.space3XL),
        child: Icon(
          icon,
          size: 120,
          color: Colors.white,
        ),
      ),
    );
  }
}
