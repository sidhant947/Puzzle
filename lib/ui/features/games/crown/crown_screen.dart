import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'crown_provider.dart';
import '../../../../../providers/user_providers.dart';

class CrownScreen extends ConsumerStatefulWidget {
  const CrownScreen({super.key});

  @override
  ConsumerState<CrownScreen> createState() => _CrownScreenState();
}

class _CrownScreenState extends ConsumerState<CrownScreen> {
  final List<Color> _regionColors = [
    const Color(0xFFFFD1D1), // Light Red
    const Color(0xFFD1E9FF), // Light Blue
    const Color(0xFFD1FFD1), // Light Green
    const Color(0xFFFFEDD1), // Light Orange
    const Color(0xFFE9D1FF), // Light Purple
    const Color(0xFFD1FFFF), // Light Teal
    const Color(0xFFFFD1F5), // Light Pink
    const Color(0xFFFFF6D1), // Light Amber
    const Color(0xFFD1D1FF), // Light Indigo
  ];

  final List<Color> _regionColorsDark = [
    const Color(0xFF4A1D1D),
    const Color(0xFF1D3B4A),
    const Color(0xFF1D4A1D),
    const Color(0xFF4A3D1D),
    const Color(0xFF3B1D4A),
    const Color(0xFF1D4A4A),
    const Color(0xFF4A1D42),
    const Color(0xFF4A461D),
    const Color(0xFF1D1D4A),
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

              // Check neighbors to draw thick borders between regions
              bool borderTop = y > 0 && board.regions[y-1][x] != regionId;
              bool borderBottom = y < board.size - 1 && board.regions[y+1][x] != regionId;
              bool borderLeft = x > 0 && board.regions[y][x-1] != regionId;
              bool borderRight = x < board.size - 1 && board.regions[y][x+1] != regionId;

              final Color regionColor = theme.brightness == Brightness.light
                  ? _regionColors[regionId % _regionColors.length]
                  : _regionColorsDark[regionId % _regionColorsDark.length];

              return GestureDetector(
                onTap: () => notifier.toggleCrown(x, y),
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
