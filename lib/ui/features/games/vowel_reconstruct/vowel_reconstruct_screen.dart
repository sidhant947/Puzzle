import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'vowel_reconstruct_provider.dart';

class VowelReconstructScreen extends ConsumerStatefulWidget {
  const VowelReconstructScreen({super.key});

  @override
  ConsumerState<VowelReconstructScreen> createState() => _VowelReconstructScreenState();
}

class _VowelReconstructScreenState extends ConsumerState<VowelReconstructScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(vowelReconstructNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(vowelReconstructNotifierProvider);
    
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
          ref.read(vowelReconstructNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(vowelReconstructNotifierProvider);
    final notifier = ref.read(vowelReconstructNotifierProvider.notifier);

    ref.listen(vowelReconstructNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('vowel_reconstruct');
        _showCompletionDialog();
      }
      if (next.lastCheck == true && previous?.lastCheck != true) {
        HapticFeedbackUtil.success();
      } else if (next.lastCheck == false && previous?.lastCheck != false) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: 'Vowel Reconstruct',
      subtitle: 'Fill in the missing vowels',
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
          // Vowel Keyboard
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: ['A', 'E', 'I', 'O', 'U'].map((vowel) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TangibleButton(
                          onTap: () => notifier.addVowel(vowel),
                          color: DesignSystem.gameAmber,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                vowel,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
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

  Widget _buildMaskedSentence(VowelReconstructState state) {
    if (state.puzzle == null) return const SizedBox.shrink();

    final masked = state.puzzle!.maskedSentence;
    List<Widget> spans = [];
    int vowelIndex = 0;

    for (int i = 0; i < masked.length; i++) {
      if (masked[i] == '_') {
        final hasUserVowel = vowelIndex < state.userVowels.length;
        final userVowel = hasUserVowel ? state.userVowels[vowelIndex] : '';
        final isCorrect = state.lastCheck == true || (hasUserVowel && state.lastCheck == false && userVowel == state.puzzle!.vowels[vowelIndex]);
        final isWrong = state.lastCheck == false && hasUserVowel && userVowel != state.puzzle!.vowels[vowelIndex];

        spans.add(
          Container(
            width: 20,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isWrong ? DesignSystem.error : (isCorrect ? DesignSystem.gameGreen : Colors.grey),
                  width: 2,
                ),
              ),
            ),
            child: Text(
              userVowel,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: isWrong ? DesignSystem.error : (isCorrect ? DesignSystem.gameGreen : Colors.blue),
              ),
            ),
          ),
        );
        vowelIndex++;
      } else {
        spans.add(
          Text(
            masked[i],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }
    }

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 2,
      runSpacing: 8,
      children: spans,
    );
  }
}
