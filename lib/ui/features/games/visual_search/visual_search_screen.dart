import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'visual_search_provider.dart';

class VisualSearchScreen extends ConsumerStatefulWidget {
  const VisualSearchScreen({super.key});

  @override
  ConsumerState<VisualSearchScreen> createState() => _VisualSearchScreenState();
}

class _VisualSearchScreenState extends ConsumerState<VisualSearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(visualSearchNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'AMAZING!' : 'GAME OVER',
        message: isVictory 
            ? 'Your visual acuity is top-notch!' 
            : 'Focus and try again.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(visualSearchNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(visualSearchNotifierProvider);
    final notifier = ref.read(visualSearchNotifierProvider.notifier);

    ref.listen(visualSearchNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('visual_search');
          _showCompletionDialog(true);
        } else {
          HapticFeedbackUtil.vibrate();
          _showCompletionDialog(false);
        }
      } else if (next.score > (previous?.score ?? 0)) {
        HapticFeedbackUtil.selectionClick();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.visualSearchTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Visual Search',
      subtitle: l10n.visualSearchSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusMD,
                  color: colorScheme.surface,
                  child: Text(
                    'SCORE: ${state.score}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: state.gridSize,
                      crossAxisSpacing: DesignSystem.spaceSM,
                      mainAxisSpacing: DesignSystem.spaceSM,
                    ),
                    itemCount: state.symbols.length,
                    itemBuilder: (context, index) {
                      return TangibleButton(
                        onTap: () => notifier.onTileTap(index),
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        padding: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            state.symbols[index],
                            style: TextStyle(
                              color: colorScheme.onSurface,
                              fontSize: _getFontSize(state.gridSize),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  double _getFontSize(int gridSize) {
    if (gridSize <= 4) return 32;
    if (gridSize <= 5) return 24;
    if (gridSize <= 6) return 20;
    return 16;
  }
}
