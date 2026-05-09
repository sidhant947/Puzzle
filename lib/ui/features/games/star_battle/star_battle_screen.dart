import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'star_battle_provider.dart';

class StarBattleScreen extends ConsumerStatefulWidget {
  const StarBattleScreen({super.key});

  @override
  ConsumerState<StarBattleScreen> createState() => _StarBattleScreenState();
}

class _StarBattleScreenState extends ConsumerState<StarBattleScreen> {
  final List<Color> _regionColors = [
    Colors.blue.withValues(alpha: 0.1),
    Colors.red.withValues(alpha: 0.1),
    Colors.green.withValues(alpha: 0.1),
    Colors.amber.withValues(alpha: 0.1),
    Colors.purple.withValues(alpha: 0.1),
    Colors.orange.withValues(alpha: 0.1),
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(starBattleNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('star_battle');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'STELLAR LOGIC!' : 'ORBITAL CLASH',
        message: won ? 'All stars are perfectly aligned.' : 'Try again.',
        onPlayAgain: () {
          ref.read(starBattleNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(starBattleNotifierProvider);
    final notifier = ref.read(starBattleNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(starBattleNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'STAR BATTLE',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text('Place one star in every row, column, and color region! Stars cannot touch.'),
                    const Spacer(),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5), width: 2),
                        ),
                        child: Column(
                          children: List.generate(6, (r) => Expanded(
                            child: Row(
                              children: List.generate(6, (c) => Expanded(
                                child: GestureDetector(
                                  onTap: () => notifier.onTileTapped(r, c),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _regionColors[state.regions[r][c] % _regionColors.length],
                                      border: _getBorder(state.regions, r, c, theme),
                                    ),
                                    child: Center(
                                      child: _getIcon(state.userGrid[r][c], theme),
                                    ),
                                  ),
                                ),
                              )),
                            ),
                          )),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  Border _getBorder(List<List<int>> regions, int r, int c, ThemeData theme) {
    final regionId = regions[r][c];
    final color = theme.colorScheme.outline.withValues(alpha: 0.8);
    const width = 2.0;
    final lightColor = theme.colorScheme.outline.withValues(alpha: 0.1);
    const lightWidth = 0.5;

    return Border(
      top: r > 0 && regions[r - 1][c] != regionId ? BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      bottom: r < 5 && regions[r + 1][c] != regionId ? BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      left: c > 0 && regions[r][c - 1] != regionId ? BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      right: c < 5 && regions[r][c + 1] != regionId ? BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
    );
  }

  Widget? _getIcon(int type, ThemeData theme) {
    if (type == 1) return Icon(Icons.star_rounded, color: DesignSystem.gameAmber, size: 28);
    if (type == 2) return Icon(Icons.close_rounded, color: theme.colorScheme.outline.withValues(alpha: 0.3), size: 20);
    return null;
  }
}
