import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'spoonerism_solver_provider.dart';

class SpoonerismSolverScreen extends ConsumerStatefulWidget {
  const SpoonerismSolverScreen({super.key});

  @override
  ConsumerState<SpoonerismSolverScreen> createState() => _SpoonerismSolverScreenState();
}

class _SpoonerismSolverScreenState extends ConsumerState<SpoonerismSolverScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(spoonerismSolverNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(spoonerismSolverNotifierProvider);
    
    if (state.isGameWon) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('spoonerism_solver');
    }
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: state.isGameWon ? 'EXCELLENT' : 'GAME OVER',
        message: state.isGameWon 
            ? 'You correctly identified the original phrase!'
            : 'The correct phrase was "${state.original}".',
        isVictory: state.isGameWon,
        onPlayAgain: () {
          ref.read(spoonerismSolverNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(spoonerismSolverNotifierProvider);
    final notifier = ref.read(spoonerismSolverNotifierProvider.notifier);

    ref.listen(spoonerismSolverNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.spoonerismSolverTitle.toUpperCase(),
      subtitle: l10n.spoonerismSolverSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () => notifier.initGame(),
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator(color: DesignSystem.primary))
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: TangibleContainer(
                        padding: const EdgeInsets.all(24),
                        color: DesignSystem.gameIndigo,
                        shadowColor: const Color(0xFF4338CA),
                        child: Center(
                          child: Text(
                            state.spoonerism.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Column(
                        children: state.options.map((option) {
                          final isSelected = state.selectedOption == option;
                          final isCorrect = isSelected && state.isGameWon;
                          final isWrong = isSelected && !state.isGameWon;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TangibleButton(
                              onTap: () => notifier.selectOption(option),
                              color: isCorrect 
                                  ? DesignSystem.gameGreen 
                                  : (isWrong ? DesignSystem.error : colorScheme.surface),
                              shadowColor: isCorrect 
                                  ? const Color(0xFF166534) 
                                  : (isWrong ? const Color(0xFF991B1B) : colorScheme.outline),
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                              child: Center(
                                child: Text(
                                  option.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: (isCorrect || isWrong) ? Colors.white : colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
    );
  }
}
