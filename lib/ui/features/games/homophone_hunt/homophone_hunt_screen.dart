import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'homophone_hunt_provider.dart';

class HomophoneHuntScreen extends ConsumerStatefulWidget {
  const HomophoneHuntScreen({super.key});

  @override
  ConsumerState<HomophoneHuntScreen> createState() => _HomophoneHuntScreenState();
}

class _HomophoneHuntScreenState extends ConsumerState<HomophoneHuntScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homophoneHuntNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final state = ref.read(homophoneHuntNotifierProvider);
    final isCorrect = state.isCorrect ?? false;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isCorrect ? 'EXCELLENT' : 'GAME OVER',
        message: isCorrect 
            ? 'You selected the correct homophone!'
            : 'The correct spelling was "${state.puzzle?.correctAnswer}".',
        isVictory: isCorrect,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(homophoneHuntNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homophoneHuntNotifierProvider);
    final notifier = ref.read(homophoneHuntNotifierProvider.notifier);

    ref.listen(homophoneHuntNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isCorrect == true) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('homophone_hunt');
        _showCompletionDialog();
      }
    });

    if (state.puzzle == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'homophone_hunt'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'homophone_hunt'),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: TangibleContainer(
              width: double.infinity,
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    state.puzzle!.sentence,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Row(
              children: state.options.map((option) {
                final isSelected = state.selectedAnswer == option;
                final isCorrectOption = option == state.puzzle!.correctAnswer;
                
                Color? buttonColor;
                if (isSelected) {
                  buttonColor = state.isCorrect == true ? DesignSystem.gameGreen : DesignSystem.error;
                } else if (state.selectedAnswer != null && isCorrectOption) {
                  buttonColor = DesignSystem.gameGreen.withValues(alpha: 0.5);
                } else {
                  buttonColor = DesignSystem.gameBlue;
                }

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TangibleButton(
                      onTap: () => notifier.checkAnswer(option),
                      color: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            option,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
