import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'odd_one_out_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';

class OddOneOutScreen extends ConsumerStatefulWidget {
  const OddOneOutScreen({super.key});

  @override
  ConsumerState<OddOneOutScreen> createState() => _OddOneOutScreenState();
}

class _OddOneOutScreenState extends ConsumerState<OddOneOutScreen> {
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
      ref.read(oddOneOutNotifierProvider.notifier).tick();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(oddOneOutNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(oddOneOutNotifierProvider, (previous, next) {
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
          'ODD ONE OUT',
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
            _buildHeader(theme, state),
            const Spacer(),
            Center(
              child: _buildGrid(context, ref, state),
            ),
            const Spacer(),
            _buildFooter(theme, state),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, OddOneOutState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SCORE',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary.withValues(alpha: 0.6),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '${state.score}',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'TIME',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary.withValues(alpha: 0.6),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '${state.timeLeft}s',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: state.timeLeft < 10 ? DesignSystem.gameRose : theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme, OddOneOutState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Text(
        'FIND THE TILE WITH A DIFFERENT COLOR',
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.primary.withValues(alpha: 0.4),
          letterSpacing: 1,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, OddOneOutState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.9;
        final gridCount = state.level.colors.length;
        final crossAxisCount = gridCount > 0 ? math.sqrt(gridCount).toInt() : 2;

        return Container(
          width: boardSize,
          height: boardSize,
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: DesignSystem.spaceSM,
              mainAxisSpacing: DesignSystem.spaceSM,
            ),
            itemCount: state.level.colors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(oddOneOutNotifierProvider.notifier).pickTile(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: state.level.colors[index],
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('odd_one_out');
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
          ref.read(oddOneOutNotifierProvider.notifier).startGame();
          _startTimer();
          Navigator.of(context).pop();
        },
        title: 'CONGRATS',
        message: 'You found 50 odd ones! Final score: ${ref.read(oddOneOutNotifierProvider).score}',
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('TIME IS UP!'),
        content: Text('Your score: ${ref.read(oddOneOutNotifierProvider).score}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(oddOneOutNotifierProvider.notifier).startGame();
              _startTimer();
            },
            child: const Text('TRY AGAIN'),
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
