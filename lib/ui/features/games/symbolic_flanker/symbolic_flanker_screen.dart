import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'symbolic_flanker_provider.dart';

class SymbolicFlankerScreen extends ConsumerStatefulWidget {
  const SymbolicFlankerScreen({super.key});

  @override
  ConsumerState<SymbolicFlankerScreen> createState() => _SymbolicFlankerScreenState();
}

class _SymbolicFlankerScreenState extends ConsumerState<SymbolicFlankerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(symbolicFlankerNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(symbolicFlankerNotifierProvider);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: 'You got ${state.score} correct out of ${state.totalTrials}!',
        isVictory: state.score > 20,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(symbolicFlankerNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(symbolicFlankerNotifierProvider);
    final notifier = ref.read(symbolicFlankerNotifierProvider.notifier);

    ref.listen(symbolicFlankerNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('symbolic_flanker');
        if (!context.mounted) return;
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: 'Symbolic Flanker',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Symbolic Flanker',
      subtitle: l10n.symbolicFlankerSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat('SCORE', state.score.toString()),
                _buildStat('TIME', '${state.timeLeft}s', color: state.timeLeft < 10 ? DesignSystem.error : null),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              state.display,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 8,
                color: DesignSystem.primary,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
            child: Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.onSymbolPressed('★');
                    },
                    color: colorScheme.surface,
                    child: Center(
                      child: Text(
                        '★',
                        style: TextStyle(fontSize: 32, color: colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceLG),
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.onSymbolPressed('◆');
                    },
                    color: colorScheme.surface,
                    child: Center(
                      child: Text(
                        '◆',
                        style: TextStyle(fontSize: 32, color: colorScheme.onSurface),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color ?? Theme.of(context).colorScheme.onSurface)),
      ],
    );
  }
}
