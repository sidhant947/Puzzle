import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_ladder_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';
import '../../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class WordLadderScreen extends ConsumerWidget {
  const WordLadderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(wordLadderNotifierProvider);
    final notifier = ref.read(wordLadderNotifierProvider.notifier);

    ref.listen(wordLadderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: l10n.wordLadderTitle.toUpperCase(),
      subtitle: l10n.wordLadderSubtitle,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildWordBadge(state.startWord, true),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.arrow_forward_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7), size: 18),
                    ),
                    _buildWordBadge(state.endWord, false),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.03),
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.4),
                  child: _buildLadder(state),
                ),
              ),
              if (state.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: DesignSystem.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                      border: Border.all(color: DesignSystem.error.withValues(alpha: 0.3), width: 1),
                    ),
                    child: Text(
                      state.errorMessage!.toUpperCase(),
                      style: const TextStyle(
                        color: DesignSystem.error,
                        fontWeight: FontWeight.w900,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
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

  Widget _buildWordBadge(String word, bool isStart) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      radius: DesignSystem.radiusMD,
      depth: 2,
      color: isStart ? DesignSystem.primary : DesignSystem.accentBerry,
      shadowColor: isStart ? DesignSystem.primaryShadow : const Color(0xFFBE185D),
      child: Text(
        word.toUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildLadder(WordLadderState state) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      itemCount: state.ladder.length,
      itemBuilder: (context, index) {
        final word = state.ladder[index];
        final isLast = index == state.ladder.length - 1;
        return Column(
          children: [
            TangibleContainer(
              padding: const EdgeInsets.symmetric(vertical: 8),
              radius: DesignSystem.radiusSM,
              color: isLast ? Theme.of(context).colorScheme.surface : Theme.of(context).scaffoldBackgroundColor,
              depth: isLast ? 2.0 : 1.0,
              child: Center(
                child: Text(
                  word.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: isLast ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.5),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            if (index < state.ladder.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Icon(Icons.link_rounded, color: Theme.of(context).colorScheme.outline, size: 16),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCurrentInput(BuildContext context, WordLadderState state, BoxConstraints constraints) {
    final boxSize = (constraints.maxWidth * 0.12).clamp(35.0, 50.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (i) {
          String letter = i < state.currentGuess.length ? state.currentGuess[i] : '';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeyboard(BuildContext context, WordLadderState state, WordLadderNotifier notifier, BoxConstraints constraints) {
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
                    ? const Icon(Icons.backspace_rounded, size: 14, color: Colors.white) 
                    : FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            key, 
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontSize: (key == 'ENTER' || key == 'DEL') ? 9 : 13,
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

  void _showGameOverDialog(BuildContext context, WidgetRef ref, WordLadderState state) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_ladder', xpAmount: 35);

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CONGRATS',
        message: 'You successfully connected ${state.startWord} to ${state.endWord} in ${state.ladder.length} steps.',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(wordLadderNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
