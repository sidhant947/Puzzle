import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'find_word_provider.dart';
import 'find_word_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';

class FindWordScreen extends ConsumerStatefulWidget {
  const FindWordScreen({super.key});

  @override
  ConsumerState<FindWordScreen> createState() => _FindWordScreenState();
}

class _FindWordScreenState extends ConsumerState<FindWordScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(findWordNotifierProvider.notifier).initGame());

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 8, end: 0), weight: 1),
    ]).animate(CurvedAnimation(
      parent: _shakeController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findWordNotifierProvider);
    final notifier = ref.read(findWordNotifierProvider.notifier);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    ref.listen(findWordNotifierProvider, (previous, next) {
      if (next.isInvalidGuess && !(previous?.isInvalidGuess ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _shakeController.forward(from: 0);
      }
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.heavyImpact();
        }
        _showGameOverDialog(context, ref, next, theme);
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
          'FIND WORD',
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
              padding:
                  const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
              child: Column(
                children: [
                  Text(
                    'GUESS THE WORD',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  Text(
                    'You have ${FindWordEngine.maxTries} tries to find the hidden ${FindWordEngine.wordLength}-letter word.',
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
            _buildGrid(state, theme, isDark),
            const Spacer(),
            _buildKeyboard(state, notifier, theme, isDark),
            const SizedBox(height: DesignSystem.spaceLG),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(FindWordState state, ThemeData theme, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: List.generate(FindWordEngine.maxTries, (rowIndex) {
          String word = '';
          List<LetterStatus>? results;

          if (rowIndex < state.guesses.length) {
            word = state.guesses[rowIndex];
            results = state.results[rowIndex];
          } else if (rowIndex == state.guesses.length) {
            word = state.currentGuess;
          }

          bool isCurrentRow = rowIndex == state.guesses.length;

          Widget row = Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            height: 60,
            child: Row(
              children: List.generate(FindWordEngine.wordLength, (colIndex) {
                String letter = '';
                if (colIndex < word.length) {
                  letter = word[colIndex];
                }
                LetterStatus status =
                    results != null ? results[colIndex] : LetterStatus.initial;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _buildTile(letter, status, theme, isDark),
                  ),
                );
              }),
            ),
          );

          if (isCurrentRow) {
            return AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) => Transform.translate(
                  offset: Offset(_shakeAnimation.value, 0), child: child),
              child: row,
            );
          }

          return row;
        }),
      ),
    );
  }

  Widget _buildTile(
      String letter, LetterStatus status, ThemeData theme, bool isDark) {
    Color color = theme.colorScheme.surface;
    Color textColor = theme.colorScheme.onSurface;
    Border border = Border.all(
        color:
            theme.colorScheme.onSurface.withValues(alpha: isDark ? 0.4 : 0.25),
        width: 2.0);

    switch (status) {
      case LetterStatus.correctSpot:
        color = DesignSystem.gameGreen;
        textColor = Colors.white;
        border =
            Border.all(color: Colors.black.withValues(alpha: 0.1), width: 1.0);
        break;
      case LetterStatus.wrongSpot:
        color = DesignSystem.gameOrange;
        textColor = Colors.white;
        border =
            Border.all(color: Colors.black.withValues(alpha: 0.1), width: 1.0);
        break;
      case LetterStatus.notInWord:
        color = theme.colorScheme.onSurface.withValues(alpha: 0.1);
        textColor = theme.colorScheme.onSurface.withValues(alpha: 0.4);
        border = Border.all(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            width: 1.0);
        break;
      case LetterStatus.initial:
        if (letter.isNotEmpty) {
          border = Border.all(color: theme.colorScheme.primary, width: 2.5);
        }
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          letter,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(FindWordState state, FindWordNotifier notifier,
      ThemeData theme, bool isDark) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
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
                ...row.map(
                    (key) => _buildKey(key, state, notifier, theme, isDark)),
                if (rowIndex == 1) const SizedBox(width: 16),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(String label, FindWordState state, FindWordNotifier notifier,
      ThemeData theme, bool isDark) {
    bool isSpecialKey = label == 'ENTER' || label == 'DEL';
    int flex = isSpecialKey ? 4 : 2;

    LetterStatus status = state.keyboardStatus[label] ?? LetterStatus.initial;
    Color color = theme.colorScheme.surface;
    Color textColor = theme.colorScheme.onSurface;
    Border border = Border.all(
        color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
        width: 1);

    switch (status) {
      case LetterStatus.correctSpot:
        color = DesignSystem.gameGreen;
        textColor = Colors.white;
        border = Border.all(color: Colors.transparent);
        break;
      case LetterStatus.wrongSpot:
        color = DesignSystem.gameOrange;
        textColor = Colors.white;
        border = Border.all(color: Colors.transparent);
        break;
      case LetterStatus.notInWord:
        color = theme.colorScheme.onSurface.withValues(alpha: 0.05);
        textColor = theme.colorScheme.onSurface.withValues(alpha: 0.2);
        border = Border.all(color: Colors.transparent);
        break;
      default:
        color = theme.colorScheme.onSurface.withValues(alpha: 0.05);
        break;
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: GestureDetector(
          onTap: () {
            HapticFeedbackUtil.selectionClick();
            if (label == 'ENTER') {
              notifier.submitGuess();
            } else if (label == 'DEL') {
              notifier.removeLetter();
            } else {
              notifier.addLetter(label);
            }
          },
          child: Container(
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              border: border,
              borderRadius: BorderRadius.circular(6),
            ),
            child: label == 'DEL'
                ? Icon(Icons.backspace_outlined, size: 18, color: textColor)
                : Text(
                    label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontSize: label.length > 1 ? 10 : 14,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref,
      FindWordState state, ThemeData theme) async {
    if (state.isGameWon) {
      await ref
          .read(gameStreakNotifierProvider.notifier)
          .completeGame('find_word');
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
            ref.read(findWordNotifierProvider.notifier).initGame();
            Navigator.of(context).pop();
          },
          title: 'CONGRATS',
          message: 'Word found successfully: ${state.targetWord}',
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          side: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.2)),
        ),
        title: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceMD),
                decoration: BoxDecoration(
                  color: (state.isGameWon
                          ? DesignSystem.gameGreen
                          : DesignSystem.gameOrange)
                      .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  state.isGameWon
                      ? Icons.emoji_events_rounded
                      : Icons.sentiment_very_dissatisfied_rounded,
                  color: state.isGameWon
                      ? DesignSystem.gameGreen
                      : DesignSystem.gameOrange,
                  size: 48,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                state.isGameWon ? 'WELL DONE' : 'GAME OVER',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.isGameWon
                  ? 'Word found successfully.'
                  : 'No more tries left.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(state.targetWord,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 8.0,
                    color: theme.colorScheme.primary,
                  )),
            ),
          ],
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
