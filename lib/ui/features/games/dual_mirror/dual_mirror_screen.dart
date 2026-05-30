import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'dual_mirror_provider.dart';

class DualMirrorScreen extends ConsumerStatefulWidget {
  const DualMirrorScreen({super.key});

  @override
  ConsumerState<DualMirrorScreen> createState() => _DualMirrorScreenState();
}

class _DualMirrorScreenState extends ConsumerState<DualMirrorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dualMirrorNotifierProvider.notifier).initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dualMirrorNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(dualMirrorNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'MAZE MASTERED!',
            message: 'You navigated both icons to their targets!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(dualMirrorNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentLevel == null) {
      return GameScaffold(
        title: 'DUAL-MIRROR',
        subtitle: 'Navigate two mazes at once',
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'DUAL-MIRROR',
      subtitle: 'Control both icons. Blue follows, Red mirrors.',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(dualMirrorNotifierProvider.notifier).reset();
      },
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _MazeView(maze: state.currentLevel!.maze1, pos: state.pos1, target: state.currentLevel!.target1, color: colorScheme.primary)),
                const VerticalDivider(width: 1),
                Expanded(child: _MazeView(maze: state.currentLevel!.maze2, pos: state.pos2, target: state.currentLevel!.target2, color: colorScheme.error)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DirectionButton(icon: Icons.arrow_upward, direction: 'UP'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DirectionButton(icon: Icons.arrow_back, direction: 'LEFT'),
                    const SizedBox(width: DesignSystem.spaceMD),
                    _DirectionButton(icon: Icons.arrow_downward, direction: 'DOWN'),
                    const SizedBox(width: DesignSystem.spaceMD),
                    _DirectionButton(icon: Icons.arrow_forward, direction: 'RIGHT'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MazeView extends StatelessWidget {
  final List<List<bool>> maze;
  final dynamic pos;
  final dynamic target;
  final Color color;
  const _MazeView({required this.maze, required this.pos, required this.target, required this.color});

  @override
  Widget build(BuildContext context) {
    final size = maze.length;
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
        child: Column(
          children: List.generate(size, (r) {
            return Expanded(
              child: Row(
                children: List.generate(size, (c) {
                  final isPos = pos.x == c && pos.y == r;
                  final isTarget = target.x == c && target.y == r;
                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: maze[r][c] ? Colors.grey : Colors.white10,
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: isPos 
                          ? Icon(Icons.circle, color: color, size: 20)
                          : isTarget ? Icon(Icons.star, color: Colors.amber, size: 20) : null,
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _DirectionButton extends ConsumerWidget {
  final IconData icon;
  final String direction;
  const _DirectionButton({required this.icon, required this.direction});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TangibleButton(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(dualMirrorNotifierProvider.notifier).move(direction);
      },
      child: Icon(icon),
    );
  }
}
