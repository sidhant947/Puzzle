import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'path_finder_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class PathFinderScreen extends ConsumerWidget {
  const PathFinderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pathFinderNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(pathFinderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('PATH FINDER'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(pathFinderNotifierProvider.notifier).reset(),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'FIND THE HIDDEN PATH FROM S TO E',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                letterSpacing: 2,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'HINT: PATH IS ${state.requiredNodes.length} STEPS LONG',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: Center(
              child: _PathGrid(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'Trace a continuous path. If you reach the Exit but the game doesn\'t end, you haven\'t found the correct hidden path.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, ThemeData theme) {
    ref.read(gameStreakNotifierProvider.notifier).completeGame('path_finder', xpAmount: 30);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('PATH MASTERED'),
        content: const Text('You successfully found the hidden path!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('CONTINUE'),
          )
        ],
      ),
    );
  }
}

class _PathGrid extends ConsumerWidget {
  const _PathGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pathFinderNotifierProvider);
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            final x = index % 5;
            final y = index ~/ 5;
            final point = Point(x, y);
            
            final isSelected = state.currentPath.contains(point);
            final isLast = state.currentPath.last == point;
            final isStart = state.requiredNodes.first == point;
            final isExit = state.requiredNodes.last == point;
            
            return GestureDetector(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                ref.read(pathFinderNotifierProvider.notifier).addNode(point);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? theme.colorScheme.primary.withOpacity(isLast ? 1.0 : 0.4) 
                      : (isStart || isExit)
                          ? theme.colorScheme.primary.withOpacity(0.1)
                          : theme.colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isLast 
                        ? theme.colorScheme.primary 
                        : (isStart || isExit)
                            ? theme.colorScheme.primary.withOpacity(0.5)
                            : Colors.transparent,
                    width: (isLast || isStart || isExit) ? 2 : 1,
                  ),
                  boxShadow: isLast ? [
                    BoxShadow(color: theme.colorScheme.primary.withOpacity(0.3), blurRadius: 8)
                  ] : null,
                ),
                child: Center(
                  child: (isStart || isExit) && !isSelected
                      ? Text(isStart ? 'S' : 'E',
                          style: TextStyle(
                            color: theme.colorScheme.primary.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ))
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
