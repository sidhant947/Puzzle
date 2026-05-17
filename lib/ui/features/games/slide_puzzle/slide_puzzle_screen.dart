import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/tangible.dart';
import 'slide_puzzle_engine.dart';
import 'slide_puzzle_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class SlidePuzzleScreen extends ConsumerWidget {
  const SlidePuzzleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(slidePuzzleNotifierProvider);

    ref.listen(slidePuzzleNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.slidePuzzleTitle.toUpperCase(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return Column(
              children: [
                SizedBox(height: isSmall ? 8 : 16),
                _buildInstructions(context, isSmall),
                const Spacer(),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: constraints.maxHeight * (isSmall ? 0.55 : 0.5),
                    ),
                    child: _buildBoard(context, ref, state, isSmall),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isSmall ? 32 : 48),
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.mediumImpact();
                      ref.read(slidePuzzleNotifierProvider.notifier).newGame();
                    },
                    child: Text(l10n.slidePuzzleNewGame),
                  ),
                ),
                SizedBox(height: isSmall ? 16 : 32),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInstructions(BuildContext context, bool isSmall) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: TangibleContainer(
        radius: DesignSystem.radiusMD,
        depth: isSmall ? 2.0 : 4.0,
        padding: EdgeInsets.all(isSmall ? 8 : 16),
        child: Column(
          children: [
            Text(
              l10n.slidePuzzleTileSlider,
              style: TextStyle(
                color: DesignSystem.primary,
                fontSize: isSmall ? 12 : 14,
                letterSpacing: 2,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: isSmall ? 4 : 8),
            Text(
              l10n.slidePuzzleInstructions,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                fontSize: isSmall ? 10 : 12,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoard(BuildContext context, WidgetRef ref, SlidePuzzleState state, bool isSmall) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: SlidePuzzleEngine.size,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: SlidePuzzleEngine.size * SlidePuzzleEngine.size,
          itemBuilder: (context, index) {
            final value = state.board[index];
            if (value == 0) return const SizedBox.shrink();

            final isCorrect = value == index + 1;

            return GestureDetector(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                ref.read(slidePuzzleNotifierProvider.notifier).moveTile(index);
              },
              child: TangibleContainer(
                radius: DesignSystem.radiusXS,
                depth: isSmall ? 2.0 : 3.0,
                color: isCorrect 
                    ? DesignSystem.primary.withValues(alpha: 0.1) 
                    : Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Text(
                    '$value',
                    style: TextStyle(
                      fontSize: isSmall ? 20 : 28,
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('slide_puzzle');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(slidePuzzleNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
        title: l10n.congrats.toUpperCase(),
        message: l10n.slidePuzzleCongrats,
      ),
    );
  }
}
