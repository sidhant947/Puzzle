import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'odd_one_out_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

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

    return GameScaffold(
      title: 'ODD ONE OUT',
      subtitle: 'Find the tile with a different color.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(oddOneOutNotifierProvider.notifier).startGame();
            _startTimer();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildHeader(state),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                child: Center(
                  child: _buildGrid(ref, state),
                ),
              ),
              const Spacer(),
              _buildFooter(state),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(OddOneOutState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('SCORE', '${state.score}', DesignSystem.primary),
        _buildStatCard(
          'TIME', 
          '${state.timeLeft}s', 
          state.timeLeft < 10 ? DesignSystem.accentBerry : DesignSystem.primary
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: DesignSystem.surface,
      depth: 2,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: DesignSystem.ink,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(OddOneOutState state) {
    return const TangibleContainer(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: DesignSystem.surface,
      depth: 1,
      radius: DesignSystem.radiusFull,
      child: Text(
        'SPOT THE ANOMALY',
        style: TextStyle(
          color: DesignSystem.inkSlate,
          letterSpacing: 1,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildGrid(WidgetRef ref, OddOneOutState state) {
    final gridCount = state.level.colors.length;
    final crossAxisCount = gridCount > 0 ? math.sqrt(gridCount).toInt() : 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: state.level.colors.length,
          itemBuilder: (context, index) {
            final color = state.level.colors[index];
            return TangibleContainer(
              depth: 1,
              radius: DesignSystem.radiusXS,
              color: color,
              onTap: () {
                HapticFeedbackUtil.lightImpact();
                ref.read(oddOneOutNotifierProvider.notifier).pickTile(index);
              },
              child: const SizedBox.expand(),
            );
          },
        ),
      ),
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
        title: 'TIME IS UP!',
        message: 'Your score: ${ref.read(oddOneOutNotifierProvider).score}',
      ),
    );
  }
}
