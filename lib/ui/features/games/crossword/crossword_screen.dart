import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'crossword_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(crosswordNotifierProvider);
    final notifier = ref.read(crosswordNotifierProvider.notifier);

    ref.listen(crosswordNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.crosswordTitle.toUpperCase(),
      subtitle: l10n.crosswordSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.board == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    _buildGrid(state, notifier, constraints.maxHeight * 0.45),
                    const Spacer(),
                    _buildCurrentClue(state),
                    const SizedBox(height: DesignSystem.spaceSM),
                    _buildKeyboard(state, notifier),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildGrid(CrosswordState state, CrosswordNotifier notifier, double maxHeight) {
    final board = state.board!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
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
              return CrosswordCellWidget(x: x, y: y);
            },
          ),
        ),
      ),
    );
  }


}

class CrosswordCellWidget extends ConsumerWidget {
  final int x;
  final int y;

  const CrosswordCellWidget({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(crosswordNotifierProvider);
    final notifier = ref.read(crosswordNotifierProvider.notifier);
    final board = state.board!;

    // Selectively watch only the data this cell needs
    final userChar = ref.watch(crosswordNotifierProvider.select((s) => s.userGrid[y][x]));
    final isSelected = ref.watch(crosswordNotifierProvider.select((s) => s.selectedX == x && s.selectedY == y));
    
    // Check if cell is in the current word being played
    final isInCurrentWord = ref.watch(crosswordNotifierProvider.select((s) {
      if (s.selectedX == null || s.selectedY == null) return false;
      for (var w in board.words) {
        if (w.isHorizontal == s.isAcross) {
          if (s.isAcross && y == w.y && x >= w.x && x < w.x + w.word.length && s.selectedY == y && s.selectedX! >= w.x && s.selectedX! < w.x + w.word.length) {
            return true;
          } else if (!s.isAcross && x == w.x && y >= w.y && y < w.y + w.word.length && s.selectedX == x && s.selectedY! >= w.y && s.selectedY! < w.y + w.word.length) {
            return true;
          }
        }
      }
      return false;
    }));

    final char = board.grid[y][x];
    if (char == ' ') {
      return Container(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1));
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
              ? DesignSystem.primary.withValues(alpha: 0.2) 
              : (isInCurrentWord ? DesignSystem.primary.withValues(alpha: 0.05) : Theme.of(context).colorScheme.surface),
          border: Border.all(
            color: isSelected 
              ? DesignSystem.primary 
              : Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.5), 
            width: 0.5
          ),
        ),
        child: Stack(
          children: [
            if (num != null)
              Positioned(
                left: 2,
                top: 1,
                child: Text(
                  num.toString(),
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  child: Text(
                    userChar,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension CrosswordScreenControls on _CrosswordScreenState {


  Widget _buildCurrentClue(CrosswordState state) {
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: TangibleContainer(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            clue.toUpperCase(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: DesignSystem.primary,
              fontSize: 10, // Reduced from 12
              letterSpacing: 0.5,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(CrosswordState state, CrosswordNotifier notifier) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: rows.map((row) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map((key) => _buildKey(key, state, notifier)).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, CrosswordState state, CrosswordNotifier notifier) {
    bool isSpecialKey = label == 'DEL';
    
    return Expanded(
      flex: isSpecialKey ? 3 : 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: TangibleButton(
          color: isSpecialKey ? DesignSystem.accentBerry : Theme.of(context).colorScheme.surface,
          shadowColor: isSpecialKey ? Color(0xFFBE185D) : Theme.of(context).colorScheme.outline,
          padding: EdgeInsets.zero,
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            if (label == 'DEL') {
              notifier.removeLetter();
            } else {
              notifier.setLetter(label);
            }
          },
          child: Container(
            height: 40, // Reduced from 48
            alignment: Alignment.center,
            child: label == 'DEL'
                ? Icon(Icons.backspace_rounded, size: 16, color: Colors.white)
                : Text(
                    label,
                    style: TextStyle(
                      fontSize: 14, // Reduced from 16
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
          ),
        ),
      ),
    );
  }


  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crossword');
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
          ref.read(crosswordNotifierProvider.notifier).initGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
