import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'digit_span_reverse_provider.dart';

class DigitSpanReverseScreen extends ConsumerStatefulWidget {
  const DigitSpanReverseScreen({super.key});

  @override
  ConsumerState<DigitSpanReverseScreen> createState() =>
      _DigitSpanReverseScreenState();
}

class _DigitSpanReverseScreenState
    extends ConsumerState<DigitSpanReverseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(digitSpanReverseNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory
            ? l10n.digitSpanReverseWinTitle
            : l10n.digitSpanReverseLoseTitle,
        message: isVictory
            ? l10n.digitSpanReverseWinMessage
            : l10n.digitSpanReverseLoseMessage(ref
                .read(digitSpanReverseNotifierProvider)
                .sequence
                .reversed
                .join(', ')),
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(digitSpanReverseNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(digitSpanReverseNotifierProvider);
    final notifier = ref.read(digitSpanReverseNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(digitSpanReverseNotifierProvider, (previous, next) async {
      if (next.phase == DigitSpanPhase.result &&
          previous?.phase != DigitSpanPhase.result) {
        final isVictory = next.score > (previous?.score ?? 0);
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref
              .read(gameStreakNotifierProvider.notifier)
              .completeGame('digit_span_reverse');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.digitSpanReverseTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.digitSpanReverseTitle,
      subtitle: state.phase == DigitSpanPhase.sequence
          ? l10n.digitSpanReverseSubtitleMemorize
          : l10n.digitSpanReverseSubtitleEnter,
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceXL),

          // Display Area
          Expanded(
            flex: 2,
            child: Center(
              child: _buildMainDisplay(state),
            ),
          ),

          // Input Area
          if (state.phase == DigitSpanPhase.input)
            Expanded(
              flex: 4,
              child: _buildNumpad(state, notifier),
            )
          else
            const Spacer(flex: 4),

          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildMainDisplay(DigitSpanState state) {
    if (state.phase == DigitSpanPhase.sequence) {
      final text = state.currentDigitIndex == -1
          ? ''
          : state.sequence[state.currentDigitIndex].toString();
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 150),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final offsetAnimation = Tween<Offset>(
            begin: const Offset(0.0, 0.2),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offsetAnimation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            ),
          );
        },
        child: Text(
          text,
          key: ValueKey(state.currentDigitIndex),
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
            color: DesignSystem.primary,
          ),
        ),
      );
    } else {
      // Show what the user has entered so far
      return Wrap(
        spacing: DesignSystem.spaceMD,
        children: List.generate(state.sequence.length, (index) {
          final digit = index < state.userInput.length
              ? state.userInput[index].toString()
              : '_';
          return Text(
            digit,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: index < state.userInput.length
                  ? DesignSystem.accentAmber
                  : Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.2),
            ),
          );
        }),
      );
    }
  }

  Widget _buildNumpad(DigitSpanState state, DigitSpanReverseNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Column(
        children: [
          Row(
            children: [
              _buildNumButton(1, () => notifier.onDigitPressed(1)),
              SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(2, () => notifier.onDigitPressed(2)),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(3, () => notifier.onDigitPressed(3)),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton(4, () => notifier.onDigitPressed(4)),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(5, () => notifier.onDigitPressed(5)),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(6, () => notifier.onDigitPressed(6)),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton(7, () => notifier.onDigitPressed(7)),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(8, () => notifier.onDigitPressed(8)),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(9, () => notifier.onDigitPressed(9)),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              const Spacer(),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(0, () => notifier.onDigitPressed(0)),
              const SizedBox(width: DesignSystem.spaceMD),
              Expanded(
                child: TangibleButton(
                  onTap: notifier.onBackspace,
                  color: Theme.of(context).colorScheme.surface,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  child: const Icon(Icons.backspace_rounded,
                      color: DesignSystem.error, size: 28),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumButton(int digit, VoidCallback onTap) {
    return Expanded(
      child: TangibleButton(
        onTap: onTap,
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        child: Center(
          child: Text(
            digit.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
