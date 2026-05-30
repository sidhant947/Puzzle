import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';
import 'sequence_sleuth_provider.dart';

class SequenceSleuthScreen extends ConsumerStatefulWidget {
  const SequenceSleuthScreen({super.key});

  @override
  ConsumerState<SequenceSleuthScreen> createState() => _SequenceSleuthScreenState();
}

class _SequenceSleuthScreenState extends ConsumerState<SequenceSleuthScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(sequenceSleuthNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 5;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('sequence_sleuth');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SLEUTH MASTER!' : l10n.timeUp.toUpperCase(),
        message: 'You solved $score sequences!',
        onPlayAgain: () {
          ref.read(sequenceSleuthNotifierProvider.notifier).initGame();
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
    final state = ref.watch(sequenceSleuthNotifierProvider);
    final notifier = ref.read(sequenceSleuthNotifierProvider.notifier);

    ref.listen(sequenceSleuthNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.sequenceSleuthTitle.toUpperCase(),
      subtitle: l10n.sequenceSleuthSubtitle,
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
                  _buildSequenceDisplay(state),
                  const SizedBox(height: 32),
                  TangibleContainer(
                    depth: 2.0,
                    color: colorScheme.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    child: Text(
                      state.currentInput.isEmpty ? '?' : state.currentInput,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: DesignSystem.primary,
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildNumberPad(notifier, constraints),
                  const SizedBox(height: 20),
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

  Widget _buildSequenceDisplay(SequenceSleuthState state) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: state.currentProblem.sequence.map((n) {
        bool isQuestion = n == "?";
        return TangibleContainer(
          depth: isQuestion ? 4.0 : 2.0,
          color: isQuestion ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            n,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: isQuestion ? Colors.white : Theme.of(context).colorScheme.surface,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNumberPad(SequenceSleuthNotifier notifier, BoxConstraints constraints) {
    return Column(
      children: [
        for (var row in [[1, 2, 3], [4, 5, 6], [7, 8, 9]])
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((n) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _PadKey(
                  label: n.toString(),
                  onTap: () {
                    HapticFeedbackUtil.gameInteraction();
                    notifier.onNumberPressed(n.toString());
                  },
                  width: (constraints.maxWidth - 64) / 3,
                ),
              )).toList(),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: 'C',
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  notifier.clearInput();
                },
                color: DesignSystem.accentBerry,
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '0',
                onTap: () {
                  HapticFeedbackUtil.gameInteraction();
                  notifier.onNumberPressed('0');
                },
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '⌫',
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  notifier.onBackspace();
                },
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
                width: (constraints.maxWidth - 64) / 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PadKey extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final double width;

  const _PadKey({required this.label, required this.onTap, this.color, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.clamp(0, 80),
      height: 60,
      child: TangibleButton(
        onTap: onTap,
        color: color ?? Theme.of(context).colorScheme.surface,
        shadowColor: color?.withValues(alpha: 0.2) ?? Theme.of(context).colorScheme.outline,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color != null && color != Theme.of(context).colorScheme.surface
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
