import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'continuous_recognition_provider.dart';

class ContinuousRecognitionScreen extends ConsumerStatefulWidget {
  const ContinuousRecognitionScreen({super.key});

  @override
  ConsumerState<ContinuousRecognitionScreen> createState() => _ContinuousRecognitionScreenState();
}

class _ContinuousRecognitionScreenState extends ConsumerState<ContinuousRecognitionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(continuousRecognitionNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 15;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('continuous_recognition');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return GameCompletionDialog(
          title: won ? l10n.gameWin : l10n.gameOver,
          message: '$score correct recognitions!',
          isVictory: won,
          onPlayAgain: () {
            ref.read(continuousRecognitionNotifierProvider.notifier).initGame();
            Navigator.pop(context);
          },
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(continuousRecognitionNotifierProvider);
    final notifier = ref.read(continuousRecognitionNotifierProvider.notifier);

    ref.listen(continuousRecognitionNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'continuous_recognition'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'continuous_recognition'),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      const Spacer(),
                      _buildCardDisplay(state),
                      const Spacer(),
                      _buildPhaseIndicator(state),
                      const SizedBox(height: 20),
                      _buildActionButtons(notifier, state.lastAnswerCorrect != null),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildPhaseIndicator(ContinuousRecognitionState state) {
    if (state.lastAnswerCorrect == true) {
      return const Text(
        'CORRECT!',
        style: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w800,
          color: DesignSystem.success,
          fontSize: 16,
        ),
      );
    } else if (state.lastAnswerCorrect == false) {
      return const Text(
        'WRONG!',
        style: TextStyle(
          letterSpacing: 1.5,
          fontWeight: FontWeight.w800,
          color: DesignSystem.error,
          fontSize: 16,
        ),
      );
    }
    return const Text(
      'IS THIS OLD OR NEW?',
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: DesignSystem.primary,
        fontSize: 16,
      ),
    );
  }

  Widget _buildCardDisplay(ContinuousRecognitionState state) {
    final card = state.currentCard;
    if (card == null) return const SizedBox();
    
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: 6.0,
      radius: DesignSystem.radiusLG,
      padding: const EdgeInsets.all(40),
      child: Icon(
        card.icon,
        color: card.color,
        size: 96,
      ),
    );
  }

  Widget _buildActionButtons(ContinuousRecognitionNotifier notifier, bool answered) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TangibleButton(
              onTap: answered
                  ? null
                  : () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answer(false); // claimed NEW
                    },
              color: DesignSystem.gameBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TangibleButton(
              onTap: answered
                  ? null
                  : () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answer(true); // claimed OLD
                    },
              color: DesignSystem.accentAmber,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text(
                  'OLD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(ContinuousRecognitionState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.statSeenPool, '${state.seenCards.length}', DesignSystem.gameIndigo, isSmall),
          _buildStat(l10n.statScore, '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16,
        vertical: isSmall ? 4 : 8,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
