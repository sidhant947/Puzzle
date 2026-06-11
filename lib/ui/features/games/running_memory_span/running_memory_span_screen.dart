import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'running_memory_span_provider.dart';

class RunningMemorySpanScreen extends ConsumerStatefulWidget {
  const RunningMemorySpanScreen({super.key});

  @override
  ConsumerState<RunningMemorySpanScreen> createState() => _RunningMemorySpanScreenState();
}

class _RunningMemorySpanScreenState extends ConsumerState<RunningMemorySpanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(runningMemorySpanNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 12;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('running_memory_span');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? l10n.runningSpanWinTitle : l10n.gameOver,
        message: l10n.runningSpanGameOverMessage(score),
        isVictory: won,
        onPlayAgain: () {
          ref.read(runningMemorySpanNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(runningMemorySpanNotifierProvider);
    final notifier = ref.read(runningMemorySpanNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(runningMemorySpanNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'running_memory_span'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'running_memory_span'),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall, l10n),
                      const Spacer(),
                      _buildPhaseIndicator(state, l10n),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: _buildMainLayout(state, constraints.maxWidth, notifier, l10n),
                        ),
                      ),
                      const Spacer(),
                      if (state.phase == RunningSpanPhase.result)
                        _buildResult(state.lastRoundCorrect == true)
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

  Widget _buildPhaseIndicator(RunningMemorySpanState state, AppLocalizations l10n) {
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == RunningSpanPhase.instruction) {
      text = l10n.runningSpanPrepareRecall(state.recallCount);
      color = DesignSystem.accentAmber;
    } else if (state.phase == RunningSpanPhase.showingStream) {
      text = l10n.runningSpanWatchCarefully;
      color = DesignSystem.error;
    } else if (state.phase == RunningSpanPhase.recalling) {
      text = l10n.runningSpanEnterLast(state.recallCount);
      color = DesignSystem.gameIndigo;
    } else {
      text = state.lastRoundCorrect == true ? l10n.runningSpanGreatJob : l10n.runningSpanIncorrectBuffer;
      color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
    }

    return Text(
      text.toUpperCase(),
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildMainLayout(RunningMemorySpanState state, double maxWidth, RunningMemorySpanNotifier notifier, AppLocalizations l10n) {
    if (state.phase == RunningSpanPhase.instruction) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer_rounded, size: 72, color: DesignSystem.accentAmber),
          const SizedBox(height: 16),
          Text(
            l10n.runningSpanRecallLast(state.recallCount),
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(l10n.runningSpanStopsRandomly, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      );
    } else if (state.phase == RunningSpanPhase.showingStream) {
      return Center(
        child: state.currentCharacter.isNotEmpty
            ? Text(
                state.currentCharacter,
                style: const TextStyle(
                  fontSize: 128,
                  fontWeight: FontWeight.w900,
                  color: DesignSystem.primary,
                ),
              )
            : const SizedBox(),
      );
    } else if (state.phase == RunningSpanPhase.recalling) {
      final keyboardLetters = [
        "A", "B", "D", "E", "F", "H", "K", "L", "M", "N", "P", "R", "T", "U", "W", "X", "Y"
      ];
      
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: keyboardLetters.map((letter) {
                  return SizedBox(
                    width: 46,
                    height: 46,
                    child: TangibleButton(
                      onTap: () {
                        HapticFeedbackUtil.lightImpact();
                        notifier.onLetterTapRecall(letter);
                      },
                      color: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.outline,
                      depth: 3.0,
                      padding: EdgeInsets.zero,
                      child: Center(
                        child: Text(
                          letter,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              if (state.userSequence.isNotEmpty)
                Text(
                  l10n.runningSpanEntered(state.userSequence.join(" ")),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DesignSystem.gameIndigo),
                ),
            ],
          ),
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

  Widget _buildStats(RunningMemorySpanState state, bool isSmall, AppLocalizations l10n) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.timeLeft.toUpperCase(), '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.runningSpanNItems.toUpperCase(), '${state.recallCount}', DesignSystem.accentAmber, isSmall),
          _buildStat(l10n.score.toUpperCase(), '${state.score}', DesignSystem.success, isSmall),
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
