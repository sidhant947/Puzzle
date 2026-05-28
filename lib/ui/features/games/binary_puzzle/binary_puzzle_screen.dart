import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'binary_puzzle_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class BinaryPuzzleScreen extends ConsumerWidget {
  const BinaryPuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(binaryPuzzleNotifierProvider);

    ref.listen(binaryPuzzleNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.binaryPuzzleTitle,
      subtitle: l10n.binaryPuzzleSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              _buildBoard(context, ref, state, constraints.maxHeight * 0.6),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, BinaryPuzzleState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            padding: const EdgeInsets.all(DesignSystem.spaceXS),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.board.size,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: state.board.size * state.board.size,
            itemBuilder: (context, index) {
              final r = index ~/ state.board.size;
              final c = index % state.board.size;
              final cell = state.currentGrid[r][c];
              final isFixed = state.fixedCells[r][c];

              return TangibleContainer(
                depth: isFixed ? 0 : 2,
                radius: DesignSystem.radiusXS,
                padding: const EdgeInsets.all(4.0),
                color: isFixed 
                    ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1) 
                    : Theme.of(context).colorScheme.surface,
                onTap: isFixed ? null : () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(binaryPuzzleNotifierProvider.notifier).toggleCell(r, c);
                },
                child: Center(
                  child: cell == null
                      ? const SizedBox.shrink()
                      : FittedBox(
                          child: Text(
                            '$cell',
                            style: TextStyle(
                              fontSize: 24,
                              color: isFixed 
                                ? Theme.of(context).colorScheme.onSurface
                                : DesignSystem.primary,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_puzzle');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.binaryPuzzleWinTitle,
        message: l10n.binaryPuzzleWinMessage,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(binaryPuzzleNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

