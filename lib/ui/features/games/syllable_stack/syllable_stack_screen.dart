import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'syllable_stack_provider.dart';

class SyllableStackScreen extends ConsumerStatefulWidget {
  const SyllableStackScreen({super.key});

  @override
  ConsumerState<SyllableStackScreen> createState() => _SyllableStackScreenState();
}

class _SyllableStackScreenState extends ConsumerState<SyllableStackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syllableStackNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(syllableStackNotifierProvider);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gameOver.toUpperCase(),
        message: 'You stacked up a score of ${state.score}!',
        isVictory: state.score > 0,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(syllableStackNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(syllableStackNotifierProvider);
    final notifier = ref.read(syllableStackNotifierProvider.notifier);

    ref.listen(syllableStackNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('syllable_stack');
        _showCompletionDialog();
      }
      if (next.lastCheck == true && previous?.lastCheck != true) {
        HapticFeedbackUtil.success();
      } else if (next.lastCheck == false && previous?.lastCheck != false) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: 'Syllable Stack',
      subtitle: 'Stack syllables to form words',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Score: ${state.score}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 10 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Stack area
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.currentStack.isEmpty)
                  Text(
                    'START STACKING',
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 32,
                      color: colorScheme.onSurface.withValues(alpha: 0.2),
                    ),
                  ),
                ...List.generate(state.currentStack.length, (index) {
                  final syllable = state.currentStack[index];
                  final isLast = index == state.currentStack.length - 1;
                  Color? bgColor;
                  if (state.lastCheck == true) bgColor = DesignSystem.gameGreen;
                  if (state.lastCheck == false) bgColor = DesignSystem.error;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: TangibleContainer(
                      color: bgColor ?? DesignSystem.gameIndigo,
                      width: 150,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          syllable,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const Spacer(),
          // Controls
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TangibleButton(
                  onTap: notifier.undoLast,
                  color: DesignSystem.gameOrange,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Icon(Icons.undo_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Syllable options
          Container(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: List.generate(state.remainingSyllables.length, (index) {
                return TangibleButton(
                  onTap: () => notifier.addSyllable(index),
                  color: colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      state.remainingSyllables[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
        ],
      ),
    );
  }
}
