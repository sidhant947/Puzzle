import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_search_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

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
    final isDark = theme.brightness == Brightness.dark;

    ref.listen(wordSearchNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref, theme);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'WORD SEARCH',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.initGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: state.board == null
          ? Center(child: CircularProgressIndicator(color: theme.colorScheme.primary))
          : SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: DesignSystem.spaceLG),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
                    child: Column(
                      children: [
                        Text(
                          'GRID SCAN',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: DesignSystem.spaceSM),
                        Text(
                          'Scan the grid in any direction to find the hidden words listed below.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: _buildGrid(state, notifier, theme, isDark),
                      ),
                    ),
                  ),
                  _buildWordList(state, theme, isDark),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _buildWordList(WordSearchState state, ThemeData theme, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.03),
        border: Border.symmetric(horizontal: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.1), width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORDS TO FIND',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            children: state.board!.words.map((word) {
              final isFound = word.isFound;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isFound 
                      ? DesignSystem.gameGreen.withValues(alpha: 0.1) 
                      : theme.colorScheme.onSurface.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  word.word,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: isFound ? FontWeight.w500 : FontWeight.w800,
                    color: isFound 
                        ? DesignSystem.gameGreen 
                        : theme.colorScheme.onSurface,
                    decoration: isFound ? TextDecoration.lineThrough : null,
                    letterSpacing: 0.5,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(WordSearchState state, WordSearchNotifier notifier, ThemeData theme, bool isDark) {
    final board = state.board!;
    return LayoutBuilder(builder: (context, constraints) {
      final double gridSize = min(constraints.maxWidth, constraints.maxHeight);
      final double gridInternalSize = gridSize - (DesignSystem.spaceXS * 2);
      final double cellSize = gridInternalSize / board.size;

      return GestureDetector(
        onPanStart: (details) {
          HapticFeedbackUtil.gameInteraction();
          _handlePanUpdate(details.localPosition, cellSize, board.size, notifier, true);
        },
        onPanUpdate: (details) => _handlePanUpdate(details.localPosition, cellSize, board.size, notifier, false),
        onPanEnd: (_) {
          HapticFeedbackUtil.selectionClick();
          notifier.endSelection();
        },
        child: Container(
          width: gridSize,
          height: gridSize,
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          decoration: BoxDecoration(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.05),
            borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
            child: Container(
              color: theme.colorScheme.surface,
              child: Stack(
                children: [
                  _buildFoundLines(state, cellSize, theme),
                  _buildSelectionLine(state, cellSize, theme),
                  GridView.builder(
                    padding: EdgeInsets.zero,
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
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _handlePanUpdate(Offset localPos, double cellSize, int size, WordSearchNotifier notifier, bool isStart) {
    // Adjust for padding
    double xPos = localPos.dx - DesignSystem.spaceXS;
    double yPos = localPos.dy - DesignSystem.spaceXS;
    
    int x = (xPos / cellSize).floor();
    int y = (yPos / cellSize).floor();

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
        return _buildLine(w.positions, cellSize, DesignSystem.gameGreen.withValues(alpha: 0.2));
      }).toList(),
    );
  }

  Widget _buildSelectionLine(WordSearchState state, double cellSize, ThemeData theme) {
    if (state.selection.isEmpty) return const SizedBox.shrink();
    return _buildLine(state.selection, cellSize, theme.colorScheme.primary.withValues(alpha: 0.3));
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
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        title: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceMD),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: theme.colorScheme.primary,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'WELL DONE',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        content: Text(
          'All words found successfully with keen observation.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('CONTINUE'),
              ),
            ),
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
    // Outer soft glow
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth + 6
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    canvas.drawLine(start, end, glowPaint);

    // Main highlight line
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawLine(start, end, paint);
    
    // Subtle border for definition
    final borderPaint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    // We don't use drawLine for border because it's just a line, 
    // but we can draw the same line with a slightly different width if we wanted an outline effect.
    // Instead of a full outline, let's just stick to the glow and main line for now as it's cleaner.
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => 
      oldDelegate.start != start || oldDelegate.end != end || oldDelegate.color != color;
}