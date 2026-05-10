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
    final state = ref.watch(sudokuNotifierProvider);
    final notifier = ref.read(sudokuNotifierProvider.notifier);

    ref.listen(sudokuNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('sudoku').then((_) {
          if (mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => GameCompletionDialog(
                title: 'WELL DONE',
                message: 'Puzzle solved successfully with perfect logic.',
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
      }
    });

    return GameScaffold(
      title: 'SUDOKU',
      subtitle: 'Complete the grid so that every row, column, and 3x3 box contains all digits from 1 to 9.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 24,
          ),
        ),
      ],
      body: Column(
        children: [
          const Spacer(),
          _buildGrid(state, notifier),
          const Spacer(),
          _buildNumberPad(notifier),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier) {
    const int size = 9;
    final int? selR = state.selectedRow;
    final int? selC = state.selectedCol;
    final int selectedValue = (selR != null && selC != null) ? state.currentBoard[selR][selC] : 0;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: TangibleContainer(
        color: DesignSystem.ink, // Thick outer border color
        shadowColor: DesignSystem.inkSlate,
        radius: DesignSystem.radiusSM,
        depth: 6.0,
        padding: const EdgeInsets.all(4.0), // Bezel width
        child: Container(
          decoration: BoxDecoration(
            color: DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 4),
            child: AspectRatio(
              aspectRatio: 1,
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
                              duration: const Duration(milliseconds: 150),
                              decoration: BoxDecoration(
                                color: isSelected 
                                  ? DesignSystem.primary.withOpacity(0.2)
                                  : isSameDigit
                                    ? DesignSystem.accentAmber.withOpacity(0.2)
                                    : isRelatedArea
                                      ? DesignSystem.outline.withOpacity(0.3)
                                      : DesignSystem.surface,
                                border: Border(
                                  right: BorderSide(
                                    color: DesignSystem.ink, 
                                    width: borderRight ? 2.0 : 0.5
                                  ),
                                  bottom: BorderSide(
                                    color: DesignSystem.ink, 
                                    width: borderBottom ? 2.0 : 0.5
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  value == 0 ? '' : value.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: isInitial ? FontWeight.w900 : FontWeight.w700,
                                    color: hasConflict
                                      ? DesignSystem.error
                                      : isSelected 
                                        ? DesignSystem.primary 
                                        : isSameDigit
                                          ? DesignSystem.accentAmber
                                          : isInitial 
                                            ? DesignSystem.ink 
                                            : DesignSystem.inkSlate,
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

  Widget _buildNumberPad(SudokuNotifier notifier) {
    final state = ref.watch(sudokuNotifierProvider);
    
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
        spacing: DesignSystem.spaceMD,
        runSpacing: DesignSystem.spaceMD,
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(9, (i) {
            final num = i + 1;
            final isCompleted = (counts[num] ?? 0) >= 9;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                TangibleButton(
                  color: isCompleted ? DesignSystem.success : DesignSystem.surface,
                  shadowColor: isCompleted ? const Color(0xFF047857) : DesignSystem.outlineVariant,
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    notifier.setNumber(num);
                  },
                  child: Container(
                    width: 24, // Inner content sizing, TangibleButton adds padding
                    height: 24,
                    alignment: Alignment.center,
                    child: Text(
                      num.toString(), 
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: isCompleted ? Colors.white : DesignSystem.primary,
                      ),
                    ),
                  ),
                ),
                if (counts[num]! > 0)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isCompleted ? DesignSystem.success : DesignSystem.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: DesignSystem.surface, width: 2.0),
                      ),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        (9 - counts[num]!).clamp(0, 9).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
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
            color: DesignSystem.surface,
            shadowColor: DesignSystem.outlineVariant,
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
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: const Icon(
                Icons.backspace_rounded,
                size: 20,
                color: DesignSystem.inkSlate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
