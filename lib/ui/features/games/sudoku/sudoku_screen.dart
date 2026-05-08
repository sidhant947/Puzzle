import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sudoku_provider.dart';
import 'sudoku_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
        _buildAppBarButton(
          icon: Icons.refresh_rounded,
          onPressed: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
        ),
      ],
      body: Column(
        children: [
          const Spacer(),
          _buildGrid(state, notifier, theme, isDark),
          const Spacer(),
          _buildNumberPad(notifier, theme, isDark),
          const SizedBox(height: DesignSystem.spaceXL),
        ],
      ),
    );
  }

  Widget _buildAppBarButton({required IconData icon, required VoidCallback onPressed}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.2) : theme.colorScheme.primary.withValues(alpha: 0.04),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier, ThemeData theme, bool isDark) {
    const int size = 9;
    final int? selR = state.selectedRow;
    final int? selC = state.selectedCol;
    final int selectedValue = (selR != null && selC != null) ? state.currentBoard[selR][selC] : 0;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4), // Outer bezel
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.2 : 0.4),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.3) : theme.colorScheme.primary.withValues(alpha: 0.05),
            offset: const Offset(0, 12),
            blurRadius: 24,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.3 : 0.2),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 5),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: theme.colorScheme.surface,
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
                                  ? theme.colorScheme.primary.withValues(alpha: 0.15)
                                  : isSameDigit
                                    ? DesignSystem.gameAmber.withValues(alpha: 0.15)
                                    : isRelatedArea
                                      ? theme.colorScheme.primary.withValues(alpha: 0.03)
                                      : theme.colorScheme.surface,
                                border: Border(
                                  right: BorderSide(
                                    color: theme.colorScheme.outline.withValues(alpha: borderRight ? 1.0 : 0.5), 
                                    width: borderRight ? 1.5 : 0.5
                                  ),
                                  bottom: BorderSide(
                                    color: theme.colorScheme.outline.withValues(alpha: borderBottom ? 1.0 : 0.5), 
                                    width: borderBottom ? 1.5 : 0.5
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  value == 0 ? '' : value.toString(),
                                  style: theme.textTheme.displaySmall?.copyWith(
                                    fontSize: 22,
                                    fontWeight: isInitial ? FontWeight.w800 : FontWeight.w600,
                                    color: hasConflict
                                      ? DesignSystem.lightError
                                      : isSelected 
                                        ? theme.colorScheme.primary 
                                        : isSameDigit
                                          ? DesignSystem.gameAmber
                                          : isInitial 
                                            ? theme.colorScheme.onSurface 
                                            : theme.colorScheme.onSurface.withValues(alpha: 0.7),
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

  Widget _buildNumberPad(SudokuNotifier notifier, ThemeData theme, bool isDark) {
    final state = ref.watch(sudokuNotifierProvider);
    
    // Calculate counts for each digit
    final counts = {
      for (int i = 1; i <= 9; i++) i: 0
    };
    for (var row in state.currentBoard) {
      for (var val in row) {
        if (val != 0) counts[val] = (counts[val] ?? 0) + 1;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(9, (i) {
            final num = i + 1;
            final isCompleted = (counts[num] ?? 0) >= 9;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    notifier.setNumber(num);
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: isCompleted 
                          ? DesignSystem.gameGreen.withValues(alpha: 0.1) 
                          : theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isCompleted 
                            ? DesignSystem.gameGreen.withValues(alpha: 0.3)
                            : theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark ? Colors.black.withValues(alpha: 0.2) : theme.colorScheme.primary.withValues(alpha: 0.04),
                          offset: const Offset(0, 6),
                          blurRadius: 16,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        num.toString(), 
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: isCompleted ? DesignSystem.gameGreen : theme.colorScheme.primary,
                        ),
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
                        color: isCompleted ? DesignSystem.gameGreen : theme.colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.colorScheme.surface, width: 1.5),
                      ),
                      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        (9 - counts[num]!).clamp(0, 9).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }),
          // Eraser Button
          GestureDetector(
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
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.5),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withValues(alpha: 0.2) : theme.colorScheme.primary.withValues(alpha: 0.04),
                    offset: const Offset(0, 6),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Icon(
                Icons.backspace_rounded,
                size: 20,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
