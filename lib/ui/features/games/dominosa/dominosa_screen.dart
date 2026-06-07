import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'dominosa_provider.dart';

class DominosaScreen extends ConsumerStatefulWidget {
  const DominosaScreen({super.key});

  @override
  ConsumerState<DominosaScreen> createState() => _DominosaScreenState();
}

class _DominosaScreenState extends ConsumerState<DominosaScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dominosaNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.dominosaWinTitle,
        message: l10n.dominosaWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(dominosaNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(dominosaNotifierProvider);
    final notifier = ref.read(dominosaNotifierProvider.notifier);

    ref.listen(dominosaNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('dominosa');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.dominosaTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.dominosaTitle,
      subtitle: l10n.dominosaSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          padding: const EdgeInsets.all(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.howToPlay),
                content: Text(l10n.dominosaHowToPlay),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.gotIt),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.help_outline, color: colorScheme.onSurface),
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: AspectRatio(
            aspectRatio: state.grid[0].length / state.grid.length,
            child: LayoutBuilder(builder: (context, constraints) {
              final rows = state.grid.length;
              final cols = state.grid[0].length;
              final cellSize = constraints.maxWidth / cols;
              return Stack(
                children: [
                  // Cells
                  for (int r = 0; r < rows; r++)
                    for (int c = 0; c < cols; c++)
                      Positioned(
                        left: c * cellSize,
                        top: r * cellSize,
                        width: cellSize,
                        height: cellSize,
                        child: _buildCell(state, notifier, r, c, cellSize),
                      ),
                  // Selections
                  for (var sel in state.selections)
                    _buildSelection(sel, cellSize),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(DominosaState state, DominosaNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final val = state.grid[r][c];
    final isSelected = state.firstSelected != null && state.firstSelected![0] == r && state.firstSelected![1] == c;

    return GestureDetector(
      onTap: () => notifier.selectCell(r, c),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary.withValues(alpha: 0.2) : colorScheme.surface,
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1), 
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            val.toString(),
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelection(IList<IList<int>> sel, double cellSize) {
    final colorScheme = Theme.of(context).colorScheme;
    int r1 = sel[0][0], c1 = sel[0][1];
    int r2 = sel[1][0], c2 = sel[1][1];
    
    double left = (c1 < c2 ? c1 : c2) * cellSize;
    double top = (r1 < r2 ? r1 : r2) * cellSize;
    double width = (c1 == c2) ? cellSize : cellSize * 2;
    double height = (r1 == r2) ? cellSize : cellSize * 2;

    return Positioned(
      left: left + 4,
      top: top + 4,
      width: width - 8,
      height: height - 8,
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.primary, width: 3),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
