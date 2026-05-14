import "package:puzzle/l10n/app_localizations.dart";
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_search_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(wordSearchNotifierProvider);
    final notifier = ref.read(wordSearchNotifierProvider.notifier);

    ref.listen(wordSearchNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.wordSearchTitle.toUpperCase(),
      subtitle: l10n.wordSearchSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.board == null
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.primary))
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    _buildGrid(state, notifier, constraints.maxHeight * 0.45),
                    const Spacer(),
                    _buildWordList(state),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildWordList(WordSearchState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.symmetric(horizontal: BorderSide(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5), width: 1.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'WORDS TO FIND',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: state.board!.words.map((word) {
              final isFound = word.isFound;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isFound 
                      ? DesignSystem.success.withValues(alpha: 0.1) 
                      : Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                  border: Border.all(
                    color: isFound ? DesignSystem.success : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  word.word.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isFound ? FontWeight.w500 : FontWeight.w900,
                    color: isFound 
                        ? DesignSystem.success 
                        : Theme.of(context).colorScheme.onSurface,
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

  Widget _buildGrid(WordSearchState state, WordSearchNotifier notifier, double maxHeight) {
    final board = state.board!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: LayoutBuilder(builder: (context, constraints) {
          final double gridSize = min(constraints.maxWidth, constraints.maxHeight);
          final double gridInternalSize = gridSize - (8.0); // Adjust for bezel
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
            child: TangibleContainer(
              color: Theme.of(context).colorScheme.onSurface,
              shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              radius: DesignSystem.radiusMD,
              depth: 4.0, // Reduced from 6.0
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: Stack(
                        children: [
                          _buildFoundLines(state, cellSize),
                          _buildSelectionLine(state, cellSize),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: FittedBox(
                                    child: Text(
                                      board.grid[y][x].toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16, // Reduced from 18
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    ),
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
              ),
            ),
          );
        }),
      ),
    );
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

  Widget _buildFoundLines(WordSearchState state, double cellSize) {
    return Stack(
      children: state.board!.words.where((w) => w.isFound).map((w) {
        return _buildLine(w.positions, cellSize, DesignSystem.success.withValues(alpha: 0.3));
      }).toList(),
    );
  }

  Widget _buildSelectionLine(WordSearchState state, double cellSize) {
    if (state.selection.isEmpty) return const SizedBox.shrink();
    return _buildLine(state.selection, cellSize, DesignSystem.primary.withValues(alpha: 0.3));
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
        strokeWidth: cellSize * 0.7,
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_search');

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
          ref.read(wordSearchNotifierProvider.notifier).initGame();
          Navigator.of(context).pop();
        },
        message: 'All words found successfully with keen observation.',
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
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) => 
      oldDelegate.start != start || oldDelegate.end != end || oldDelegate.color != color;
}
