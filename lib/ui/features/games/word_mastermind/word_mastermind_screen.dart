import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_mastermind_provider.dart';
import 'word_mastermind_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class WordMastermindScreen extends ConsumerWidget {
  const WordMastermindScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wordMastermindNotifierProvider);
    final notifier = ref.read(wordMastermindNotifierProvider.notifier);

    ref.listen(wordMastermindNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.heavyImpact();
        }
        _showGameOverDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: 'WORD MASTERMIND',
      subtitle: 'Crack the 4-letter code! Bulls (B) are perfect spots, Cows (C) are wrong spots.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.02),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.4),
                  child: _buildGuessList(state),
                ),
              ),
              _buildCurrentInput(state, constraints),
              _buildKeyboard(state, notifier, constraints),
              SizedBox(height: constraints.maxHeight * 0.02),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGuessList(WordMastermindState state) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: state.guesses.length,
      itemBuilder: (context, index) {
        final guess = state.guesses[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Text(
                '${index + 1}.',
                style: const TextStyle(fontWeight: FontWeight.w900, color: DesignSystem.inkSlate, fontSize: 11),
              ),
              const SizedBox(width: 8),
              ...guess.guess.split('').map((l) => _buildLetterTile(l)),
              const Spacer(),
              _buildStatIndicator(guess.bulls, DesignSystem.success, 'B'),
              const SizedBox(width: 8),
              _buildStatIndicator(guess.cows, DesignSystem.accentAmber, 'C'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLetterTile(String letter) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: DesignSystem.surface,
        border: Border.all(color: DesignSystem.outline),
        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
      ),
      child: Text(
        letter.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.w900, color: DesignSystem.ink, fontSize: 12),
      ),
    );
  }

  Widget _buildStatIndicator(int count, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
      ),
      child: Row(
        children: [
          Text('$count', style: TextStyle(fontWeight: FontWeight.w900, color: color, fontSize: 12)),
          const SizedBox(width: 2),
          Text(label, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: DesignSystem.inkSlate)),
        ],
      ),
    );
  }

  Widget _buildCurrentInput(WordMastermindState state, BoxConstraints constraints) {
    final boxSize = (constraints.maxWidth * 0.12).clamp(35.0, 50.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(WordMastermindEngine.wordLength, (i) {
          String letter = i < state.currentGuess.length ? state.currentGuess[i] : '';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: boxSize,
            height: boxSize * 1.2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DesignSystem.surface,
              border: Border.all(
                color: letter.isNotEmpty ? DesignSystem.primary : DesignSystem.outline,
                width: letter.isNotEmpty ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              boxShadow: [
                if (letter.isNotEmpty)
                  BoxShadow(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  letter.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: DesignSystem.ink),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeyboard(WordMastermindState state, WordMastermindNotifier notifier, BoxConstraints constraints) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    final keyHeight = (constraints.maxHeight * 0.06).clamp(36.0, 48.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: rows.map((row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((key) => Expanded(
            flex: (key == 'ENTER' || key == 'DEL') ? 3 : 2,
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  if (key == 'ENTER') {
                    notifier.submitGuess();
                  } else if (key == 'DEL') {
                    notifier.removeLetter();
                  } else {
                    notifier.addLetter(key);
                  }
                },
                color: (key == 'ENTER' || key == 'DEL') ? DesignSystem.inkSlate : DesignSystem.surface,
                shadowColor: (key == 'ENTER' || key == 'DEL') ? DesignSystem.ink : DesignSystem.outlineVariant,
                depth: 2,
                padding: EdgeInsets.zero,
                child: Container(
                  height: keyHeight,
                  alignment: Alignment.center,
                  child: key == 'DEL' 
                    ? const Icon(Icons.backspace_rounded, size: 16, color: DesignSystem.ink) 
                    : FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            key, 
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontSize: (key == 'ENTER' || key == 'DEL') ? 9 : 11,
                              color: (key == 'ENTER' || key == 'DEL') ? Colors.white : DesignSystem.ink,
                            )
                          ),
                        ),
                      ),
                ),
              ),
            ),
          )).toList(),
        )).toList(),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, WordMastermindState state) async {
    if (state.isGameWon) {
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_mastermind', xpAmount: 40);

      if (!context.mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          onHome: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          onPlayAgain: () {
            ref.read(wordMastermindNotifierProvider.notifier).reset();
            Navigator.of(context).pop();
          },
          title: 'SOLVED!',
          message: 'You mastered the code!\nThe word was: ${state.targetWord}',
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: false,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(wordMastermindNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
        title: 'OUT OF TRIES',
        message: 'The hidden word was: ${state.targetWord.toUpperCase()}',
      ),
    );
  }
}
