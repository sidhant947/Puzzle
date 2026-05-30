import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'collatz_provider.dart';

class CollatzScreen extends ConsumerStatefulWidget {
  const CollatzScreen({super.key});

  @override
  ConsumerState<CollatzScreen> createState() => _CollatzScreenState();
}

class _CollatzScreenState extends ConsumerState<CollatzScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(collatzNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(collatzNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(collatzNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'REACHED ONE!',
            message: 'You took ${next.stepsTaken} steps. Min possible was ${next.currentLevel?.minSteps}.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(collatzNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'COLLATZ PATH',
        subtitle: 'Navigate the 3n+1 sequence',
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final isEven = state.currentNumber % 2 == 0;

    return GameScaffold(
      title: 'COLLATZ PATH',
      subtitle: 'Reach 1 in the minimum steps possible!',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(collatzNotifierProvider.notifier).reset();
      },
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'STEPS: ${state.stepsTaken}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.primary),
                  ),
                  Text(
                    'TARGET: ${state.currentLevel?.minSteps}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.accentAmber),
                  ),
                ],
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleContainer(
                depth: 8.0,
                color: colorScheme.surface,
                padding: const EdgeInsets.all(DesignSystem.spaceXL),
                child: Text(
                  '${state.currentNumber}',
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: colorScheme.primary),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceXL * 2),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TangibleButton(
                          onTap: isEven ? () {
                            HapticFeedbackUtil.lightImpact();
                            ref.read(collatzNotifierProvider.notifier).makeMove(0);
                          } : null,
                          color: isEven ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                          child: const Text('/ 2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ),
                      const SizedBox(width: DesignSystem.spaceMD),
                      Expanded(
                        child: TangibleButton(
                          onTap: () {
                            HapticFeedbackUtil.lightImpact();
                            ref.read(collatzNotifierProvider.notifier).makeMove(2);
                          },
                          color: DesignSystem.accentEmerald,
                          child: const Text('+ 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      ref.read(collatzNotifierProvider.notifier).makeMove(1);
                    },
                    color: colorScheme.secondary,
                    child: const Text('3n + 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
