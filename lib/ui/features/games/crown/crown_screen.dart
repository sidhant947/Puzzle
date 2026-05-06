import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/ui/features/games/crown/crown_provider.dart';
import '../../../../../providers/user_providers.dart';

class CrownScreen extends ConsumerStatefulWidget {
  const CrownScreen({super.key});

  @override
  ConsumerState<CrownScreen> createState() => _CrownScreenState();
}

class _CrownScreenState extends ConsumerState<CrownScreen> {
  final List<Color> _regionColors = [
    const Color(0xFFE57373), // Red
    const Color(0xFF64B5F6), // Blue
    const Color(0xFF81C784), // Green
    const Color(0xFFFFB74D), // Orange
    const Color(0xFFBA68C8), // Purple
    const Color(0xFF4DB6AC), // Teal
    const Color(0xFFF06292), // Pink
    const Color(0xFFFFD54F), // Amber
    const Color(0xFF7986CB), // Indigo
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crownNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crownNotifierProvider);
    final notifier = ref.read(crownNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(crownNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref, theme);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('CROWN'),
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
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text(
                      'PLACE ONE CROWN IN EACH ROW, COLUMN, AND REGION.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10, 
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildGrid(state, notifier, theme),
                  const Spacer(flex: 2),
                ],
              ),
            ),
    );
  }

  Widget _buildGrid(CrownState state, CrownNotifier notifier, ThemeData theme) {
    final board = state.board!;
    final marked = state.markedCells;
    return LayoutBuilder(builder: (context, constraints) {
      final double gridSize = min(constraints.maxWidth - 48, constraints.maxHeight);

      return Center(
        child: Container(
          width: gridSize,
          height: gridSize,
          decoration: BoxDecoration(
            border: Border.all(color: theme.colorScheme.onSurface, width: 2),
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: board.size,
            ),
            itemCount: board.size * board.size,
            itemBuilder: (context, index) {
              int x = index % board.size;
              int y = index ~/ board.size;
              int regionId = board.regions[y][x];
              bool hasCrown = state.crowns.any((p) => p.x == x && p.y == y);
              bool isMarked = marked.contains(Point(x, y));

              // Check neighbors to draw thick borders between regions
              bool borderTop = y > 0 && board.regions[y-1][x] != regionId;
              bool borderBottom = y < board.size - 1 && board.regions[y+1][x] != regionId;
              bool borderLeft = x > 0 && board.regions[y][x-1] != regionId;
              bool borderRight = x < board.size - 1 && board.regions[y][x+1] != regionId;

              final Color regionColor = _regionColors[regionId % _regionColors.length];

              return GestureDetector(
                onTap: () => notifier.tapCell(x, y),
                child: Container(
                  decoration: BoxDecoration(
                    color: regionColor,
                    border: Border(
                      top: BorderSide(color: theme.colorScheme.onSurface, width: borderTop ? 3.0 : 0.5),
                      bottom: BorderSide(color: theme.colorScheme.onSurface, width: borderBottom ? 3.0 : 0.5),
                      left: BorderSide(color: theme.colorScheme.onSurface, width: borderLeft ? 3.0 : 0.5),
                      right: BorderSide(color: theme.colorScheme.onSurface, width: borderRight ? 3.0 : 0.5),
                    ),
                  ),
                  child: Center(
                    child: hasCrown
                        ? Icon(Icons.workspace_premium_rounded, color: theme.colorScheme.onSurface, size: 28)
                        : isMarked
                            ? Icon(Icons.close_rounded, color: theme.colorScheme.onSurface.withValues(alpha: 0.4), size: 24)
                            : null,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crown');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: const Text('WELL DONE', style: TextStyle(fontWeight: FontWeight.w900)),
        content: const Text('All crowns placed successfully.'),
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
