import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'pixel_mimic_provider.dart';

class PixelMimicScreen extends ConsumerStatefulWidget {
  const PixelMimicScreen({super.key});

  @override
  ConsumerState<PixelMimicScreen> createState() => _PixelMimicScreenState();
}

class _PixelMimicScreenState extends ConsumerState<PixelMimicScreen> {
  final List<Color> _colors = [
    Colors.transparent,
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gameAmber,
    DesignSystem.gameRose,
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(pixelMimicNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('pixel_mimic');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MIMIC MASTER!' : 'PATTERN MISMATCH',
        message: won ? 'Perfect memory!' : 'Try again.',
        onPlayAgain: () {
          ref.read(pixelMimicNotifierProvider.notifier).initGame();
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
    final state = ref.watch(pixelMimicNotifierProvider);
    final notifier = ref.read(pixelMimicNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(pixelMimicNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'PIXEL MIMIC',
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(state.isShowingPattern ? 'Memorize this pattern!' : 'Recreate the pattern!'),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: 16,
                          itemBuilder: (context, index) {
                            final r = index ~/ 4;
                            final c = index % 4;
                            final colorId = state.isShowingPattern ? state.targetGrid[r][c] : state.userGrid[r][c];
                            return GestureDetector(
                              onTap: () => notifier.onTileTapped(r, c),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _colors[colorId].withValues(alpha: colorId == 0 ? 0.1 : 1.0),
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                  border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (!state.isShowingPattern) ...[
                    // Color Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final colorId = index + 1;
                        final isSelected = state.selectedColor == colorId;
                        return GestureDetector(
                          onTap: () => notifier.selectColor(colorId),
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: _colors[colorId],
                              shape: BoxShape.circle,
                              border: isSelected ? Border.all(color: theme.colorScheme.primary, width: 3) : null,
                              boxShadow: isSelected ? [BoxShadow(color: theme.colorScheme.primary.withValues(alpha: 0.3), blurRadius: 10)] : null,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: notifier.submitMimic,
                      style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                      child: const Text('SUBMIT'),
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
