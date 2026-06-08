import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'consonant_reconstruct_provider.dart';

class ConsonantReconstructScreen extends ConsumerStatefulWidget {
  const ConsonantReconstructScreen({super.key});

  @override
  ConsumerState<ConsonantReconstructScreen> createState() => _ConsonantReconstructScreenState();
}

class _ConsonantReconstructScreenState extends ConsumerState<ConsonantReconstructScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(consonantReconstructNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(consonantReconstructNotifierProvider);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gameOver.toUpperCase(),
        message: 'You reconstructed a score of ${state.score}!',
        isVictory: state.score > 0,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(consonantReconstructNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(consonantReconstructNotifierProvider);
    final notifier = ref.read(consonantReconstructNotifierProvider.notifier);

    ref.listen(consonantReconstructNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('consonant_reconstruct');
        _showCompletionDialog();
      }
      if (next.lastCheck == true && previous?.lastCheck != true) {
        HapticFeedbackUtil.success();
      } else if (next.lastCheck == false && previous?.lastCheck != false) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: 'Consonant Reconstruct',
      subtitle: 'Fill in the missing consonants',
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
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: _buildMaskedSentence(state),
              ),
            ),
          ),
          // Consonant Keyboard
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                _buildKeyboardRow(['Q', 'W', 'R', 'T', 'P', 'S', 'D'], notifier),
                const SizedBox(height: 8),
                _buildKeyboardRow(['F', 'G', 'H', 'J', 'K', 'L', 'Z'], notifier),
                const SizedBox(height: 8),
                _buildKeyboardRow(['X', 'C', 'V', 'B', 'N', 'M', 'Y'], notifier),
                const SizedBox(height: DesignSystem.spaceSM),
                TangibleButton(
                  onTap: notifier.backspace,
                  color: DesignSystem.error,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Center(
                    child: FittedBox(
                      child: Icon(Icons.backspace_rounded, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> chars, ConsonantReconstructNotifier notifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chars.map((char) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: TangibleButton(
              onTap: () => notifier.addConsonant(char),
              color: DesignSystem.gamePurple,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: FittedBox(
                  child: Text(
                    char,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMaskedSentence(ConsonantReconstructState state) {
    if (state.puzzle == null) return const SizedBox.shrink();

    final masked = state.puzzle!.maskedSentence;
    List<Widget> spans = [];
    int consonantIndex = 0;

    for (int i = 0; i < masked.length; i++) {
      if (masked[i] == '_') {
        final hasUserConsonant = consonantIndex < state.userConsonants.length;
        final userConsonant = hasUserConsonant ? state.userConsonants[consonantIndex] : '';
        final isCorrect = state.lastCheck == true || (hasUserConsonant && state.lastCheck == false && userConsonant == state.puzzle!.consonants[consonantIndex]);
        final isWrong = state.lastCheck == false && hasUserConsonant && userConsonant != state.puzzle!.consonants[consonantIndex];

        spans.add(
          Container(
            width: 18,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isWrong ? DesignSystem.error : (isCorrect ? DesignSystem.gameGreen : Colors.grey),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              userConsonant,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: isWrong ? DesignSystem.error : (isCorrect ? DesignSystem.gameGreen : Colors.blue),
              ),
            ),
          ),
        );
        consonantIndex++;
      } else {
        spans.add(
          Text(
            masked[i],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 1,
      runSpacing: 6,
      children: spans,
    );
  }
}
