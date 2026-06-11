import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'reading_span_provider.dart';

class ReadingSpanScreen extends ConsumerStatefulWidget {
  const ReadingSpanScreen({super.key});

  @override
  ConsumerState<ReadingSpanScreen> createState() => _ReadingSpanScreenState();
}

class _ReadingSpanScreenState extends ConsumerState<ReadingSpanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(readingSpanNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 20;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('reading_span');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'READING EXPERT!' : 'GAME OVER',
        message: 'You scored $score points in the Reading Span memory challenge!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(readingSpanNotifierProvider.notifier).initGame();
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
    final state = ref.watch(readingSpanNotifierProvider);
    final notifier = ref.read(readingSpanNotifierProvider.notifier);

    ref.listen(readingSpanNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'reading_span'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'reading_span'),
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
                      _buildPhaseIndicator(state),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: _buildMainLayout(state, constraints.maxWidth, notifier),
                        ),
                      ),
                      const Spacer(),
                      if (state.phase == ReadingSpanPhase.result)
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

  Widget _buildPhaseIndicator(ReadingSpanState state) {
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == ReadingSpanPhase.showingSentence) {
      text = 'IS THIS STATEMENT TRUE OR FALSE?';
      color = DesignSystem.accentAmber;
    } else if (state.phase == ReadingSpanPhase.showingLetter) {
      text = 'MEMORIZE THIS LETTER';
      color = DesignSystem.error;
    } else if (state.phase == ReadingSpanPhase.recalling) {
      text = 'RECALL LETTERS IN SEQUENCE';
      color = DesignSystem.gameIndigo;
    } else {
      text = state.lastRoundCorrect == true ? 'GREAT JOB!' : 'TRY AGAIN!';
      color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildMainLayout(ReadingSpanState state, double maxWidth, ReadingSpanNotifier notifier) {
    if (state.phase == ReadingSpanPhase.showingSentence && state.currentSentence != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TangibleContainer(
              color: Theme.of(context).colorScheme.surface,
              shadowColor: Theme.of(context).colorScheme.outline,
              depth: 4.0,
              padding: const EdgeInsets.all(24),
              child: Text(
                state.currentSentence!.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answerSentence(false);
                    },
                    color: DesignSystem.error,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Center(
                      child: Text(
                        'FALSE',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answerSentence(true);
                    },
                    color: DesignSystem.success,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Center(
                      child: Text(
                        'TRUE',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else if (state.phase == ReadingSpanPhase.showingLetter && state.highlightedLetter.isNotEmpty) {
      return Text(
        state.highlightedLetter,
        style: const TextStyle(
          fontSize: 120,
          fontWeight: FontWeight.w900,
          color: DesignSystem.primary,
        ),
      );
    } else if (state.phase == ReadingSpanPhase.recalling) {
      // Show keyboard of options
      final keyboardLetters = [
        "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z"
      ];
      
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: keyboardLetters.map((letter) {
                final isTapped = state.userSequence.contains(letter);
                return SizedBox(
                  width: 50,
                  height: 50,
                  child: TangibleButton(
                    onTap: isTapped
                        ? null
                        : () {
                            HapticFeedbackUtil.lightImpact();
                            notifier.onLetterTapRecall(letter);
                          },
                    color: isTapped ? DesignSystem.primary.withValues(alpha: 0.2) : Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    depth: isTapped ? 1.0 : 3.0,
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: isTapped ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5) : Theme.of(context).colorScheme.onSurface,
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
                'YOUR SEQUENCE: ${state.userSequence.join(" ")}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: DesignSystem.gameIndigo),
              ),
          ],
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

  Widget _buildStats(ReadingSpanState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('LENGTH', '${state.currentLength}', DesignSystem.accentAmber, isSmall),
          _buildStat('SCORE', '${state.score}', DesignSystem.success, isSmall),
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
