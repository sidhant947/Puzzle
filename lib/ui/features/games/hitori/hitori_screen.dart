import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'hitori_provider.dart';

class HitoriScreen extends ConsumerStatefulWidget {
  const HitoriScreen({super.key});

  @override
  ConsumerState<HitoriScreen> createState() => _HitoriScreenState();
}

class _HitoriScreenState extends ConsumerState<HitoriScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(hitoriNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('hitori');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'LOGIC ASCENDED!' : 'CLASHING NUMBERS',
        message: won ? 'You eliminated all duplicates.' : 'Try again.',
        onPlayAgain: () {
          ref.read(hitoriNotifierProvider.notifier).initGame();
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
    final state = ref.watch(hitoriNotifierProvider);
    final notifier = ref.read(hitoriNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(hitoriNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'HITORI',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text('Paint out cells to leave no duplicate numbers in any row or column!'),
                    const Spacer(),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: List.generate(5, (r) => Expanded(
                            child: Row(
                              children: List.generate(5, (c) => Expanded(
                                child: GestureDetector(
                                  onTap: () => notifier.toggleCell(r, c),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    decoration: BoxDecoration(
                                      color: state.painted[r][c] 
                                        ? theme.colorScheme.onSurface 
                                        : theme.colorScheme.surface,
                                      border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.grid[r][c].toString(),
                                        style: theme.textTheme.headlineSmall?.copyWith(
                                          color: state.painted[r][c] 
                                            ? theme.colorScheme.surface 
                                            : theme.colorScheme.onSurface,
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
                    const Spacer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
    );
  }
}
