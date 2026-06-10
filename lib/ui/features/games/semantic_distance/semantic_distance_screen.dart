import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'semantic_distance_provider.dart';

class SemanticDistanceScreen extends ConsumerStatefulWidget {
  const SemanticDistanceScreen({super.key});

  @override
  ConsumerState<SemanticDistanceScreen> createState() => _SemanticDistanceScreenState();
}

class _SemanticDistanceScreenState extends ConsumerState<SemanticDistanceScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(semanticDistanceNotifierProvider.notifier).startGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(semanticDistanceNotifierProvider);
    final isVictory = state.guesses.any((g) => g.distance == 0);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.congrats.toUpperCase() : l10n.timeUp.toUpperCase(),
        message: isVictory 
            ? 'You found the secret word in ${state.guesses.length} guesses!' 
            : 'The secret word was ${state.puzzle?.target}.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(semanticDistanceNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(semanticDistanceNotifierProvider);
    final notifier = ref.read(semanticDistanceNotifierProvider.notifier);

    ref.listen(semanticDistanceNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.guesses.any((g) => g.distance == 0)) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('semantic_distance');
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: 'Semantic Distance',
      subtitle: 'Guess the secret word',
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
                    'Guesses: ${state.guesses.length}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 20 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
            child: Row(
              children: [
                Expanded(
                  child: TangibleContainer(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type your guess...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onSubmitted: (value) {
                        notifier.submitGuess(value);
                        _controller.clear();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                TangibleButton(
                  onTap: () {
                    notifier.submitGuess(_controller.text);
                    _controller.clear();
                  },
                  color: DesignSystem.gameBlue,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.send_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              itemCount: state.guesses.length,
              itemBuilder: (context, index) {
                final guess = state.guesses[index];
                final isPerfect = guess.distance == 0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: DesignSystem.spaceSM),
                  child: TangibleContainer(
                    color: isPerfect ? DesignSystem.gameGreen.withValues(alpha: 0.2) : null,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          guess.word,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: isPerfect ? DesignSystem.gameGreen : colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          guess.distance.toStringAsFixed(1),
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 20,
                            color: isPerfect ? DesignSystem.gameGreen : colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
