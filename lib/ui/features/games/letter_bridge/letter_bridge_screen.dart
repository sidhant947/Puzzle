import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'letter_bridge_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';
import '../../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class LetterBridgeScreen extends ConsumerWidget {
  const LetterBridgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(letterBridgeNotifierProvider);
    final notifier = ref.read(letterBridgeNotifierProvider.notifier);

    ref.listen(letterBridgeNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isCorrect) {
          HapticFeedbackUtil.victory();
          _showGameOverDialog(context, ref, next);
        } else {
          HapticFeedbackUtil.error();
          Future.delayed(const Duration(milliseconds: 500), () {
            notifier.reset();
          });
        }
      }
    });

    return GameScaffold(
      title: l10n.letterBridgeTitle.toUpperCase(),
      subtitle: l10n.letterBridgeSubtitle,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWordPart(context, state.firstPart, true),
                const SizedBox(width: 8),
                _buildBridgeInput(context, state),
                const SizedBox(width: 8),
                _buildWordPart(context, state.secondPart, false),
              ],
            ),
            const SizedBox(height: 48),
            _buildKeyboard(context, notifier),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildWordPart(BuildContext context, String text, bool isFirst) {
    return Container(
      constraints: const BoxConstraints(minWidth: 60),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildBridgeInput(BuildContext context, LetterBridgeState state) {
    final color = state.isGameOver
        ? (state.isCorrect ? DesignSystem.success : DesignSystem.error)
        : DesignSystem.gameAmber;

    return TangibleContainer(
      width: 64,
      height: 64,
      padding: EdgeInsets.zero,
      color: state.userLetter.isEmpty ? Theme.of(context).colorScheme.surface : color,
      shadowColor: state.userLetter.isEmpty 
          ? Theme.of(context).colorScheme.outline 
          : (state.isCorrect ? DesignSystem.success.withValues(alpha: 0.7) : DesignSystem.error.withValues(alpha: 0.7)),
      radius: DesignSystem.radiusMD,
      child: Center(
        child: Text(
          state.userLetter.toUpperCase(),
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            height: 1.0,
            color: state.userLetter.isEmpty ? Theme.of(context).colorScheme.onSurface : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(BuildContext context, LetterBridgeNotifier notifier) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.map((row) {
          // Adjust padding for rows with fewer keys to keep them centered and sized similarly
          final horizontalPadding = (10 - row.length) * 12.0;
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((letter) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: SizedBox(
                    height: 48,
                    child: TangibleButton(
                      onTap: () {
                        HapticFeedbackUtil.selectionClick();
                        notifier.setLetter(letter);
                      },
                      color: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.outline,
                      padding: EdgeInsets.zero,
                      radius: DesignSystem.radiusSM,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            letter,
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

  void _showGameOverDialog(BuildContext context, WidgetRef ref, LetterBridgeState state) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('letter_bridge', xpAmount: 20);

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'WELL DONE',
        message: AppLocalizations.of(context)!.letterBridgeMessage((state.bridge).toString()),
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(letterBridgeNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
