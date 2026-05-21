import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'inequality_dash_engine.dart';
import 'inequality_dash_provider.dart';

class InequalityDashScreen extends ConsumerStatefulWidget {
  const InequalityDashScreen({super.key});

  @override
  ConsumerState<InequalityDashScreen> createState() => _InequalityDashScreenState();
}

class _InequalityDashScreenState extends ConsumerState<InequalityDashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(inequalityDashNotifierProvider.notifier).initGame();
    });
  }

  void _handleOperatorTap(String op) {
    HapticFeedbackUtil.selectionClick();
    final notifier = ref.read(inequalityDashNotifierProvider.notifier);
    final state = ref.read(inequalityDashNotifierProvider);

    final isCorrect = state.currentQuestion?.correctOperator == op;
    if (isCorrect) {
      HapticFeedbackUtil.success();
    } else {
      HapticFeedbackUtil.error();
    }

    notifier.submitAnswer(op);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(inequalityDashNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(inequalityDashNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'TIME\'S UP!',
            message: 'You scored ${next.score} points matching inequalities!',
            onHome: () {
              Navigator.of(context).pop(); // Dismiss dialog
              Navigator.of(context).pop(); // Back to home
            },
            onPlayAgain: () {
              ref.read(inequalityDashNotifierProvider.notifier).reset();
              Navigator.of(context).pop(); // Dismiss dialog
            },
          ),
        );
      }
    });

    if (state.isLoading || state.currentQuestion == null) {
      return GameScaffold(
        title: 'INEQUALITY DASH',
        subtitle: 'High-speed formula comparison',
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = state.currentQuestion!;

    return GameScaffold(
      title: 'INEQUALITY DASH',
      subtitle: 'Compare the values: is Left <, =, or > Right?',
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        ref.read(inequalityDashNotifierProvider.notifier).reset();
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxHeight < 500;

          return Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Column(
              children: [
                // Top status bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Score
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.stars_rounded, color: DesignSystem.accentAmber, size: 20),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              'SCORE: ${state.score}',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMD),
                    // Timer
                    Expanded(
                      child: TangibleContainer(
                        depth: 4.0,
                        padding: const EdgeInsets.symmetric(
                          vertical: DesignSystem.spaceSM,
                          horizontal: DesignSystem.spaceMD,
                        ),
                        color: state.timeLeft <= 5
                            ? colorScheme.error.withValues(alpha: 0.1)
                            : colorScheme.surface,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.timer_rounded,
                              color: state.timeLeft <= 5 ? colorScheme.error : colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: DesignSystem.spaceXS),
                            Text(
                              '${state.timeLeft}s',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                                color: state.timeLeft <= 5 ? colorScheme.error : null,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceXL),

                // Formulas comparison area
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Left Expression
                          Expanded(
                            child: TangibleContainer(
                              depth: 6.0,
                              color: colorScheme.surface,
                              padding: const EdgeInsets.all(DesignSystem.spaceMD),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'LEFT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: DesignSystem.spaceXS),
                                      Text(
                                        question.leftFormula,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: DesignSystem.spaceMD),
                          // Right Expression
                          Expanded(
                            child: TangibleContainer(
                              depth: 6.0,
                              color: colorScheme.surface,
                              padding: const EdgeInsets.all(DesignSystem.spaceMD),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'RIGHT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: colorScheme.onSurface.withValues(alpha: 0.5),
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                      const SizedBox(height: DesignSystem.spaceXS),
                                      Text(
                                        question.rightFormula,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: isSmallScreen ? DesignSystem.spaceMD : DesignSystem.spaceXL),

                // Feedbacks & Buttons
                Column(
                  children: [
                    if (state.lastAnswerCorrect != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                        child: Text(
                          state.lastAnswerCorrect! ? 'CORRECT!' : 'WRONG!',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            color: state.lastAnswerCorrect!
                                ? DesignSystem.accentEmerald
                                : colorScheme.error,
                            letterSpacing: 1.0,
                          ),
                        ),
                      )
                    else
                      const SizedBox(height: 38),

                    // Controls Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // '<' button
                        Expanded(
                          child: TangibleButton(
                            depth: 6.0,
                            color: colorScheme.primary,
                            shadowColor: colorScheme.primary.withValues(alpha: 0.7),
                            padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
                            onTap: () => _handleOperatorTap('<'),
                            child: const Center(
                              child: Text(
                                '<',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: DesignSystem.spaceMD),
                        // '=' button
                        Expanded(
                          child: TangibleButton(
                            depth: 6.0,
                            color: DesignSystem.accentAmber,
                            shadowColor: DesignSystem.accentAmber.withValues(alpha: 0.7),
                            padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
                            onTap: () => _handleOperatorTap('='),
                            child: const Center(
                              child: Text(
                                '=',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: DesignSystem.spaceMD),
                        // '>' button
                        Expanded(
                          child: TangibleButton(
                            depth: 6.0,
                            color: DesignSystem.accentBerry,
                            shadowColor: DesignSystem.accentBerry.withValues(alpha: 0.7),
                            padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
                            onTap: () => _handleOperatorTap('>'),
                            child: const Center(
                              child: Text(
                                '>',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceMD),
              ],
            ),
          );
        },
      ),
    );
  }
}
