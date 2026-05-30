import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'divisibility_dash_provider.dart';

class DivisibilityDashScreen extends ConsumerStatefulWidget {
  const DivisibilityDashScreen({super.key});

  @override
  ConsumerState<DivisibilityDashScreen> createState() => _DivisibilityDashScreenState();
}

class _DivisibilityDashScreenState extends ConsumerState<DivisibilityDashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(divisibilityDashNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 5;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('divisibility_dash');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'DIVISIBILITY WHIZ!' : l10n.timeUp.toUpperCase(),
        message: 'You solved $score numbers!',
        onPlayAgain: () {
          ref.read(divisibilityDashNotifierProvider.notifier).initGame();
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(divisibilityDashNotifierProvider);
    final notifier = ref.read(divisibilityDashNotifierProvider.notifier);

    ref.listen(divisibilityDashNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.divisibilityDashTitle.toUpperCase(),
      subtitle: l10n.divisibilityDashSubtitle,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat(l10n.timeLeft.toUpperCase(), '${state.timeLeft}s', DesignSystem.accentBerry),
                      _buildStat(l10n.score.toUpperCase(), '${state.score}', DesignSystem.accentEmerald),
                    ],
                  ),
                  const Spacer(),
                  TangibleContainer(
                    depth: 4.0,
                    color: colorScheme.onSurface,
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      state.currentProblem.number.toString(),
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        color: colorScheme.surface,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildDivisorGrid(state, notifier),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivisorGrid(DivisibilityDashState state, DivisibilityDashNotifier notifier) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(8, (index) {
        final divisor = index + 2;
        final isSelected = state.selectedDivisors.contains(divisor);
        return TangibleButton(
          onTap: () {
            HapticFeedbackUtil.gameInteraction();
            notifier.onDivisorTapped(divisor);
          },
          color: isSelected ? DesignSystem.accentEmerald : Theme.of(context).colorScheme.surface,
          child: Center(
            child: Text(
              divisor.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        );
      }),
    );
  }
}
