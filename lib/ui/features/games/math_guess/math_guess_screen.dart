import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'math_guess_provider.dart';

class MathGuessScreen extends ConsumerStatefulWidget {
  const MathGuessScreen({super.key});

  @override
  ConsumerState<MathGuessScreen> createState() => _MathGuessScreenState();
}

class _MathGuessScreenState extends ConsumerState<MathGuessScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => ref.read(mathGuessNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(MathGuessState state) {
    bool won = state.isGameWon;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('math_guess');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'BRAIN WIZARD!' : 'GAME OVER',
        message: won
            ? 'Correct! You found ${state.targetNumber} with ${state.guessesLeft} guesses left!'
            : 'Out of guesses! The number was ${state.targetNumber}.',
        onPlayAgain: () {
          ref.read(mathGuessNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.8),
            width: 1.5,
          ),
        ),
        title: const Text(
          'HOW TO PLAY',
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            fontSize: 24,
            letterSpacing: 1.2,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. A secret number is chosen between 1 and 10,000.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              '2. Type your guess on the number pad and submit it.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              '3. If wrong, you will get feedback on whether the secret is higher or lower.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              '4. You have exactly 15 attempts to find the secret number.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          TangibleButton(
            onTap: () => Navigator.pop(context),
            color: DesignSystem.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            radius: DesignSystem.radiusSM,
            child: const Text(
              'PLAY NOW',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(mathGuessNotifierProvider);
    final notifier = ref.read(mathGuessNotifierProvider.notifier);

    ref.listen(mathGuessNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next);
      }
    });

    return GameScaffold(
      title: 'MATH GUESS',
      onHowToPlay: _showHelpDialog,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStat('CHANCES LEFT', '${state.guessesLeft}',
                                DesignSystem.accentBerry),
                            _buildStat(
                                'GUESSES MADE',
                                '${state.guessesHistory.length}',
                                DesignSystem.accentEmerald),
                          ],
                        ),
                        const SizedBox(height: 8),
                        _buildChancesDots(state),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 50,
                          child: _buildHistoryList(state, colorScheme),
                        ),
                        const SizedBox(height: 16),
                        TangibleContainer(
                          depth: 4.0,
                          color: colorScheme.onSurface,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.feedbackMessage.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.surface
                                      .withValues(alpha: 0.8),
                                  letterSpacing: 1.1,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                state.currentInput.isEmpty
                                    ? '?'
                                    : state.currentInput,
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                  color: state.currentInput.isEmpty
                                      ? colorScheme.surface
                                          .withValues(alpha: 0.3)
                                      : colorScheme.surface,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildKeyboard(state, notifier, constraints),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChancesDots(MathGuessState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(15, (index) {
        final active = index < state.guessesLeft;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.0),
          width: 9,
          height: 9,
          decoration: BoxDecoration(
            color: active
                ? (state.guessesLeft <= 3
                    ? DesignSystem.accentBerry
                    : (state.guessesLeft <= 6
                        ? DesignSystem.accentAmber
                        : DesignSystem.accentEmerald))
                : Theme.of(context).colorScheme.outline,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildHistoryList(MathGuessState state, ColorScheme colorScheme) {
    if (state.guessesHistory.isEmpty) {
      return const Center(
        child: Text(
          'NO GUESSES YET',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 1.2,
          ),
        ),
      );
    }

    final scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: state.guessesHistory.length,
      itemBuilder: (context, index) {
        final record = state.guessesHistory[index];
        final isCorrect = record.result.contains('CORRECT');
        final isLow = record.result.contains('LOW');
        final Color bubbleColor = isCorrect
            ? DesignSystem.accentEmerald
            : (isLow ? DesignSystem.primary : DesignSystem.accentBerry);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: TangibleContainer(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            radius: 10,
            color: bubbleColor.withValues(alpha: 0.12),
            drawBorder: true,
            shadowColor: bubbleColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '#${index + 1}: ',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
                Text(
                  '${record.guess}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  record.result,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: bubbleColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildKeyboard(MathGuessState state, MathGuessNotifier notifier,
      BoxConstraints constraints) {
    final double keyWidth = (constraints.maxWidth - 48) / 3;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var row in [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9']
        ])
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row
                  .map((n) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: _PadKey(
                          label: n,
                          onTap: () => notifier.onNumberPressed(n),
                          width: keyWidth,
                        ),
                      ))
                  .toList(),
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: 'C',
                onTap: notifier.clearInput,
                color: DesignSystem.accentBerry,
                width: keyWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '0',
                onTap: () => notifier.onNumberPressed('0'),
                width: keyWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _PadKey(
                label: '⌫',
                onTap: notifier.onBackspace,
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.5),
                width: keyWidth,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 54,
          child: TangibleButton(
            onTap: state.currentInput.isEmpty ? null : notifier.submitGuess,
            color: state.currentInput.isEmpty
                ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)
                : DesignSystem.accentEmerald,
            padding: const EdgeInsets.all(12),
            child: const Text(
              'GUESS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PadKey extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final double width;

  const _PadKey(
      {required this.label,
      required this.onTap,
      this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.clamp(0, 80),
      height: 48,
      child: TangibleButton(
        onTap: onTap,
        color: color ?? Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.zero,
        child: Center(
          child: FittedBox(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color != null &&
                        color != Theme.of(context).colorScheme.surface
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
