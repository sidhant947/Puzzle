import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'color_flood_engine.dart';
import 'color_flood_provider.dart';

class ColorFloodScreen extends ConsumerStatefulWidget {
  const ColorFloodScreen({super.key});

  @override
  ConsumerState<ColorFloodScreen> createState() => _ColorFloodScreenState();
}

class _ColorFloodScreenState extends ConsumerState<ColorFloodScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(colorFloodNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'FLOOD SUCCESS!' : 'DRY LAND...',
        message: isVictory 
            ? 'You saturated the entire grid with color!' 
            : 'You ran out of moves. Try again!',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(colorFloodNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(colorFloodNotifierProvider);
    final notifier = ref.read(colorFloodNotifierProvider.notifier);

    ref.listen(colorFloodNotifierProvider, (previous, next) async {
      if (next.status != ColorFloodStatus.playing && previous?.status == ColorFloodStatus.playing) {
        final isVictory = next.status == ColorFloodStatus.won;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('color_flood');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    return GameScaffold(
      title: l10n.colorFloodTitle,
      subtitle: l10n.colorFloodSubtitle(state.moves, state.maxMoves),
      body: state.grid.isEmpty 
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: DesignSystem.spaceXL),
                // Grid Area
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: TangibleContainer(
                      padding: const EdgeInsets.all(4),
                      radius: DesignSystem.radiusMD,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: ColorFloodNotifier.gridSize,
                          ),
                          itemCount: ColorFloodNotifier.gridSize * ColorFloodNotifier.gridSize,
                          itemBuilder: (context, index) {
                            final r = index ~/ ColorFloodNotifier.gridSize;
                            final c = index % ColorFloodNotifier.gridSize;
                            final colorIndex = state.grid[r][c];
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              color: ColorFloodEngine.colors[colorIndex],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // Controls Area
                Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(ColorFloodEngine.colors.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.changeColor(index);
                        },
                        child: AnimatedScale(
                          scale: state.grid.isNotEmpty && state.grid[0][0] == index ? 1.2 : 1.0,
                          duration: const Duration(milliseconds: 200),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: TangibleContainer(
                              radius: DesignSystem.radiusFull,
                              color: ColorFloodEngine.colors[index],
                              depth: 4,
                              child: const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: DesignSystem.space2XL),
              ],
            ),
    );
  }
}
