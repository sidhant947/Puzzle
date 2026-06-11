import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'letter_frequency_scan_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';
import '../../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class LetterFrequencyScanScreen extends ConsumerWidget {
  const LetterFrequencyScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(letterFrequencyScanNotifierProvider);
    final notifier = ref.read(letterFrequencyScanNotifierProvider.notifier);

    ref.listen(letterFrequencyScanNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isCorrect) {
          HapticFeedbackUtil.victory();
          _showGameOverDialog(context, ref, next);
        } else {
          HapticFeedbackUtil.error();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.letterFrequencyScanText((next.targetCount).toString())),
              duration: const Duration(seconds: 2),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            notifier.reset();
          });
        }
      }
    });

    return GameScaffold(
      title: l10n.letterFrequencyScanTitle.toUpperCase(),
      subtitle: l10n.letterFrequencyScanSubtitle,
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
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TangibleContainer(
              padding: const EdgeInsets.all(24),
              color: Theme.of(context).colorScheme.surface,
              radius: DesignSystem.radiusLG,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FIND ALL: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: DesignSystem.gamePurple,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                        ),
                        child: Text(
                          state.targetLetter,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.paragraph,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              'COUNT: ${state.userCount}',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: DesignSystem.gamePurple,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountButton(context, notifier, state.userCount, -1),
                const SizedBox(width: 16),
                _buildCountButton(context, notifier, state.userCount, 1),
              ],
            ),
            const SizedBox(height: 48),
            TangibleButton(
              onTap: () {
                HapticFeedbackUtil.heavyImpact();
                notifier.submit();
              },
              color: DesignSystem.gamePurple,
              shadowColor: const Color(0xFF6B21A8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCountButton(BuildContext context, LetterFrequencyScanNotifier notifier, int current, int delta) {
    return TangibleButton(
      onTap: () {
        HapticFeedbackUtil.selectionClick();
        notifier.setUserCount((current + delta).clamp(0, 99));
      },
      width: 60,
      height: 60,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      padding: EdgeInsets.zero,
      child: Center(
        child: Text(
          delta > 0 ? '+$delta' : '$delta',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, LetterFrequencyScanState state) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('letter_frequency_scan', xpAmount: 25);

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: L10nGameHelpers.getGameTitle(context, 'letter_frequency_scan'),
        message: AppLocalizations.of(context)!.letterFrequencyScanMessage((state.targetCount).toString(), (state.targetLetter).toString()),
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(letterFrequencyScanNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
