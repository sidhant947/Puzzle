import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'operation_span_provider.dart';

class OperationSpanScreen extends ConsumerStatefulWidget {
  const OperationSpanScreen({super.key});

  @override
  ConsumerState<OperationSpanScreen> createState() => _OperationSpanScreenState();
}

class _OperationSpanScreenState extends ConsumerState<OperationSpanScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(operationSpanNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final score = ref.read(operationSpanNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.operationSpanTitle.toUpperCase(),
        message: l10n.operationSpanScore(score),
        isVictory: score > 10,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(operationSpanNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(operationSpanNotifierProvider);
    final notifier = ref.read(operationSpanNotifierProvider.notifier);

    ref.listen(operationSpanNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('operation_span');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.operationSpanTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.operationSpanTitle,
      subtitle: _getSubtitle(context, state.phase),
      actions: [
        _buildTimer(state.timeLeft),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Text(
              '${l10n.score}: ${state.score}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: DesignSystem.primary,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Expanded(
              child: _buildMainContent(state, notifier),
            ),
          ],
        ),
      ),
    );
  }

  String _getSubtitle(BuildContext context, OperationSpanPhase phase) {
    final l10n = AppLocalizations.of(context)!;
    switch (phase) {
      case OperationSpanPhase.math:
        return l10n.operationSpanMathPhase;
      case OperationSpanPhase.letter:
        return l10n.operationSpanLetterPhase;
      case OperationSpanPhase.recall:
        return l10n.operationSpanRecallPhase;
      case OperationSpanPhase.result:
        return l10n.operationSpanRoundComplete;
    }
  }

  Widget _buildTimer(int timeLeft) {
    return TangibleContainer(
      color: timeLeft < 10 ? DesignSystem.error.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      radius: DesignSystem.radiusSM,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 16,
            color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface,
          ),
          SizedBox(width: 4),
          Text(
            timeLeft.toString(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: timeLeft < 10 ? DesignSystem.error : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(OperationSpanState state, OperationSpanNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    switch (state.phase) {
      case OperationSpanPhase.math:
        return _buildMathPhase(state, notifier);
      case OperationSpanPhase.letter:
        return _buildLetterPhase(state);
      case OperationSpanPhase.recall:
        return _buildRecallPhase(state, notifier);
      case OperationSpanPhase.result:
        return Center(child: Text(l10n.operationSpanRoundComplete, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)));
    }
  }

  Widget _buildMathPhase(OperationSpanState state, OperationSpanNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          child: Text(
            state.equation,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ),
        const SizedBox(height: DesignSystem.space2XL),
        Row(
          children: [
            Expanded(
              child: TangibleButton(
                onTap: () => notifier.answerMath(true),
                color: DesignSystem.success,
                child: Text(l10n.trueLabel.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
              ),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: TangibleButton(
                onTap: () => notifier.answerMath(false),
                color: DesignSystem.error,
                child: Text(l10n.falseLabel.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLetterPhase(OperationSpanState state) {
    return Center(
      child: Text(
        state.currentLetter,
        style: const TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: DesignSystem.primary),
      ),
    );
  }

  Widget _buildRecallPhase(OperationSpanState state, OperationSpanNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    final letters = ['F', 'H', 'J', 'K', 'L', 'N', 'P', 'Q', 'R', 'S', 'T', 'Y'];
    
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: state.userRecall.map((l) => Chip(label: Text(l))).toList(),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
            ),
            itemCount: letters.length,
            itemBuilder: (context, index) {
              return TangibleButton(
                onTap: () => notifier.recallLetter(letters[index]),
                child: Text(letters[index], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              );
            },
          ),
        ),
        TangibleButton(
          onTap: notifier.clearRecall,
          color: Theme.of(context).colorScheme.surface,
          child: Text(l10n.clear),
        ),
      ],
    );
  }
}
