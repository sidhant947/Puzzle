import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
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
      title: l10n.oddOneOutTitle.toUpperCase(),
      subtitle: l10n.oddOneOutSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(oddOneOutNotifierProvider.notifier).startGame();
            _startTimer();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: colorScheme.onSurface,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const SizedBox(height: DesignSystem.spaceMD),
              _buildHeader(context, state),
              const Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                child: Center(
                  child: _buildGrid(ref, state),
                ),
              ),
              const Spacer(),
              _buildFooter(context, state),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, OddOneOutState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard(context, 'SCORE', '${state.score}', DesignSystem.primary),
        _buildStatCard(
          context,
          'TIME', 
          '${state.timeLeft}s', 
          state.timeLeft < 10 ? DesignSystem.accentBerry : DesignSystem.primary
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
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
          SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, OddOneOutState state) {
    return TangibleContainer(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      color: Theme.of(context).colorScheme.surface,
      depth: 1,
      radius: DesignSystem.radiusFull,
      child: Text(
        'SPOT THE ANOMALY',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
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
    final l10n = AppLocalizations.of(context)!;
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
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: false,
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
