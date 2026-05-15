import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sudoku_provider.dart';
import 'sudoku_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class SudokuScreen extends ConsumerStatefulWidget {
  const SudokuScreen({super.key});

  @override
  ConsumerState<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends ConsumerState<SudokuScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(sudokuNotifierProvider);
    final notifier = ref.read(sudokuNotifierProvider.notifier);

    ref.listen(sudokuNotifierProvider, (previous, next) async {
      if (next.hasValue && next.value!.isSolved && !(previous?.value?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('sudoku');
        if (!context.mounted) return;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.wellDone.toUpperCase(),
            message: l10n.completed,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(sudokuNotifierProvider.notifier).initGame();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: l10n.sudokuTitle.toUpperCase(),
      subtitle: l10n.sudokuSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
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
        data: (sudokuState) => LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const Spacer(),
                _buildGrid(sudokuState, notifier, constraints.maxHeight * 0.5),
                const Spacer(),
                _buildNumberPad(sudokuState, notifier),
                const SizedBox(height: DesignSystem.spaceLG),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier, double maxHeight) {
    const int size = 9;
    final int? selR = state.selectedRow;
    final int? selC = state.selectedCol;
    final int selectedValue = (selR != null && selC != null) ? state.currentBoard[selR][selC] : 0;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2.0),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 2),
              child: Column(
                children: List.generate(size, (r) {
                  return Expanded(
                    child: Row(
                      children: List.generate(size, (c) {
                        final isInitial = state.initialBoard[r][c] != 0;
                        final isSelected = selR == r && selC == c;
                        final value = state.currentBoard[r][c];
                        
                        // Highlights
                        final bool isSameDigit = selectedValue != 0 && value == selectedValue;
                        final bool isRelatedArea = selR == r || selC == c || 
                                                 (selR != null && selC != null && 
                                                  (r ~/ 3 == selR ~/ 3 && c ~/ 3 == selC ~/ 3));
                        
                        // Conflict detection
                        bool hasConflict = false;
                        if (value != 0 && !isInitial) {
                          hasConflict = !SudokuEngine().isValid(state.currentBoard, r, c, value);
                        }

                        // Thick borders for 3x3 boxes
                        final bool borderRight = (c + 1) % 3 == 0 && c < size - 1;
                        final bool borderBottom = (r + 1) % 3 == 0 && r < size - 1;

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              HapticFeedbackUtil.selectionClick();
                              notifier.selectCell(r, c);
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                color: isSelected 
                                  ? DesignSystem.primary.withValues(alpha: 0.2)
                                  : isSameDigit
                                    ? DesignSystem.accentAmber.withValues(alpha: 0.2)
                                    : isRelatedArea
                                      ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.3)
                                      : Theme.of(context).colorScheme.surface,
                                border: Border(
                                  right: BorderSide(
                                    color: Theme.of(context).colorScheme.onSurface, 
                                    width: borderRight ? 2.0 : 0.5
                                  ),
                                  bottom: BorderSide(
                                    color: Theme.of(context).colorScheme.onSurface, 
                                    width: borderBottom ? 2.0 : 0.5
                                  ),
                                ),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    value == 0 ? '' : value.toString(),
                                    style: TextStyle(
                                      fontSize: 20, 
                                      fontWeight: isInitial ? FontWeight.w900 : FontWeight.w700,
                                      color: hasConflict
                                        ? DesignSystem.error
                                        : isSelected 
                                          ? DesignSystem.primary 
                                          : isSameDigit
                                            ? DesignSystem.accentAmber
                                            : isInitial 
                                              ? Theme.of(context).colorScheme.onSurface 
                                              : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad(SudokuState state, SudokuNotifier notifier) {
    
    final counts = {
      for (int i = 1; i <= 9; i++) i: 0
    };
    for (var row in state.currentBoard) {
      for (var val in row) {
        if (val != 0) counts[val] = (counts[val] ?? 0) + 1;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Wrap(
        spacing: DesignSystem.spaceSM, // Reduced from spaceMD
        runSpacing: DesignSystem.spaceSM, // Reduced from spaceMD
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(9, (i) {
            final num = i + 1;
            final isCompleted = (counts[num] ?? 0) >= 9;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                TangibleButton(
                  color: isCompleted ? DesignSystem.success : Theme.of(context).colorScheme.surface,
                  shadowColor: isCompleted ? Color(0xFF047857) : Theme.of(context).colorScheme.outline,
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    notifier.setNumber(num);
                  },
                  padding: const EdgeInsets.all(10), // Compact button
                  child: Container(
                    width: 20, 
                    height: 20,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        num.toString(), 
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18, // Reduced from 20
                          color: isCompleted ? Colors.white : DesignSystem.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                if (counts[num]! > 0)
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: isCompleted ? DesignSystem.success : DesignSystem.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).colorScheme.surface, width: 1.5),
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        (9 - counts[num]!).clamp(0, 9).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),
          // Eraser Button
          TangibleButton(
            color: Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            onTap: () {
              HapticFeedbackUtil.mediumImpact();
              final selR = state.selectedRow;
              final selC = state.selectedCol;
              if (selR != null && selC != null) {
                final currentVal = state.currentBoard[selR][selC];
                if (currentVal != 0) {
                  notifier.setNumber(currentVal);
                }
              }
            },
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Icon(
                Icons.backspace_rounded,
                size: 16, // Reduced from 20
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
