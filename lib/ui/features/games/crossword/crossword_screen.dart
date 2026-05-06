import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'crossword_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class CrosswordScreen extends ConsumerStatefulWidget {
  const CrosswordScreen({super.key});

  @override
  ConsumerState<CrosswordScreen> createState() => _CrosswordScreenState();
}

class _CrosswordScreenState extends ConsumerState<CrosswordScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crosswordNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crosswordNotifierProvider);
    final notifier = ref.read(crosswordNotifierProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    ref.listen(crosswordNotifierProvider, (previous, next) {
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
          'CROSSWORD',
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
      body: state.board == null
          ? Center(child: CircularProgressIndicator(color: theme.colorScheme.primary))
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: _buildGrid(state, notifier, theme, isDark),
                      ),
                    ),
                  ),
                  _buildCurrentClue(state, theme, isDark),
                  const SizedBox(height: 12),
                  _buildKeyboard(state, notifier, theme, isDark),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }

  Widget _buildGrid(CrosswordState state, CrosswordNotifier notifier, ThemeData theme, bool isDark) {
    final board = state.board!;
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceXS),
      decoration: BoxDecoration(
        color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.05),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG - 4),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: board.size,
            ),
            itemCount: board.size * board.size,
            itemBuilder: (context, index) {
              int x = index % board.size;
              int y = index ~/ board.size;
              String char = board.grid[y][x];
              bool isSelected = state.selectedX == x && state.selectedY == y;
              
              bool isInCurrentWord = false;
              if (state.selectedX != null && state.selectedY != null) {
                for (var w in board.words) {
                  if (w.isHorizontal == state.isAcross) {
                    if (state.isAcross && y == w.y && x >= w.x && x < w.x + w.word.length && state.selectedY == y && state.selectedX! >= w.x && state.selectedX! < w.x + w.word.length) {
                      isInCurrentWord = true;
                    } else if (!state.isAcross && x == w.x && y >= w.y && y < w.y + w.word.length && state.selectedX == x && state.selectedY! >= w.y && state.selectedY! < w.y + w.word.length) {
                      isInCurrentWord = true;
                    }
                  }
                }
              }

              if (char == ' ') {
                return Container(color: theme.colorScheme.onSurface.withValues(alpha: isDark ? 0.2 : 0.1));
              }

              int? num;
              for (var w in board.words) {
                if (w.x == x && w.y == y) {
                  num = w.number;
                  break;
                }
              }

              return GestureDetector(
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  notifier.selectCell(x, y);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? theme.colorScheme.primary.withValues(alpha: 0.2) 
                        : (isInCurrentWord ? theme.colorScheme.primary.withValues(alpha: 0.05) : theme.colorScheme.surface),
                    border: Border.all(
                      color: isSelected 
                        ? theme.colorScheme.primary.withValues(alpha: 0.5) 
                        : theme.colorScheme.outline.withValues(alpha: 0.1), 
                      width: 0.5
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (num != null)
                        Positioned(
                          left: 4,
                          top: 2,
                          child: Text(
                            num.toString(),
                            style: theme.textTheme.labelSmall?.copyWith(
                              fontSize: 9, 
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            ),
                          ),
                        ),
                      Center(
                        child: Text(
                          state.userGrid[y][x],
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentClue(CrosswordState state, ThemeData theme, bool isDark) {
    String clue = "SELECT A SQUARE";
    if (state.selectedX != null && state.selectedY != null) {
      for (var w in state.board!.words) {
        bool inWord = false;
        if (w.isHorizontal && state.isAcross) {
          if (state.selectedY == w.y && state.selectedX! >= w.x && state.selectedX! < w.x + w.word.length) inWord = true;
        } else if (!w.isHorizontal && !state.isAcross) {
          if (state.selectedX == w.x && state.selectedY! >= w.y && state.selectedY! < w.y + w.word.length) inWord = true;
        }
        if (inWord) {
          clue = "${w.number} ${w.isHorizontal ? 'ACROSS' : 'DOWN'}: ${w.clue}";
          break;
        }
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.1), width: 1),
      ),
      child: Text(
        clue.toUpperCase(),
        style: theme.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w900,
          color: theme.colorScheme.primary,
          letterSpacing: 0.5,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildKeyboard(CrosswordState state, CrosswordNotifier notifier, ThemeData theme, bool isDark) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: rows.asMap().entries.map((entry) {
          int rowIndex = entry.key;
          List<String> row = entry.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (rowIndex == 1) const SizedBox(width: 16),
                ...row.map((key) => _buildKey(key, state, notifier, theme, isDark)),
                if (rowIndex == 1) const SizedBox(width: 16),
                if (rowIndex == 2) const SizedBox(width: 24),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, CrosswordState state, CrosswordNotifier notifier, ThemeData theme, bool isDark) {
    bool isSpecialKey = label == 'DEL';
    int flex = isSpecialKey ? 3 : 2;

    Color color = theme.colorScheme.onSurface.withValues(alpha: 0.05);
    Color textColor = theme.colorScheme.onSurface;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            if (label == 'DEL') {
              notifier.removeLetter();
            } else {
              notifier.setLetter(label);
            }
          },
          child: Container(
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.1)),
            ),
            child: label == 'DEL'
                ? Icon(Icons.backspace_outlined, size: 18, color: textColor)
                : Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crossword');

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
          'Crossword completed successfully with perfect knowledge.',
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