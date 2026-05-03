import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_search_provider.dart';
import '../../../../../providers/user_providers.dart';

class WordSearchScreen extends ConsumerStatefulWidget {
  const WordSearchScreen({super.key});

  @override
  ConsumerState<WordSearchScreen> createState() => _WordSearchScreenState();
}

class _WordSearchScreenState extends ConsumerState<WordSearchScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(wordSearchNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(wordSearchNotifierProvider);
    final notifier = ref.read(wordSearchNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(wordSearchNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('WORD SEARCH'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.initGame(),
          ),
        ],
      ),
      body: state.board == null
          ? Center(child: CircularProgressIndicator(color: theme.colorScheme.primary))
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildGrid(state, notifier, theme),
                      ),
                    ),
                  ),
                  _buildWordList(state, theme),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }

  Widget _buildWordList(WordSearchState state, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(top: BorderSide(color: theme.colorScheme.onSurface.withValues(alpha: 0.1), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WORDS TO FIND',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: state.board!.words.map((word) {
              final isFound = word.isFound;
              return Text(
                word.word,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isFound ? FontWeight.w400 : FontWeight.w900,
                  color: isFound 
                      ? theme.colorScheme.onSurface.withValues(alpha: 0.3) 
                      : theme.colorScheme.onSurface,
                  decoration: isFound ? TextDecoration.lineThrough : null,
                  letterSpacing: 1.0,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(WordSearchState state, WordSearchNotifier notifier, ThemeData theme) {
    final board = state.board!;
    return LayoutBuilder(builder: (context, constraints) {
      final double availableWidth = constraints.maxWidth - 32;
      final double gridSize = availableWidth;
      final double cellSize = gridSize / board.size;

      return GestureDetector(
        onPanStart: (details) => _handlePanUpdate(details.localPosition, cellSize, board.size, notifier, true),
        onPanUpdate: (details) => _handlePanUpdate(details.localPosition, cellSize, board.size, notifier, false),
        onPanEnd: (_) => notifier.endSelection(),
        child: Container(
          width: gridSize,
          height: gridSize,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(color: theme.colorScheme.onSurface, width: 2),
            borderRadius: BorderRadius.zero,
          ),
          child: Stack(
            children: [
              _buildFoundLines(state, cellSize, theme),
              _buildSelectionLine(state, cellSize, theme),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: board.size,
                ),
                itemCount: board.size * board.size,
                itemBuilder: (context, index) {
                  int x = index % board.size;
                  int y = index ~/ board.size;
                  return Center(
                    child: Text(
                      board.grid[y][x],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  void _handlePanUpdate(Offset localPos, double cellSize, int size, WordSearchNotifier notifier, bool isStart) {
    int x = (localPos.dx / cellSize).floor();
    int y = (localPos.dy / cellSize).floor();

    if (x >= 0 && x < size && y >= 0 && y < size) {
      if (isStart) {
        notifier.startSelection(x, y);
      } else {
        notifier.updateSelection(x, y);
      }
    }
  }

  Widget _buildFoundLines(WordSearchState state, double cellSize, ThemeData theme) {
    return Stack(
      children: state.board!.words.where((w) => w.isFound).map((w) {
        return _buildLine(w.positions, cellSize, theme.colorScheme.onSurface.withValues(alpha: 0.15));
      }).toList(),
    );
  }

  Widget _buildSelectionLine(WordSearchState state, double cellSize, ThemeData theme) {
    if (state.selection.isEmpty) return const SizedBox.shrink();
    return _buildLine(state.selection, cellSize, theme.colorScheme.onSurface.withValues(alpha: 0.4));
  }

  Widget _buildLine(List<Point<int>> positions, double cellSize, Color color) {
    if (positions.isEmpty) return const SizedBox.shrink();
    
    final start = positions.first;
    final end = positions.last;

    return CustomPaint(
      painter: LinePainter(
        start: Offset((start.x + 0.5) * cellSize, (start.y + 0.5) * cellSize),
        end: Offset((end.x + 0.5) * cellSize, (end.y + 0.5) * cellSize),
        color: color,
        strokeWidth: cellSize * 0.8,
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_search');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('WELL DONE', style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text('All words found successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('EXIT'),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset start;
  final Offset end;
  final Color color;
  final double strokeWidth;

  LinePainter({required this.start, required this.end, required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.square // Sharp corners
      ..strokeWidth = strokeWidth;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => 
      oldDelegate.start != start || oldDelegate.end != end || oldDelegate.color != color;
}
