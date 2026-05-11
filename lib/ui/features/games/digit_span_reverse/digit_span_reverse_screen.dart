import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  ConsumerState<DigitSpanReverseScreen> createState() => _DigitSpanReverseScreenState();
}

class _DigitSpanReverseScreenState extends ConsumerState<DigitSpanReverseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(digitSpanReverseNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'LEVEL UP!' : 'TRY AGAIN',
        message: isVictory 
            ? 'Your working memory is impressive!' 
            : 'The correct reverse sequence was ${ref.read(digitSpanReverseNotifierProvider).sequence.reversed.join(', ')}.',
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

    ref.listen(digitSpanReverseNotifierProvider, (previous, next) async {
      if (next.phase == DigitSpanPhase.result && previous?.phase != DigitSpanPhase.result) {
        final isVictory = next.score > (previous?.score ?? 0);
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('digit_span_reverse');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Reverse Span',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Reverse Span',
      subtitle: state.phase == DigitSpanPhase.sequence 
          ? 'Memorize the digits' 
          : 'Enter digits in REVERSE order',
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
      final text = state.currentDigitIndex == -1 ? '' : state.sequence[state.currentDigitIndex].toString();
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: FadeTransition(opacity: animation, child: child));
        },
        child: Text(
          text,
          key: ValueKey(text),
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
          final digit = index < state.userInput.length ? state.userInput[index].toString() : '_';
          return Text(
            digit,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: index < state.userInput.length ? DesignSystem.accentAmber : DesignSystem.inkSlate.withValues(alpha: 0.3),
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
              const SizedBox(width: DesignSystem.spaceMD),
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
                  color: DesignSystem.surface,
                  shadowColor: DesignSystem.outlineVariant,
                  child: const Icon(Icons.backspace_rounded, color: DesignSystem.error, size: 28),
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
        color: DesignSystem.surface,
        shadowColor: DesignSystem.outlineVariant,
        child: Text(
          digit.toString(),
          style: const TextStyle(color: DesignSystem.ink, fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
