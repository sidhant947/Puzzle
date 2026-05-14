import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'verbal_analogies_provider.dart';

class VerbalAnalogiesScreen extends ConsumerStatefulWidget {
  const VerbalAnalogiesScreen({super.key});

  @override
  ConsumerState<VerbalAnalogiesScreen> createState() => _VerbalAnalogiesScreenState();
}

class _VerbalAnalogiesScreenState extends ConsumerState<VerbalAnalogiesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(verbalAnalogiesNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.verbalAnalogiesTitle.toUpperCase(),
        message: 'You have a sharp mind for relationships.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(verbalAnalogiesNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(verbalAnalogiesNotifierProvider);
    final notifier = ref.read(verbalAnalogiesNotifierProvider.notifier);

    ref.listen(verbalAnalogiesNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('verbal_analogies');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: 'Verbal Analogies',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Verbal Analogies',
      subtitle: l10n.verbalAnalogiesSubtitle,
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: state.score / state.targetScore,
              backgroundColor: colorScheme.outline.withValues(alpha: 0.5),
              valueColor: const AlwaysStoppedAnimation<Color>(DesignSystem.success),
            ),
            SizedBox(height: DesignSystem.spaceXL),
            Text(
              state.currentAnalogy?.question ?? '',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: DesignSystem.spaceXL * 2),
            ...state.currentAnalogy?.options.map((option) {
              final isSelected = state.selectedOption == option;
              final isCorrect = state.currentAnalogy?.answer == option;
              
              Color buttonColor = colorScheme.surface;
              if (isSelected) {
                buttonColor = isCorrect ? DesignSystem.success : DesignSystem.error;
              } else if (state.selectedOption != null && isCorrect) {
                buttonColor = DesignSystem.success.withValues(alpha: 0.3);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: state.selectedOption == null ? () => notifier.selectOption(option) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: isSelected || (state.selectedOption != null && isCorrect) 
                          ? Colors.white 
                          : colorScheme.onSurface,
                      side: BorderSide(
                        color: isSelected ? Colors.transparent : colorScheme.outline.withValues(alpha: 0.5),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      option,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }).toList() ?? [],
          ],
        ),
      ),
    );
  }
}
