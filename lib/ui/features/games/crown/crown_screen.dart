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
    Colors.red.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
    Colors.teal.shade100,
    Colors.pink.shade100,
    Colors.amber.shade100,
    Colors.indigo.shade100,
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

    ref.listen(crownNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crown'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.initGame(),
          ),
        ],
      ),
      body: state.board == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'Place one crown in each row, column, and color region. Crowns cannot touch each other.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const Spacer(),
                  _buildGrid(state, notifier),
                  const Spacer(flex: 2),
                ],
              ),
            ),
    );
  }

  Widget _buildGrid(CrownState state, CrownNotifier notifier) {
    final board = state.board!;
    return LayoutBuilder(builder: (context, constraints) {
      final double gridSize = min(constraints.maxWidth - 48, constraints.maxHeight);

      return Center(
        child: Container(
          width: gridSize,
          height: gridSize,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
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

              return GestureDetector(
                onTap: () => notifier.toggleCrown(x, y),
                child: Container(
                  decoration: BoxDecoration(
                    color: _regionColors[regionId % _regionColors.length],
                    border: Border.all(color: Colors.black.withValues(alpha: 0.1), width: 0.5),
                  ),
                  child: Center(
                    child: hasCrown
                        ? const Icon(Icons.workspace_premium_rounded, color: Colors.orange, size: 32)
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

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crown');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Great Logic!'),
        content: const Text('You successfully placed all crowns!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
