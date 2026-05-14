import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'prime_hunter_provider.dart';

class PrimeHunterScreen extends ConsumerStatefulWidget {
  const PrimeHunterScreen({super.key});

  @override
  ConsumerState<PrimeHunterScreen> createState() => _PrimeHunterScreenState();
}

class _PrimeHunterScreenState extends ConsumerState<PrimeHunterScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(primeHunterNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'MASTER HUNTER!' : 'HUNT ENDED',
        message: isVictory 
            ? 'Your prime number detection is perfect!' 
            : 'Primes are the building blocks of numbers! Your score: ${ref.read(primeHunterNotifierProvider).score}',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(primeHunterNotifierProvider.notifier).resetGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(primeHunterNotifierProvider);
    final notifier = ref.read(primeHunterNotifierProvider.notifier);

    ref.listen(primeHunterNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('prime_hunter');
          _showCompletionDialog(true);
        } else {
          HapticFeedbackUtil.vibrate();
          _showCompletionDialog(false);
        }
      } else if (next.score > (previous?.score ?? 0)) {
        HapticFeedbackUtil.selectionClick();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.primeHunterTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Prime Hunter',
      subtitle: l10n.primeHunterSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  radius: DesignSystem.radiusMD,
                  color: colorScheme.surface,
                  child: Text(
                    'SCORE: ${state.score}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: state.isGameOver 
              ? const SizedBox.shrink() 
              : Dismissible(
                  key: ValueKey(state.roundId),
                  onDismissed: (direction) {
                    // endToStart is LEFT swipe (Prime)
                    // startToEnd is RIGHT swipe (Composite)
                    notifier.onSwipe(direction == DismissDirection.endToStart);
                  },
                  child: Center(
                    child: Hero(
                      tag: 'number_${state.currentNumber}',
                      child: TangibleContainer(
                        radius: DesignSystem.radiusLG,
                        depth: 10.0,
                        padding: const EdgeInsets.all(DesignSystem.space3XL),
                        child: Text(
                          state.currentNumber.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.space2XL, vertical: DesignSystem.spaceXL),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIndicator('PRIME', Icons.arrow_back_rounded, DesignSystem.success),
                _buildIndicator('COMPOSITE', Icons.arrow_forward_rounded, DesignSystem.error),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(String label, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: DesignSystem.spaceXS),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
