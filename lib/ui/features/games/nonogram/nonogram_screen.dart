import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'nonogram_provider.dart';

class NonogramScreen extends ConsumerStatefulWidget {
  const NonogramScreen({super.key});

  @override
  ConsumerState<NonogramScreen> createState() => _NonogramScreenState();
}

class _NonogramScreenState extends ConsumerState<NonogramScreen> {
  bool _isMarkMode = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(nonogramNotifierProvider);

    ref.listen(nonogramNotifierProvider, (previous, next) {
      if (next.hasValue && next.value!.isSolved && !(previous?.value?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.nonogramWin.toUpperCase(),
            message: l10n.completed,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(nonogramNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.nonogramTitle.toUpperCase(),
      subtitle: l10n.nonogramSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(nonogramNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (nonogramState) => LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(height: DesignSystem.spaceSM),
                _buildStatusHeader(nonogramState),
                const SizedBox(height: DesignSystem.spaceMD),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                    child: Column(
                      children: [
                        // Column Clues Area
                        Row(
                          children: [
                            const SizedBox(width: 40), // Row clues spacer
                            for (int c = 0; c < nonogramState.size; c++)
                              Expanded(child: _buildColClue(nonogramState.colClues[c])),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Grid + Row Clues Area
                        Expanded(
                          child: Column(
                            children: [
                              for (int r = 0; r < nonogramState.size; r++)
                                Expanded(
                                  child: Row(
                                    children: [
                                      _buildRowClue(nonogramState.rowClues[r]),
                                      const SizedBox(width: 8),
                                      for (int c = 0; c < nonogramState.size; c++)
                                        Expanded(child: NonogramCell(row: r, col: c, isMarkMode: _isMarkMode)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceMD),
                _buildControls(),
                const SizedBox(height: DesignSystem.spaceLG),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusHeader(NonogramState state) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      color: DesignSystem.accentBerry.withValues(alpha: 0.1),
      radius: DesignSystem.radiusFull,
      depth: 2,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.grid_on_rounded, size: 16, color: DesignSystem.accentBerry),
          SizedBox(width: 8),
          Text(
            'NONOGRAM',
            style: TextStyle(
              color: DesignSystem.accentBerry,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColClue(List<int> clues) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  clue.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRowClue(List<int> clues) {
    return Container(
      width: 40,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Padding(
              padding: const EdgeInsets.only(right: 2),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  clue.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        children: [
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                setState(() => _isMarkMode = false);
              },
              color: !_isMarkMode ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface,
              shadowColor: !_isMarkMode ? DesignSystem.accentBerry.withValues(alpha: 0.8) : Theme.of(context).colorScheme.outline,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.square_rounded, color: !_isMarkMode ? Colors.white : Theme.of(context).colorScheme.onSurface),
                  const SizedBox(width: 8),
                  Text(
                    'FILL',
                    style: TextStyle(color: !_isMarkMode ? Colors.white : Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: TangibleButton(
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                setState(() => _isMarkMode = true);
              },
              color: _isMarkMode ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface,
              shadowColor: _isMarkMode ? DesignSystem.accentBerry.withValues(alpha: 0.8) : Theme.of(context).colorScheme.outline,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close_rounded, color: _isMarkMode ? Colors.white : Theme.of(context).colorScheme.onSurface),
                  const SizedBox(width: 8),
                  Text(
                    'MARK',
                    style: TextStyle(color: _isMarkMode ? Colors.white : Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NonogramCell extends ConsumerWidget {
  final int row;
  final int col;
  final bool isMarkMode;

  const NonogramCell({
    super.key,
    required this.row,
    required this.col,
    required this.isMarkMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(nonogramNotifierProvider.select((s) => s.value?.grid[row][col] ?? 0));

    return Padding(
      padding: const EdgeInsets.all(1),
      child: TangibleContainer(
        depth: value == 1 ? 0 : 2.0,
        radius: 4,
        padding: EdgeInsets.zero,
        color: value == 1 ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface,
        onTap: () {
          HapticFeedbackUtil.lightImpact();
          ref.read(nonogramNotifierProvider.notifier).toggleCell(row, col, isMarkMode);
        },
        onLongPress: () {
          HapticFeedbackUtil.mediumImpact();
          ref.read(nonogramNotifierProvider.notifier).toggleCell(row, col, true);
        },
        child: Center(
          child: value == 2
              ? FittedBox(
                  child: Icon(
                    Icons.close_rounded,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
