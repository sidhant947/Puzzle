import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import 'attentional_blink_provider.dart';

class AttentionalBlinkScreen extends ConsumerStatefulWidget {
  const AttentionalBlinkScreen({super.key});

  @override
  ConsumerState<AttentionalBlinkScreen> createState() => _AttentionalBlinkScreenState();
}

class _AttentionalBlinkScreenState extends ConsumerState<AttentionalBlinkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(attentionalBlinkNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(AttentionalBlinkState state) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gameOver,
        message: l10n.attentionalBlinkScoreMessage(state.score),
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(attentionalBlinkNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(attentionalBlinkNotifierProvider);

    ref.listen(attentionalBlinkNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showCompletionDialog(next);
      }
    });

    return GameScaffold(
      title: l10n.attentionalBlinkTitle,
      subtitle: state.phase == ABPhase.sequence
          ? l10n.attentionalBlinkSubtitleWatch
          : l10n.attentionalBlinkSubtitleInput,
      actions: [
        TangibleContainer(
          color: colorScheme.surface,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          radius: DesignSystem.radiusSM,
          depth: 2,
          child: Text(
            '${state.timeLeft}S',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: DesignSystem.primary,
              fontFamily: 'JetBrainsMono',
            ),
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${l10n.score.toUpperCase()}: ${state.score}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: _buildMainContent(state),
                  ),
                ),
                if (state.phase == ABPhase.input || state.phase == ABPhase.result)
                  _buildInputPanel(state),
              ],
            ),
    );
  }

  Widget _buildMainContent(AttentionalBlinkState state) {
    if (state.phase == ABPhase.sequence && state.currentIndex >= 0) {
      return Text(
        state.sequence[state.currentIndex],
        style: const TextStyle(
          fontSize: 120,
          fontWeight: FontWeight.w900,
          color: DesignSystem.primary,
        ),
      );
    }

    if (state.phase == ABPhase.input || state.phase == ABPhase.result) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInputSlot(state.inputT1, state.phase == ABPhase.result ? state.t1 : null),
          const SizedBox(width: DesignSystem.spaceLG),
          _buildInputSlot(state.inputT2, state.phase == ABPhase.result ? state.t2 : null),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildInputSlot(String value, String? correctValue) {
    Color color = Theme.of(context).colorScheme.surface;
    Color textColor = Theme.of(context).colorScheme.onSurface;

    if (correctValue != null) {
      bool isCorrect = value == correctValue;
      color = isCorrect ? DesignSystem.success.withValues(alpha: 0.1) : DesignSystem.error.withValues(alpha: 0.1);
      textColor = isCorrect ? DesignSystem.success : DesignSystem.error;
    }

    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.spaceXL),
      radius: DesignSystem.radiusLG,
      color: color,
      child: Text(
        value.isEmpty ? '?' : value,
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          color: value.isEmpty ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.3) : textColor,
        ),
      ),
    );
  }

  Widget _buildInputPanel(AttentionalBlinkState state) {
    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      child: Wrap(
        spacing: DesignSystem.spaceMD,
        runSpacing: DesignSystem.spaceMD,
        alignment: WrapAlignment.center,
        children: '23456789'.split('').map((char) {
          return TangibleButton(
            onTap: () {
              if (state.phase == ABPhase.input) {
                HapticFeedbackUtil.selectionClick();
                ref.read(attentionalBlinkNotifierProvider.notifier).submitInput(char);
              }
            },
            color: Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              char,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w900),
            ),
          );
        }).toList(),
      ),
    );
  }
}
