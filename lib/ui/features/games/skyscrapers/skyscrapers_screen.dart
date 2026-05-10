import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
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

    ref.listen(skyscrapersNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'SKYSCRAPERS',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const SizedBox(height: DesignSystem.spaceSM),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: const TangibleContainer(
                        depth: 3.0, // Reduced from 4.0
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          'Place buildings 1-4. Edge clues show visible buildings!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: DesignSystem.outline,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    _buildSkyscraperGrid(state, notifier, constraints.maxHeight * 0.55),
                    const Spacer(),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildSkyscraperGrid(SkyscrapersState state, SkyscrapersNotifier notifier, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              // Top Clues
              Row(
                children: [
                  const SizedBox(width: 36), // Reduced from 44
                  for (int i = 0; i < 4; i++)
                    Expanded(child: _buildClue(state.clues['top']![i])),
                  const SizedBox(width: 36), 
                ],
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Row(
                  children: [
                    // Left Clues
                    SizedBox(
                      width: 36,
                      child: Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Expanded(child: _buildClue(state.clues['left']![i])),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    // Main Grid
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0, // Reduced from 6.0
                        color: DesignSystem.ink,
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: List.generate(4, (r) => Expanded(
                            child: Row(
                              children: List.generate(4, (c) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: GestureDetector(
                                    onTap: () => notifier.toggleCell(r, c),
                                    child: TangibleContainer(
                                      depth: state.userGrid[r][c] == 0 ? 3.0 : 0.0,
                                      color: state.userGrid[r][c] == 0 ? DesignSystem.surface : DesignSystem.primary,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: FittedBox(
                                            child: Text(
                                              state.userGrid[r][c] == 0 ? '' : state.userGrid[r][c].toString(),
                                              style: TextStyle(
                                                fontSize: 18, // Reduced from 24
                                                color: state.userGrid[r][c] == 0 ? DesignSystem.ink : Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
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
                    const SizedBox(width: 6),
                    // Right Clues
                    SizedBox(
                      width: 36,
                      child: Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Expanded(child: _buildClue(state.clues['right']![i])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              // Bottom Clues
              Row(
                children: [
                  const SizedBox(width: 36),
                  for (int i = 0; i < 4; i++)
                    Expanded(child: _buildClue(state.clues['bottom']![i])),
                  const SizedBox(width: 36),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClue(int value) {
    if (value == 0) return const SizedBox();
    return Center(
      child: TangibleContainer(
        depth: 1.5, // Reduced from 2.0
        color: DesignSystem.surface,
        padding: const EdgeInsets.all(6),
        radius: 6,
        child: Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: DesignSystem.accentBerry,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

}
