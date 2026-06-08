import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'one_letter_shift_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';
import '../../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class OneLetterShiftScreen extends ConsumerWidget {
  const OneLetterShiftScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(oneLetterShiftNotifierProvider);
    final notifier = ref.read(oneLetterShiftNotifierProvider.notifier);

    ref.listen(oneLetterShiftNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isCorrect) {
          HapticFeedbackUtil.victory();
          _showGameOverDialog(context, ref, next);
        } else {
          HapticFeedbackUtil.error();
          Future.delayed(const Duration(milliseconds: 1000), () {
            notifier.reset();
          });
        }
      }
    });

    return GameScaffold(
      title: l10n.oneLetterShiftTitle.toUpperCase(),
      subtitle: l10n.oneLetterShiftSubtitle,
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TangibleContainer(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                color: DesignSystem.gameIndigo,
                radius: DesignSystem.radiusMD,
                child: Text(
                  state.startWord.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Icon(Icons.arrow_downward_rounded, size: 32, color: DesignSystem.gameIndigo),
              const SizedBox(height: 16),
              TangibleContainer(
                padding: const EdgeInsets.all(24),
                color: Theme.of(context).colorScheme.surface,
                radius: DesignSystem.radiusLG,
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'HINT:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.hint.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildInputArea(context, state),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              _buildKeyboard(context, notifier),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea(BuildContext context, OneLetterShiftState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(state.endWord.length, (index) {
              final letter = index < state.userWord.length ? state.userWord[index] : '';
              final isCorrect = state.isGameOver && state.isCorrect;
              final isError = state.isGameOver && !state.isCorrect;

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 48,
                height: 58,
                decoration: BoxDecoration(
                  color: isCorrect 
                      ? DesignSystem.success.withValues(alpha: 0.1) 
                      : (isError ? DesignSystem.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface),
                  border: Border.all(
                    color: isCorrect 
                        ? DesignSystem.success 
                        : (isError ? DesignSystem.error : Theme.of(context).colorScheme.outline),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                ),
                alignment: Alignment.center,
                child: Text(
                  letter,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: isCorrect ? DesignSystem.success : (isError ? DesignSystem.error : Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(BuildContext context, OneLetterShiftNotifier notifier) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['DEL', 'Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.map((row) {
          // Adjust padding for rows with fewer keys (considering DEL as roughly 1.5-2 keys wide)
          final effectiveLength = row.length + (row.contains('DEL') ? 1 : 0);
          final horizontalPadding = (10 - effectiveLength) * 12.0;
          
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding > 0 ? horizontalPadding : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((key) => Expanded(
                flex: key == 'DEL' ? 2 : 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: SizedBox(
                    height: 48,
                    child: TangibleButton(
                      onTap: () {
                        HapticFeedbackUtil.selectionClick();
                        if (key == 'DEL') {
                          notifier.removeLetter();
                        } else {
                          notifier.addLetter(key);
                        }
                      },
                      color: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.outline,
                      padding: EdgeInsets.zero,
                      radius: DesignSystem.radiusSM,
                      child: Center(
                        child: FittedBox(
                          child: key == 'DEL' 
                            ? Icon(Icons.backspace_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface)
                            : Text(
                                key,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              )).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, OneLetterShiftState state) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('one_letter_shift', xpAmount: 30);

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'BRAVO',
        message: 'You correctly shifted ${state.startWord} to ${state.endWord}.',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(oneLetterShiftNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
