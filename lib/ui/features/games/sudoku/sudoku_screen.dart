import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sudoku_provider.dart';
import 'sudoku_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

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
        _showVictoryDialog(context, ref, theme);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'SUDOKU',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.initGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
              child: Column(
                children: [
                  Text(
                    'LOGIC GRID',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  Text(
                    'Complete the grid so that every row, column, and 3x3 box contains all digits from 1 to 9.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _buildGrid(state, notifier, theme, isDark),
            const Spacer(),
            _buildNumberPad(notifier, theme, isDark),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
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
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: theme.colorScheme.onSurface,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 2),
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
                                ? theme.colorScheme.primary.withValues(alpha: 0.25)
                                : isSameDigit
                                  ? DesignSystem.gameAmber.withValues(alpha: 0.2)
                                  : isRelatedArea
                                    ? theme.colorScheme.primary.withValues(alpha: 0.05)
                                    : theme.colorScheme.surface,
                              border: Border(
                                right: BorderSide(
                                  color: theme.colorScheme.onSurface.withValues(alpha: borderRight ? 0.8 : 0.1), 
                                  width: borderRight ? 2.0 : 0.5
                                ),
                                bottom: BorderSide(
                                  color: theme.colorScheme.onSurface.withValues(alpha: borderBottom ? 0.8 : 0.1), 
                                  width: borderBottom ? 2.0 : 0.5
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                value == 0 ? '' : value.toString(),
                                style: theme.textTheme.displaySmall?.copyWith(
                                  fontSize: 22,
                                  fontWeight: isInitial ? FontWeight.w900 : FontWeight.w500,
                                  color: hasConflict
                                    ? DesignSystem.lightError
                                    : isSelected 
                                      ? theme.colorScheme.primary 
                                      : isSameDigit
                                        ? DesignSystem.gameAmber
                                        : isInitial 
                                          ? theme.colorScheme.onSurface 
                                          : theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(9, (i) {
            final num = i + 1;
            final isCompleted = (counts[num] ?? 0) >= 9;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 58,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.setNumber(num);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: isCompleted 
                          ? DesignSystem.gameGreen.withValues(alpha: 0.1) 
                          : theme.colorScheme.surface,
                      foregroundColor: isCompleted ? DesignSystem.gameGreen : theme.colorScheme.primary,
                      side: BorderSide(
                        color: isCompleted 
                            ? DesignSystem.gameGreen.withValues(alpha: 0.4)
                            : theme.colorScheme.primary.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      num.toString(), 
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: isCompleted ? DesignSystem.gameGreen : theme.colorScheme.primary,
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
                      ),
                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
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
          SizedBox(
            width: 58,
            height: 58,
            child: OutlinedButton(
              onPressed: () {
                HapticFeedbackUtil.mediumImpact();
                final selR = state.selectedRow;
                final selC = state.selectedCol;
                if (selR != null && selC != null) {
                  // Re-use setNumber with the current number to toggle it off
                  final currentVal = state.currentBoard[selR][selC];
                  if (currentVal != 0) {
                    notifier.setNumber(currentVal);
                  }
                }
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                side: BorderSide(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
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

  void _showVictoryDialog(BuildContext context, WidgetRef ref, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('sudoku');

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        title: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceMD),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.auto_awesome_rounded,
                  color: theme.colorScheme.primary,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'WELL DONE',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        content: Text(
          'Puzzle solved successfully with perfect logic.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('CONTINUE'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
