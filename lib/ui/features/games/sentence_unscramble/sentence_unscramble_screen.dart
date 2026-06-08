import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'sentence_unscramble_provider.dart';

class SentenceUnscrambleScreen extends ConsumerStatefulWidget {
  const SentenceUnscrambleScreen({super.key});

  @override
  ConsumerState<SentenceUnscrambleScreen> createState() => _SentenceUnscrambleScreenState();
}

class _SentenceUnscrambleScreenState extends ConsumerState<SentenceUnscrambleScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sentenceUnscrambleNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(sentenceUnscrambleNotifierProvider);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gameOver.toUpperCase(),
        message: 'You unscrambled a score of ${state.score}!',
        isVictory: state.score > 0,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(sentenceUnscrambleNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(sentenceUnscrambleNotifierProvider);
    final notifier = ref.read(sentenceUnscrambleNotifierProvider.notifier);

    ref.listen(sentenceUnscrambleNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sentence_unscramble');
        _showCompletionDialog();
      }
      if (next.lastCheck == true && previous?.lastCheck != true) {
        HapticFeedbackUtil.success();
      } else if (next.lastCheck == false && previous?.lastCheck != false) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: 'Sentence Unscramble',
      subtitle: 'Reorder words to form a sentence',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'SCORE: ${state.score}',
                        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'TIME: ${state.timeLeft}S',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: state.timeLeft < 15 ? DesignSystem.error : colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: DesignSystem.spaceMD),
          
          // CONSTRUCTION AREA (Target Zone)
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              child: TangibleContainer(
                width: double.infinity,
                color: colorScheme.surface,
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.edit_note_rounded, size: 20, color: colorScheme.onSurface.withValues(alpha: 0.4)),
                        const SizedBox(width: 8),
                        Text(
                          'CONSTRUCTED SENTENCE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            color: colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 12,
                            alignment: WrapAlignment.center,
                            children: List.generate(state.currentWords.length, (index) {
                              Color? bgColor;
                              if (state.lastCheck == true) bgColor = DesignSystem.gameGreen;
                              if (state.lastCheck == false) bgColor = DesignSystem.error;

                              return TangibleButton(
                                onTap: () => notifier.removeWord(index),
                                color: bgColor ?? DesignSystem.gameBlue,
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                radius: DesignSystem.radiusSM,
                                child: IntrinsicWidth(
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        state.currentWords[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: DesignSystem.spaceLG),
          
          // WORD TRAY (Available Words)
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(DesignSystem.radiusXL)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'WORD TRAY',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(DesignSystem.spaceMD),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.2,
                      ),
                      itemCount: state.availableWords.length,
                      itemBuilder: (context, index) {
                        return TangibleButton(
                          onTap: () => notifier.addWord(index),
                          color: colorScheme.surface,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          radius: DesignSystem.radiusSM,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                state.availableWords[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
