import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import 'grammar_police_provider.dart';
import '../../../../providers/game_providers.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class GrammarPoliceScreen extends ConsumerStatefulWidget {
  const GrammarPoliceScreen({super.key});

  @override
  ConsumerState<GrammarPoliceScreen> createState() => _GrammarPoliceScreenState();
}

class _GrammarPoliceScreenState extends ConsumerState<GrammarPoliceScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(grammarPoliceNotifierProvider.notifier).startGame());
  }

  void _showHowToPlay(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.howToPlay),
        content: Text(l10n.grammarPoliceHowToPlay),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.gotIt),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(grammarPoliceNotifierProvider);
    final notifier = ref.read(grammarPoliceNotifierProvider.notifier);

    ref.listen(grammarPoliceNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next.score);
      } else if (next.lives < (previous?.lives ?? 3)) {
        HapticFeedbackUtil.error();
      }
    });

    return GameScaffold(
      title: l10n.grammarPoliceTitle.toUpperCase(),
      subtitle: l10n.grammarPoliceSubtitle,
      onHowToPlay: () => _showHowToPlay(context, l10n),
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.startGame();
      },
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: _buildHeader(state),
          ),
          Expanded(
            child: ClipRect(
              child: Stack(
                children: state.activeSentences.map((active) {
                  return _buildSentence(active, notifier);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(GrammarPoliceState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard('SCORE', state.score.toString(), DesignSystem.primary),
        _buildStatCard('LIVES', '❤' * state.lives, DesignSystem.error),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      color: color.withValues(alpha: 0.1),
      shadowColor: color.withValues(alpha: 0.2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: color)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildSentence(ActiveSentence active, GrammarPoliceNotifier notifier) {
    return Positioned(
      left: 20,
      right: 20,
      top: active.y * MediaQuery.of(context).size.height * 0.7,
      child: GestureDetector(
        onTap: () {
          if (!active.isHandled) {
            HapticFeedbackUtil.selectionClick();
            notifier.handleTap(active);
          }
        },
        child: TangibleContainer(
          color: active.isHandled
              ? (active.sentence.hasError ? DesignSystem.success.withValues(alpha: 0.2) : DesignSystem.error.withValues(alpha: 0.2))
              : Theme.of(context).colorScheme.surface,
          shadowColor: active.isHandled
              ? (active.sentence.hasError ? DesignSystem.success : DesignSystem.error)
              : Theme.of(context).colorScheme.outline,
          padding: const EdgeInsets.all(16),
          child: Text(
            active.sentence.text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: active.isHandled
                  ? (active.sentence.hasError ? DesignSystem.success : DesignSystem.error)
                  : Theme.of(context).colorScheme.onSurface,
              decoration: active.isHandled && !active.sentence.hasError ? TextDecoration.lineThrough : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, int score) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('grammar_police');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(grammarPoliceNotifierProvider.notifier).startGame();
          Navigator.of(context).pop();
        },
        message: 'Game Over! You maintained order in the world of grammar. Score: $score',
      ),
    );
  }
}
