import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'odd_rotation_provider.dart';

class OddRotationScreen extends ConsumerStatefulWidget {
  const OddRotationScreen({super.key});

  @override
  ConsumerState<OddRotationScreen> createState() => _OddRotationScreenState();
}

class _OddRotationScreenState extends ConsumerState<OddRotationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(oddRotationNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('odd_rotation');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SHARP EYE!' : 'MISMATCHED',
        message: won ? 'You spotted the odd rotation!' : 'Look closer next time.',
        onPlayAgain: () {
          ref.read(oddRotationNotifierProvider.notifier).initGame();
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
    final state = ref.watch(oddRotationNotifierProvider);
    final notifier = ref.read(oddRotationNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(oddRotationNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'ODD ROTATION',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text('One of these is mirrored. Can you find it?'),
                  const SizedBox(height: 40),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final option = state.options[index];
                        return GestureDetector(
                          onTap: () => notifier.selectOption(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                              border: Border.all(
                                color: state.selectedIndex == index 
                                  ? (state.isGameWon ? DesignSystem.gameGreen : DesignSystem.gameRose)
                                  : theme.colorScheme.outline.withValues(alpha: 0.1),
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationZ(option.rotation)
                                  ..scale(option.isMirrored ? -1.0 : 1.0, 1.0, 1.0),
                                child: Icon(state.shape, size: 60, color: theme.colorScheme.primary),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
