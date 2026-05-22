import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'slitherlink_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class SlitherlinkScreen extends ConsumerWidget {
  const SlitherlinkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(slitherlinkNotifierProvider);
    final notifier = ref.read(slitherlinkNotifierProvider.notifier);

    ref.listen(slitherlinkNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'LOOP COMPLETED',
            message: 'Awesome! You successfully completed the loop puzzle.',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.newGame();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'Slitherlink',
      subtitle: 'Tap edges to form a single continuous loop matching cell numbers.',
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardWidth = constraints.maxWidth * 0.85;
          final boardSize = boardWidth > 320.0 ? 320.0 : boardWidth;

          return Column(
            children: [
              const Spacer(),
              Center(
                child: TangibleContainer(
                  color: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  depth: 4.0,
                  radius: DesignSystem.radiusLG,
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: SizedBox(
                    width: boardSize,
                    height: boardSize,
                    child: _SlitherlinkBoardWidget(
                      state: state,
                      notifier: notifier,
                      boardSize: boardSize,
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}

class _SlitherlinkBoardWidget extends StatelessWidget {
  final SlitherlinkState state;
  final SlitherlinkNotifier notifier;
  final double boardSize;

  const _SlitherlinkBoardWidget({
    required this.state,
    required this.notifier,
    required this.boardSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final size = state.level.size;
    final cellSize = boardSize / size;

    const double dotSize = 12.0;
    const double edgeTouchThickness = 24.0;
    const double clueSize = 32.0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. Draw Cell Clues
        for (int r = 0; r < size; r++)
          for (int c = 0; c < size; c++)
            if (state.level.clues[r][c] != null)
              Positioned(
                left: c * cellSize + cellSize / 2 - clueSize / 2,
                top: r * cellSize + cellSize / 2 - clueSize / 2,
                width: clueSize,
                height: clueSize,
                child: Center(
                  child: Text(
                    '${state.level.clues[r][c]}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ),

        // 2. Draw Horizontal Edges (Tap Targets & Visuals)
        for (int r = 0; r <= size; r++)
          for (int c = 0; c < size; c++)
            Positioned(
              left: c * cellSize + dotSize / 2,
              top: r * cellSize - edgeTouchThickness / 2,
              width: cellSize - dotSize,
              height: edgeTouchThickness,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  notifier.toggleHEdge(r, c);
                },
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: state.currentHEdges[r][c] ? 6.0 : 3.0,
                    decoration: BoxDecoration(
                      color: state.currentHEdges[r][c]
                          ? DesignSystem.accentEmerald
                          : colorScheme.outline.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),

        // 3. Draw Vertical Edges (Tap Targets & Visuals)
        for (int r = 0; r < size; r++)
          for (int c = 0; c <= size; c++)
            Positioned(
              left: c * cellSize - edgeTouchThickness / 2,
              top: r * cellSize + dotSize / 2,
              width: edgeTouchThickness,
              height: cellSize - dotSize,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  notifier.toggleVEdge(r, c);
                },
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: state.currentVEdges[r][c] ? 6.0 : 3.0,
                    decoration: BoxDecoration(
                      color: state.currentVEdges[r][c]
                          ? DesignSystem.accentEmerald
                          : colorScheme.outline.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),

        // 4. Draw Dots (Vertices)
        for (int r = 0; r <= size; r++)
          for (int c = 0; c <= size; c++)
            Positioned(
              left: c * cellSize - dotSize / 2,
              top: r * cellSize - dotSize / 2,
              width: dotSize,
              height: dotSize,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.onSurface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.surface,
                    width: 2.0,
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
