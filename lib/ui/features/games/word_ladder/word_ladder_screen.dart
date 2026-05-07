import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'word_ladder_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class WordLadderScreen extends ConsumerWidget {
  const WordLadderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wordLadderNotifierProvider);
    final notifier = ref.read(wordLadderNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(wordLadderNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
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
          'WORD LADDER',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.reset();
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
                    'BRIDGE THE GAP',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildWordBadge(state.startWord, theme, true),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.arrow_forward_rounded, color: Colors.grey),
                      ),
                      _buildWordBadge(state.endWord, theme, false),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _buildLadder(state, theme),
            ),
            if (state.errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(state.errorMessage!, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ),
            _buildCurrentInput(state, theme),
            _buildKeyboard(state, notifier, theme),
            const SizedBox(height: DesignSystem.spaceLG),
          ],
        ),
      ),
    );
  }

  Widget _buildWordBadge(String word, ThemeData theme, bool isStart) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: (isStart ? DesignSystem.gameBlue : DesignSystem.gamePurple).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: (isStart ? DesignSystem.gameBlue : DesignSystem.gamePurple).withValues(alpha: 0.3)),
      ),
      child: Text(
        word,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
          color: isStart ? DesignSystem.gameBlue : DesignSystem.gamePurple,
        ),
      ),
    );
  }

  Widget _buildLadder(WordLadderState state, ThemeData theme) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      itemCount: state.ladder.length,
      itemBuilder: (context, index) {
        final word = state.ladder[index];
        final isLast = index == state.ladder.length - 1;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                border: Border.all(color: isLast ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.1)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                word,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 8,
                  color: isLast ? theme.colorScheme.primary : Colors.grey,
                ),
              ),
            ),
            if (index < state.ladder.length - 1)
              const Icon(Icons.link_rounded, color: Colors.grey, size: 20),
          ],
        );
      },
    );
  }

  Widget _buildCurrentInput(WordLadderState state, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (i) {
          String letter = i < state.currentGuess.length ? state.currentGuess[i] : '';
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 45,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: letter.isNotEmpty ? theme.colorScheme.primary : theme.colorScheme.outline.withValues(alpha: 0.2),
                width: letter.isNotEmpty ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              letter,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildKeyboard(WordLadderState state, WordLadderNotifier notifier, ThemeData theme) {
    final rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: rows.map((row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((key) => Expanded(
            flex: (key == 'ENTER' || key == 'DEL') ? 3 : 2,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: InkWell(
                onTap: () {
                  HapticFeedbackUtil.selectionClick();
                  if (key == 'ENTER') {
                    notifier.submitGuess();
                  } else if (key == 'DEL') {
                    notifier.removeLetter();
                  } else {
                    notifier.addLetter(key);
                  }
                },
                child: Container(
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: key == 'DEL' ? const Icon(Icons.backspace_outlined, size: 16) : Text(key, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ),
            ),
          )).toList(),
        )).toList(),
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, WordLadderState state, ThemeData theme) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('word_ladder', xpAmount: 35);

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Center(child: Text('BRIDGE COMPLETE!')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events_rounded, size: 64, color: Colors.amber),
            const SizedBox(height: 16),
            Text('You successfully connected ${state.startWord} to ${state.endWord} in ${state.ladder.length} steps.'),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('CONTINUE'),
            ),
          ),
        ],
      ),
    );
  }
}
