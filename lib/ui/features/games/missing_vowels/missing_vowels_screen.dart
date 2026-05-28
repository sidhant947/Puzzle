import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'missing_vowels_provider.dart';

class MissingVowelsScreen extends ConsumerStatefulWidget {
  const MissingVowelsScreen({super.key});

  @override
  ConsumerState<MissingVowelsScreen> createState() => _MissingVowelsScreenState();
}

class _MissingVowelsScreenState extends ConsumerState<MissingVowelsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(missingVowelsNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('missing_vowels');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.missingVowelsWin.toUpperCase(),
        message: l10n.wordFoundMessage(ref.read(missingVowelsNotifierProvider).targetWord),
        onPlayAgain: () {
          ref.read(missingVowelsNotifierProvider.notifier).initGame();
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
    final state = ref.watch(missingVowelsNotifierProvider);
    final notifier = ref.read(missingVowelsNotifierProvider.notifier);

    ref.listen(missingVowelsNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver && next.isGameWon) {
        HapticFeedbackUtil.victory();
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: l10n.missingVowelsTitle.toUpperCase(),
      subtitle: l10n.missingVowelsSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.howToPlay),
                content: Text(l10n.missingVowelsHowToPlay),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.gotIt)),
                ],
              ),
            );
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.help_outline_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              SizedBox(height: DesignSystem.spaceMD),
              // Hidden Word Display
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.2),
                child: TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  color: colorScheme.onSurface,
                  depth: 4,
                  child: FittedBox(
                    child: Text(
                      state.hiddenWord,
                      style: TextStyle(
                        color: colorScheme.surface,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 8,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Guess Input Area
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.2),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4,
                  runSpacing: 8,
                  children: List.generate(
                    state.targetWord.length,
                    (index) {
                      final letter = index < state.currentGuess.length ? state.currentGuess[index] : '';
                      return TangibleContainer(
                        depth: 1,
                        radius: DesignSystem.radiusXS,
                        color: state.isInvalidGuess 
                            ? DesignSystem.accentBerry.withValues(alpha: 0.1)
                            : colorScheme.surface,
                        child: SizedBox(
                          width: 32,
                          height: 40,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                letter,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: state.isInvalidGuess ? DesignSystem.accentBerry : colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              // Simple Alphabet Keyboard (A-Z)
              _buildKeyboard(notifier),
              const SizedBox(height: DesignSystem.spaceSM),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TangibleButton(
                        onTap: notifier.onBackspace,
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.backspace_rounded,
                            color: colorScheme.onSurface,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMD),
                    Expanded(
                      flex: 3,
                      child: TangibleButton(
                        onTap: notifier.submitGuess,
                        color: DesignSystem.primary,
                        depth: 4,
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontWeight: FontWeight.w900, 
                              fontSize: 16,
                              letterSpacing: 1.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildKeyboard(MissingVowelsNotifier notifier) {
    final colorScheme = Theme.of(context).colorScheme;
    const rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: List.generate(rows.length, (rowIndex) {
          final row = rows[rowIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rowIndex == 1) const Spacer(flex: 1),
                if (rowIndex == 2) const Spacer(flex: 3),
                ...row.map((letter) {
                  return Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.5),
                      child: TangibleButton(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.onLetterPressed(letter);
                        },
                        color: colorScheme.surface,
                        shadowColor: colorScheme.outline,
                        padding: EdgeInsets.zero,
                        child: Container(
                          height: 38,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                letter,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                if (rowIndex == 1) const Spacer(flex: 1),
                if (rowIndex == 2) const Spacer(flex: 3),
              ],
            ),
          );
        }),
      ),
    );
  }
}
