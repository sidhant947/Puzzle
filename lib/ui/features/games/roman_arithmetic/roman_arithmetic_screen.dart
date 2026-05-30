import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'roman_arithmetic_provider.dart';

class RomanArithmeticScreen extends ConsumerWidget {
  const RomanArithmeticScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(romanArithmeticNotifierProvider);
    final notifier = ref.read(romanArithmeticNotifierProvider.notifier);

    ref.listen(romanArithmeticNotifierProvider, (previous, next) {
      if (next.status == RomanStatus.gameOver &&
          previous?.status != RomanStatus.gameOver) {
        final isGoalReached = next.score >= 10;
        if (isGoalReached) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: isGoalReached ? l10n.romanArithmeticGoalReached : l10n.romanArithmeticTimeUp,
            message: isGoalReached
                ? l10n.romanArithmeticScoreMessage(next.score)
                : l10n.romanArithmeticTryAgainMessage(next.score),
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(romanArithmeticNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.romanArithmeticTitle,
      subtitle: l10n.romanArithmeticSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.lightImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded,
              size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceSM),
              _buildHeader(context, state),
              const Spacer(),
              if (state.status == RomanStatus.ready)
                _buildReadyState(context, notifier)
              else if (state.status == RomanStatus.playing &&
                  state.currentProblem != null)
                _buildPlayingState(state, notifier)
              else if (state.status == RomanStatus.gameOver)
                _buildGameOverState(context),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, RomanArithmeticState state) {
    final l10n = AppLocalizations.of(context)!;
    final isLowTime = state.timeRemaining <= 10 && state.timeRemaining > 0;
    final timeColor = isLowTime ? DesignSystem.error : DesignSystem.accentAmber;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: _buildStatCard(
                  context, l10n.score.toUpperCase(), state.score.toString(), DesignSystem.accentEmerald)),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
              child: _buildStatCard(
                  context, l10n.timeLeft.toUpperCase(), '${state.timeRemaining}s', timeColor,
                  animate: isLowTime)),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
              child: _buildStatCard(
                  context, l10n.romanArithmeticBest, state.bestScore.toString(), DesignSystem.primary)),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color,
      {bool animate = false}) {
    Widget content = TangibleContainer(
      padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
      color: Theme.of(context).colorScheme.surface,
      depth: 3.0,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              fontWeight: FontWeight.w900,
              fontSize: 10,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    if (animate) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 1.1),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: content,
      );
    }

    return content;
  }

  Widget _buildReadyState(BuildContext context, RomanArithmeticNotifier notifier) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.account_balance_rounded, size: 80, color: DesignSystem.primary),
        const SizedBox(height: DesignSystem.spaceLG),
        Text(
          l10n.romanArithmeticSeconds,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        Text(
          l10n.romanArithmeticDescription,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceXL),
        TangibleButton(
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            notifier.startGame();
          },
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          child: Text(l10n.romanArithmeticStart),
        ),
      ],
    );
  }

  Widget _buildPlayingState(
      RomanArithmeticState state, RomanArithmeticNotifier notifier) {
    final problem = state.currentProblem!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxHeight < 500;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TangibleContainer(
                color: state.isInvalidGuess ? DesignSystem.error : Theme.of(context).colorScheme.onSurface,
                shadowColor: state.isInvalidGuess ? DesignSystem.error.withValues(alpha: 0.5) : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                depth: state.isInvalidGuess ? 2.0 : 6.0,
                padding: EdgeInsets.all(isSmall
                    ? DesignSystem.spaceXL
                    : DesignSystem.spaceXL * 1.5),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.3,
                    maxWidth: constraints.maxWidth,
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      problem.equation,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4.0,
                        fontSize: 48,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: isSmall ? 32 : 64),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: isSmall ? 12 : DesignSystem.spaceLG,
                crossAxisSpacing: isSmall ? 12 : DesignSystem.spaceLG,
                childAspectRatio: 2.0,
                children: problem.options.map((option) {
                  return TangibleButton(
                    color: Theme.of(context).colorScheme.surface,
                    shadowColor: Theme.of(context).colorScheme.outline,
                    onTap: () {
                      if (option == problem.answer) {
                        HapticFeedbackUtil.lightImpact();
                      } else {
                        HapticFeedbackUtil.error();
                      }
                      notifier.submitAnswer(option);
                    },
                    depth: 3.0,
                    padding: EdgeInsets.zero,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          option.toString(),
                          style: const TextStyle(
                            color: DesignSystem.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
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
      },
    );
  }

  Widget _buildGameOverState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.romanArithmeticTimeUp,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: DesignSystem.error,
          ),
        ),
      ],
    );
  }
}
