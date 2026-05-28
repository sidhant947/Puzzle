import 'package:puzzle/l10n/app_localizations.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'spelling_sprint_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(spellingSprintNotifierProvider);

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

    return GameScaffold(
      title: l10n.spellingSprintTitle.toUpperCase(),
      subtitle: l10n.spellingSprintSubtitle,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return Column(
              children: [
                SizedBox(height: isSmall ? 8 : 16),
                _buildStats(state, isSmall),
                const Spacer(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * (isSmall ? 0.45 : 0.4),
                  ),
                  child: _buildWordDisplay(state, isSmall),
                ),
                SizedBox(height: isSmall ? 16 : 32),
                _buildLetterGrid(context, ref, state, isSmall),
                const Spacer(),
                SizedBox(height: isSmall ? 8 : 16),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStats(SpellingSprintState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('SCORE', '${state.score}/10', isSmall: isSmall),
          _buildStatItem('TIME', '${state.timeLeft}s', 
            color: state.timeLeft < 10 ? DesignSystem.error : null, isSmall: isSmall),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, {Color? color, bool isSmall = false}) {
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      depth: isSmall ? 2.0 : 4.0,
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16, 
        vertical: isSmall ? 4 : 8
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: isSmall ? 16 : 20,
              color: color ?? DesignSystem.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWordDisplay(SpellingSprintState state, bool isSmall) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SPELL THE WORD',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            letterSpacing: 2,
            fontSize: isSmall ? 10 : 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: isSmall ? 12 : 24),
        TangibleContainer(
          color: Theme.of(context).colorScheme.onSurface,
          shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
          depth: isSmall ? 2.0 : 4.0,
          padding: EdgeInsets.all(isSmall ? 8 : 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(state.targetWord.length, (i) {
                final letter = i < state.currentSpelling.length ? state.currentSpelling[i] : '';
                return Container(
                  width: isSmall ? 30 : 40,
                  height: isSmall ? 40 : 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: letter.isNotEmpty ? DesignSystem.success : Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
                        width: 3,
                      ),
                    ),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: isSmall ? 24 : 32,
                          color: DesignSystem.success,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLetterGrid(BuildContext context, WidgetRef ref, SpellingSprintState state, bool isSmall) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
        child: Wrap(
          spacing: isSmall ? 8 : 12,
          runSpacing: isSmall ? 8 : 12,
          alignment: WrapAlignment.center,
          children: List.generate(state.availableLetters.length, (index) {
            return SizedBox(
              width: isSmall ? 38 : 44,
              height: isSmall ? 38 : 44,
              child: TangibleButton(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(spellingSprintNotifierProvider.notifier).addLetter(index);
                },
                color: Theme.of(context).colorScheme.surface,
                shadowColor: Theme.of(context).colorScheme.outline,
                padding: EdgeInsets.zero,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      state.availableLetters[index],
                      style: TextStyle(
                        color: DesignSystem.primary,
                        fontSize: isSmall ? 20 : 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
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
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: false,
        title: 'TIME UP!',
        message: 'You spelled ${ref.read(spellingSprintNotifierProvider).score} words.',
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
}
