import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/tangible.dart';
import 'slide_puzzle_engine.dart';
import 'slide_puzzle_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class SlidePuzzleScreen extends ConsumerWidget {
  const SlidePuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(slidePuzzleNotifierProvider);

    ref.listen(slidePuzzleNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'SLIDE PUZZLE',
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return Column(
              children: [
                SizedBox(height: isSmall ? 8 : 16),
                _buildInstructions(isSmall),
                const Spacer(),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * (isSmall ? 0.55 : 0.5),
                    ),
                    child: _buildBoard(context, ref, state, isSmall),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isSmall ? 32 : 48),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.mediumImpact();
                      ref.read(slidePuzzleNotifierProvider.notifier).newGame();
                    },
                    child: const Text('NEW GAME'),
                  ),
                ),
                SizedBox(height: isSmall ? 16 : 32),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInstructions(bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: TangibleContainer(
        depth: isSmall ? 2.0 : 4.0,
        padding: EdgeInsets.all(isSmall ? 8 : 16),
        child: Column(
          children: [
            Text(
              'TILE SLIDER',
              style: TextStyle(
                color: DesignSystem.primary,
                fontSize: isSmall ? 12 : 14,
                letterSpacing: 2,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: isSmall ? 4 : 8),
            Text(
              'Rearrange the tiles into numerical order by sliding them into the empty space.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: DesignSystem.outline,
                fontSize: isSmall ? 10 : 12,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, SlidePuzzleState state, bool isSmall) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
        child: GridView.builder(
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: SlidePuzzleEngine.size,
            crossAxisSpacing: isSmall ? 8 : 10,
            mainAxisSpacing: isSmall ? 8 : 10,
          ),
          itemCount: SlidePuzzleEngine.size * SlidePuzzleEngine.size,
          itemBuilder: (context, index) {
            final value = state.board[index];
            if (value == 0) return const SizedBox.shrink();

            return GestureDetector(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                ref.read(slidePuzzleNotifierProvider.notifier).moveTile(index);
              },
              child: TangibleContainer(
                depth: isSmall ? 2.0 : 4.0,
                color: DesignSystem.surface,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: isSmall ? 18 : 24,
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.ink,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('slide_puzzle');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(slidePuzzleNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
        title: 'CONGRATS',
        message: 'You have successfully ordered all the tiles.',
      ),
    );
  }
}
