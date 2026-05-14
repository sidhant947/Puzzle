import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'find_word_provider.dart';
import 'find_word_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

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
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(findWordNotifierProvider);
    final notifier = ref.read(findWordNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

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
        _showGameOverDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: l10n.categoryWord.toUpperCase(),
      subtitle: l10n.findWordSubtitle(FindWordEngine.maxTries, FindWordEngine.wordLength),
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded,
              size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceLG),
              Expanded(child: _buildGrid(state)),
              const SizedBox(height: DesignSystem.spaceLG),
              _buildKeyboard(state, notifier),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGrid(FindWordState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: TangibleContainer(
        color: Theme.of(context).colorScheme.onSurface,
        shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
        depth: 4.0,
        radius: DesignSystem.radiusMD,
        padding: const EdgeInsets.all(DesignSystem.spaceSM),
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

            Widget rowContent = Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: List.generate(FindWordEngine.wordLength, (colIndex) {
                  String letter = '';
                  if (colIndex < word.length) {
                    letter = word[colIndex];
                  }
                  LetterStatus status = results != null
                      ? results[colIndex]
                      : LetterStatus.initial;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: _buildTile(letter, status,
                          isCurrentRow && colIndex < word.length),
                    ),
                  );
                }),
              ),
            );

            if (isCurrentRow) {
              rowContent = AnimatedBuilder(
                animation: _shakeAnimation,
                builder: (context, child) => Transform.translate(
                    offset: Offset(_shakeAnimation.value, 0), child: child),
                child: rowContent,
              );
            }

            return Expanded(child: rowContent);
          }),
        ),
      ),
    );
  }

  Widget _buildTile(String letter, LetterStatus status, bool isTyping) {
    Color color = Theme.of(context).colorScheme.surface;
    Color shadowColor = Theme.of(context).colorScheme.outline;
    Color textColor = Theme.of(context).colorScheme.onSurface;

    switch (status) {
      case LetterStatus.correctSpot:
        color = DesignSystem.success;
        shadowColor = const Color(0xFF047857);
        textColor = Colors.white;
        break;
      case LetterStatus.wrongSpot:
        color = DesignSystem.accentAmber;
        shadowColor = const Color(0xFFB45309);
        textColor = Colors.white;
        break;
      case LetterStatus.notInWord:
        color = Theme.of(context).scaffoldBackgroundColor;
        shadowColor = Theme.of(context).colorScheme.outline.withValues(alpha: 0.5);
        textColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3);
        break;
      case LetterStatus.initial:
        if (isTyping) {
          color = DesignSystem.primary.withValues(alpha: 0.05);
          shadowColor = DesignSystem.primary;
        }
        break;
    }

    return TangibleContainer(
      depth: status == LetterStatus.initial ? 1.0 : 3.0,
      radius: DesignSystem.radiusXS,
      color: color,
      shadowColor: shadowColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: FittedBox(
            child: Text(
              letter,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard(FindWordState state, FindWordNotifier notifier) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['DEL', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'ENTER'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: rows.map((row) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  row.map((key) => _buildKey(key, state, notifier)).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKey(
      String label, FindWordState state, FindWordNotifier notifier) {
    bool isSpecialKey = label == 'ENTER' || label == 'DEL';

    LetterStatus status = state.keyboardStatus[label] ?? LetterStatus.initial;
    Color color = Theme.of(context).colorScheme.surface;
    Color shadowColor = Theme.of(context).colorScheme.outline;
    Color textColor = Theme.of(context).colorScheme.onSurface;

    switch (status) {
      case LetterStatus.correctSpot:
        color = DesignSystem.success;
        shadowColor = const Color(0xFF047857);
        textColor = Colors.white;
        break;
      case LetterStatus.wrongSpot:
        color = DesignSystem.accentAmber;
        shadowColor = const Color(0xFFB45309);
        textColor = Colors.white;
        break;
      case LetterStatus.notInWord:
        color = Theme.of(context).scaffoldBackgroundColor;
        shadowColor = Theme.of(context).colorScheme.outline.withValues(alpha: 0.5);
        textColor = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2);
        break;
      default:
        break;
    }

    if (isSpecialKey) {
      color = DesignSystem.primary;
      shadowColor = DesignSystem.primaryShadow;
      textColor = Colors.white;
    }

    return Expanded(
      flex: isSpecialKey ? 4 : 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: TangibleButton(
          color: color,
          shadowColor: shadowColor,
          padding: EdgeInsets.zero,
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
            height: 40,
            alignment: Alignment.center,
            child: label == 'DEL'
                ? const Icon(Icons.backspace_rounded,
                    size: 16, color: Colors.white)
                : Text(
                    label,
                    style: TextStyle(
                      fontSize: label.length > 1 ? 9 : 14,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _showGameOverDialog(
      BuildContext context, WidgetRef ref, FindWordState state) async {
    final l10n = AppLocalizations.of(context)!;
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
          title: l10n.congrats,
          message: l10n.wordFoundMessage(state.targetWord),
        ),
      );
      return;
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: false,
        title: l10n.gameOver.toUpperCase(),
        message: l10n.gameOverMessage(state.targetWord),
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(findWordNotifierProvider.notifier).initGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
