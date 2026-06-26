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
import 'dnms_provider.dart';

class DnmsScreen extends ConsumerStatefulWidget {
  const DnmsScreen({super.key});

  @override
  ConsumerState<DnmsScreen> createState() => _DnmsScreenState();
}

class _DnmsScreenState extends ConsumerState<DnmsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(dnmsNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 12;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('dnms');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return GameCompletionDialog(
          title: won ? l10n.dnmsWinTitle : l10n.gameOver,
          message: l10n.dnmsGameOverMessage(score),
          isVictory: won,
          onPlayAgain: () {
            ref.read(dnmsNotifierProvider.notifier).initGame();
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
    final state = ref.watch(dnmsNotifierProvider);

    ref.listen(dnmsNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'dnms'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'dnms'),
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
                      _buildMainContent(state),
                      const Spacer(),
                      _buildPhaseIndicator(state),
                      const Spacer(),
                      if (state.lastRoundCorrect != null)
                        _buildResult(state.lastRoundCorrect!)
                      else
                        const SizedBox(height: 80),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildPhaseIndicator(DnmsState state) {
    final l10n = AppLocalizations.of(context)!;
    String text = l10n.dnmsChooseNovel;
    Color color = DesignSystem.primary;
    if (state.phase == DnmsPhase.memorize) {
      text = l10n.dnmsMemorizeSample;
      color = DesignSystem.accentAmber;
    } else if (state.phase == DnmsPhase.delay) {
      text = l10n.dnmsWaitForIt;
      color = DesignSystem.gameIndigo;
    } else if (state.lastRoundCorrect == true) {
      text = l10n.dnmsExcellent;
      color = DesignSystem.success;
    } else if (state.lastRoundCorrect == false) {
      text = l10n.dnmsSampleTapped;
      color = DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 16,
      ),
    );
  }

  Widget _buildMainContent(DnmsState state) {
    if (state.phase == DnmsPhase.memorize && state.sampleCard != null) {
      return TangibleContainer(
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        depth: 6.0,
        padding: const EdgeInsets.all(40),
        child: Icon(
          state.sampleCard!.icon,
          color: state.sampleCard!.color,
          size: 96,
        ),
      );
    } else if (state.phase == DnmsPhase.delay) {
      return Container(
        width: 176,
        height: 176,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline, width: 2, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state.phase == DnmsPhase.choice) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: state.options.map((card) {
            return TangibleButton(
              onTap: state.lastRoundCorrect != null
                  ? null
                  : () {
                      HapticFeedbackUtil.lightImpact();
                      ref.read(dnmsNotifierProvider.notifier).onSelectCard(card);
                    },
              color: Theme.of(context).colorScheme.surface,
              shadowColor: Theme.of(context).colorScheme.outline,
              depth: 4.0,
              padding: const EdgeInsets.all(24),
              child: Icon(
                card.icon,
                color: card.color,
                size: state.currentDifficulty >= 4 ? 48 : 64,
              ),
            );
          }).toList(),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildResult(bool correct) {
    return Icon(
      correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: correct ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(DnmsState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.statCards, '${state.currentDifficulty}', DesignSystem.accentAmber, isSmall),
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
