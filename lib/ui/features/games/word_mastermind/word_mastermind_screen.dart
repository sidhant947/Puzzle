import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
      title: l10n.wordMastermindTitle.toUpperCase(),
      subtitle: l10n.wordMastermindSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
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
              _buildCurrentInput(context, state, constraints),
              _buildKeyboard(context, state, notifier, constraints),
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
                style: TextStyle(fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7), fontSize: 11),
              ),
              const SizedBox(width: 8),
              ...guess.guess.split('').map((l) => _buildLetterTile(context, l)),
              const Spacer(),
              _buildStatIndicator(context, guess.bulls, DesignSystem.success, 'B'),
              const SizedBox(width: 8),
              _buildStatIndicator(context, guess.cows, DesignSystem.accentAmber, 'C'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLetterTile(BuildContext context, String letter) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
      ),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
      ),
    );
  }

  Widget _buildStatIndicator(BuildContext context, int count, Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
      ),
      child: Row(
        children: [
          Text('$count', style: TextStyle(fontWeight: FontWeight.w900, color: color, fontSize: 12)),
          SizedBox(width: 2),
          Text(label, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
        ],
      ),
    );
  }

  Widget _buildCurrentInput(BuildContext context, WordMastermindState state, BoxConstraints constraints) {
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
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: letter.isNotEmpty ? DesignSystem.primary : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                width: letter.isNotEmpty ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              boxShadow: [
                if (letter.isNotEmpty)
                  BoxShadow(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
              ],
            ),
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  letter.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeyboard(BuildContext context, WordMastermindState state, WordMastermindNotifier notifier, BoxConstraints constraints) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['DEL', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'ENTER'],
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
                color: (key == 'ENTER' || key == 'DEL') ? DesignSystem.primary : Theme.of(context).colorScheme.surface,
                shadowColor: (key == 'ENTER' || key == 'DEL') ? DesignSystem.primaryShadow : Theme.of(context).colorScheme.outline,
                depth: 2,
                padding: EdgeInsets.zero,
                child: Container(
                  height: keyHeight,
                  alignment: Alignment.center,
                  child: key == 'DEL' 
                    ? const Icon(Icons.backspace_rounded, size: 16, color: Colors.white) 
                    : FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            key, 
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontSize: (key == 'ENTER' || key == 'DEL') ? 9 : 11,
                              color: (key == 'ENTER' || key == 'DEL') ? Colors.white : Theme.of(context).colorScheme.onSurface,
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
