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
import 'counting_span_provider.dart';

class CountingSpanScreen extends ConsumerStatefulWidget {
  const CountingSpanScreen({super.key});

  @override
  ConsumerState<CountingSpanScreen> createState() => _CountingSpanScreenState();
}

class _CountingSpanScreenState extends ConsumerState<CountingSpanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(countingSpanNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 20;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('counting_span');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return GameCompletionDialog(
          title: won ? l10n.countingSpanWinTitle : l10n.gameOver,
          message: l10n.countingSpanGameOverMessage(score),
          isVictory: won,
          onPlayAgain: () {
            ref.read(countingSpanNotifierProvider.notifier).initGame();
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
    final state = ref.watch(countingSpanNotifierProvider);
    final notifier = ref.read(countingSpanNotifierProvider.notifier);

    ref.listen(countingSpanNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'counting_span'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'counting_span'),
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
                      if (state.phase == CountingSpanPhase.result)
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

  Widget _buildPhaseIndicator(CountingSpanState state) {
    final l10n = AppLocalizations.of(context)!;
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == CountingSpanPhase.counting) {
      text = l10n.countingSpanCountCircles;
      color = DesignSystem.gameBlue;
    } else if (state.phase == CountingSpanPhase.recalling) {
      text = l10n.countingSpanRecallCounts;
      color = DesignSystem.gameIndigo;
    } else {
      text = state.lastRoundCorrect == true ? l10n.countingSpanGreatJob : l10n.countingSpanTryAgain;
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

  Widget _buildMainLayout(CountingSpanState state, double maxWidth, CountingSpanNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    if (state.phase == CountingSpanPhase.counting) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Expanded(
              child: TangibleContainer(
                color: Theme.of(context).colorScheme.surface,
                shadowColor: Theme.of(context).colorScheme.outline,
                depth: 4.0,
                radius: DesignSystem.radiusLG,
                width: double.infinity,
                child: ClipRect(
                  child: LayoutBuilder(
                    builder: (context, canvasBox) {
                      return Stack(
                        children: state.currentItems.map((item) {
                          Color itemColor = Colors.blue;
                          if (item.color == CountingColorType.yellow) {
                            itemColor = DesignSystem.accentAmber;
                          } else if (item.color == CountingColorType.green) {
                            itemColor = DesignSystem.success;
                          }

                          return Positioned(
                            left: item.x * canvasBox.maxWidth,
                            top: item.y * canvasBox.maxHeight,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: itemColor,
                                shape: item.shape == CountingShapeType.circle
                                    ? BoxShape.circle
                                    : BoxShape.rectangle,
                                borderRadius: item.shape == CountingShapeType.square
                                    ? BorderRadius.circular(4)
                                    : null,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: state.countOptions.map((opt) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: TangibleButton(
                      onTap: () {
                        HapticFeedbackUtil.lightImpact();
                        notifier.answerCount(opt);
                      },
                      color: Theme.of(context).colorScheme.surface,
                      shadowColor: Theme.of(context).colorScheme.outline,
                      depth: 3.0,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Center(
                        child: Text(
                          '$opt',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else if (state.phase == CountingSpanPhase.recalling) {
      // Numbers recall keyboard: 2 to 9
      final numOptions = [2, 3, 4, 5, 6, 7, 8, 9];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: numOptions.map((option) {
                return SizedBox(
                  width: 64,
                  height: 64,
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.onNumberTapRecall(option);
                    },
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    depth: 3.0,
                    child: Center(
                      child: Text(
                        '$option',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            if (state.userSequence.isNotEmpty)
              Text(
                l10n.countingSpanYourSequence(state.userSequence.join(" ")),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: DesignSystem.gameIndigo),
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

  Widget _buildStats(CountingSpanState state, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat(l10n.statTime, '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat(l10n.countingSpanLength, '${state.currentLength}', DesignSystem.accentAmber, isSmall),
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
