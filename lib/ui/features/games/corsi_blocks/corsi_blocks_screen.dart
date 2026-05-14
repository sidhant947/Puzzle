import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'corsi_blocks_provider.dart';

class CorsiBlocksScreen extends ConsumerStatefulWidget {
  const CorsiBlocksScreen({super.key});

  @override
  ConsumerState<CorsiBlocksScreen> createState() => _CorsiBlocksScreenState();
}

class _CorsiBlocksScreenState extends ConsumerState<CorsiBlocksScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(corsiBlocksNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 5;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('corsi_blocks');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SPATIAL MASTER!' : 'LOST IN SPACE',
        message: 'You recalled $score sequences! Your spatial memory span reached ${ref.read(corsiBlocksNotifierProvider).currentLength}.',
        onPlayAgain: () {
          ref.read(corsiBlocksNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(corsiBlocksNotifierProvider);

    ref.listen(corsiBlocksNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: l10n.corsiBlocksTitle.toUpperCase(),
      subtitle: l10n.corsiBlocksSubtitle,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      SizedBox(height: isSmall ? 8 : 16),
                      _buildStats(state, isSmall),
                      const Spacer(),
                      _buildPhaseIndicator(state),
                      const SizedBox(height: 20),
                      _buildGrid(state, constraints.maxWidth),
                      const Spacer(),
                      if (state.phase == CorsiPhase.result)
                        _buildResult(state)
                      else
                        const SizedBox(height: 80),
                      SizedBox(height: isSmall ? 12 : 24),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildPhaseIndicator(CorsiBlocksState state) {
    String text = '';
    Color color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7);
    if (state.phase == CorsiPhase.showing) {
      text = 'WATCH THE PATTERN';
      color = DesignSystem.primary;
    } else if (state.phase == CorsiPhase.inputting) {
      text = 'REPEAT THE PATTERN';
      color = DesignSystem.accentBerry;
    } else {
      text = state.lastRoundCorrect == true ? 'EXCELLENT!' : 'TRY AGAIN!';
      color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 2, 
        fontWeight: FontWeight.w800, 
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildGrid(CorsiBlocksState state, double maxWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth - 48),
        child: AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: 16,
            itemBuilder: (context, index) {
              final isHighlighted = state.highlightedIndex == index;
              final isTapped = state.userSequence.contains(index) && state.phase == CorsiPhase.inputting;
              
              return TangibleButton(
                onTap: () {
                  if (state.phase == CorsiPhase.inputting) {
                    HapticFeedbackUtil.lightImpact();
                    ref.read(corsiBlocksNotifierProvider.notifier).onBlockTap(index);
                  }
                },
                color: isHighlighted 
                    ? DesignSystem.accentAmber 
                    : (isTapped ? DesignSystem.primary.withValues(alpha: 0.3) : Theme.of(context).colorScheme.surface),
                shadowColor: isHighlighted ? DesignSystem.accentAmber.withValues(alpha: 0.5) : Theme.of(context).colorScheme.outline,
                depth: isHighlighted ? 1.0 : 3.0,
                child: Center(
                  child: isHighlighted 
                      ? const Icon(Icons.star_rounded, color: Colors.white, size: 32)
                      : (isTapped ? const Icon(Icons.check_rounded, color: DesignSystem.primary, size: 24) : null),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildResult(CorsiBlocksState state) {
    return Icon(
      state.lastRoundCorrect == true ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(CorsiBlocksState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('SPAN', '${state.currentLength}', DesignSystem.accentAmber, isSmall),
          _buildStat('SCORE', '${state.score}', DesignSystem.success, isSmall),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color, bool isSmall) {
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
              fontSize: isSmall ? 8 : 10,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              letterSpacing: 1.5,
            ),
          ),
          Text(
            value, 
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              fontSize: isSmall ? 18 : 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
