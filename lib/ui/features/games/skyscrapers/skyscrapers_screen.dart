import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'skyscrapers_provider.dart';

class SkyscrapersScreen extends ConsumerStatefulWidget {
  const SkyscrapersScreen({super.key});

  @override
  ConsumerState<SkyscrapersScreen> createState() => _SkyscrapersScreenState();
}

class _SkyscrapersScreenState extends ConsumerState<SkyscrapersScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(skyscrapersNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('skyscrapers');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'PEAK PERFORMANCE!' : 'BLOCKED VIEW',
        message: won ? 'You solved the skyscraper skyline.' : 'Try again.',
        onPlayAgain: () {
          ref.read(skyscrapersNotifierProvider.notifier).initGame();
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
    final state = ref.watch(skyscrapersNotifierProvider);
    final notifier = ref.read(skyscrapersNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(skyscrapersNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'SKYSCRAPERS',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Place buildings 1-4. Edge clues show how many buildings are visible!'),
                    const Spacer(),
                    _buildSkyscraperGrid(state, notifier, theme),
                    const Spacer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildSkyscraperGrid(SkyscrapersState state, SkyscrapersNotifier notifier, ThemeData theme) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          // Top Clues
          Row(
            children: [
              const SizedBox(width: 40), // Left padding
              for (int i = 0; i < 4; i++)
                Expanded(child: Center(child: Text(state.clues['top']![i].toString(), style: const TextStyle(fontWeight: FontWeight.bold)))),
              const SizedBox(width: 40), // Right padding
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Row(
              children: [
                // Left Clues
                SizedBox(
                  width: 40,
                  child: Column(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Expanded(child: Center(child: Text(state.clues['left']![i].toString(), style: const TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
                // Main Grid
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: List.generate(4, (r) => Expanded(
                        child: Row(
                          children: List.generate(4, (c) => Expanded(
                            child: GestureDetector(
                              onTap: () => notifier.toggleCell(r, c),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
                                  color: theme.colorScheme.surface,
                                ),
                                child: Center(
                                  child: Text(
                                    state.userGrid[r][c] == 0 ? '' : state.userGrid[r][c].toString(),
                                    style: theme.textTheme.headlineSmall?.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ),
                      )),
                    ),
                  ),
                ),
                // Right Clues
                SizedBox(
                  width: 40,
                  child: Column(
                    children: [
                      for (int i = 0; i < 4; i++)
                        Expanded(child: Center(child: Text(state.clues['right']![i].toString(), style: const TextStyle(fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Bottom Clues
          Row(
            children: [
              const SizedBox(width: 40),
              for (int i = 0; i < 4; i++)
                Expanded(child: Center(child: Text(state.clues['bottom']![i].toString(), style: const TextStyle(fontWeight: FontWeight.bold)))),
              const SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}
