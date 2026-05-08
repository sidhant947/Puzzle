import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'spelling_sprint_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class SpellingSprintScreen extends ConsumerStatefulWidget {
  const SpellingSprintScreen({super.key});

  @override
  ConsumerState<SpellingSprintScreen> createState() => _SpellingSprintScreenState();
}

class _SpellingSprintScreenState extends ConsumerState<SpellingSprintScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      ref.read(spellingSprintNotifierProvider.notifier).tick();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(spellingSprintNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(spellingSprintNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _timer?.cancel();
        _showVictoryDialog(context, ref);
      } else if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _timer?.cancel();
        _showGameOverDialog(context, ref);
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
          'SPELLING SPRINT',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            _buildStats(theme, state),
            const Spacer(),
            _buildWordDisplay(theme, state),
            const SizedBox(height: DesignSystem.spaceXL),
            _buildLetterGrid(context, ref, state),
            const Spacer(),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildStats(ThemeData theme, SpellingSprintState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem(theme, 'SCORE', '${state.score}/10'),
          _buildStatItem(theme, 'TIME', '${state.timeLeft}s', 
            color: state.timeLeft < 10 ? DesignSystem.gameRose : null),
        ],
      ),
    );
  }

  Widget _buildStatItem(ThemeData theme, String label, String value, {Color? color}) {
    return Column(
      crossAxisAlignment: label == 'TIME' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary.withValues(alpha: 0.6),
            letterSpacing: 1.5,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: color ?? theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildWordDisplay(ThemeData theme, SpellingSprintState state) {
    return Column(
      children: [
        Text(
          'SPELL THIS WORD',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary.withValues(alpha: 0.4),
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(state.targetWord.length, (i) {
            final letter = i < state.currentSpelling.length ? state.currentSpelling[i] : '';
            return Container(
              width: 40,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: letter.isNotEmpty ? DesignSystem.gameGreen : theme.colorScheme.primary.withValues(alpha: 0.2),
                    width: 3,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  letter,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.gameGreen,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: DesignSystem.spaceLG),
        Text(
          state.targetWord,
          style: theme.textTheme.displaySmall?.copyWith(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            fontWeight: FontWeight.w900,
            letterSpacing: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildLetterGrid(BuildContext context, WidgetRef ref, SpellingSprintState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Wrap(
        spacing: DesignSystem.spaceSM,
        runSpacing: DesignSystem.spaceSM,
        alignment: WrapAlignment.center,
        children: List.generate(state.availableLetters.length, (index) {
          return GestureDetector(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              ref.read(spellingSprintNotifierProvider.notifier).addLetter(index);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  state.availableLetters[index],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('spelling_sprint');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CONGRATS',
        message: 'You spelled all 10 words correctly!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(spellingSprintNotifierProvider.notifier).startGame();
          _startTimer();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('TIME UP!'),
        content: Text('You spelled ${ref.read(spellingSprintNotifierProvider).score} words.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(spellingSprintNotifierProvider.notifier).startGame();
              _startTimer();
            },
            child: const Text('RETRY'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('HOME'),
          ),
        ],
      ),
    );
  }
}
