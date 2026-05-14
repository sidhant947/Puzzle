import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import 'simon_sequence_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';

class SimonSequenceScreen extends ConsumerStatefulWidget {
  const SimonSequenceScreen({super.key});

  @override
  ConsumerState<SimonSequenceScreen> createState() => _SimonSequenceScreenState();
}

class _SimonSequenceScreenState extends ConsumerState<SimonSequenceScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(simonSequenceNotifierProvider.notifier).startSequence());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(simonSequenceNotifierProvider);

    ref.listen(simonSequenceNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(context, ref, next, false);
      }
      if (next.isGameWon && !(previous?.isGameWon ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next, true);
      }
    });

    return GameScaffold(
      title: l10n.simonSequenceTitle.toUpperCase(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: TangibleContainer(
                  depth: 3.0, // Reduced from 4.0
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    children: [
                      Text(
                        state.isShowingSequence ? 'WATCH...' : 'YOUR TURN!', 
                        style: const TextStyle(
                          fontSize: 18, // Reduced from 24
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: DesignSystem.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${state.userSequence.length} / ${state.sequence.length}', 
                        style: TextStyle(
                          fontSize: 12, // Reduced from 16
                          fontWeight: FontWeight.bold,
                          color: colorScheme.outline.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              _buildGrid(state, constraints.maxHeight * 0.45),
              const Spacer(),
              TangibleButton(
                onTap: state.isShowingSequence ? () {} : () => ref.read(simonSequenceNotifierProvider.notifier).reset(),
                color: state.isShowingSequence ? colorScheme.outline.withValues(alpha: 0.5) : DesignSystem.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: const Text(
                  'RESTART',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGrid(SimonSequenceState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            padding: const EdgeInsets.all(DesignSystem.spaceXS),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              final isHighlighted = state.highlightedTile == index;
              final isFailed = state.failedTile == index;
              
              Color tileColor = Theme.of(context).colorScheme.surface;
              if (isHighlighted) tileColor = DesignSystem.accentAmber;
              if (isFailed) tileColor = DesignSystem.error;

              return GestureDetector(
                onTap: () {
                  if (!state.isShowingSequence) {
                    HapticFeedbackUtil.selectionClick();
                    ref.read(simonSequenceNotifierProvider.notifier).tapTile(index);
                  }
                },
                child: TangibleContainer(
                  depth: (isHighlighted || isFailed) ? 0.0 : 3.0,
                  radius: DesignSystem.radiusMD,
                  color: tileColor,
                  child: (isHighlighted || isFailed) 
                    ? Center(
                        child: Icon(
                          isFailed ? Icons.close_rounded : Icons.flash_on_rounded, 
                          color: Colors.white, 
                          size: 24
                        )
                      )
                    : const SizedBox.shrink(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


  void _showGameOverDialog(BuildContext context, WidgetRef ref, SimonSequenceState state, bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('simon_sequence', xpAmount: 50);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          onHome: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          onPlayAgain: () {
            ref.read(simonSequenceNotifierProvider.notifier).reset();
            Navigator.of(context).pop();
          },
          title: 'CONGRATS',
          message: 'You memorized all 10 tiles!',
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'WRONG SEQUENCE',
        message: 'Try again to master the sequence.',
        onPlayAgain: () {
          Navigator.pop(context);
          ref.read(simonSequenceNotifierProvider.notifier).reset();
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }
}
