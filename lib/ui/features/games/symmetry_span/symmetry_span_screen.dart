import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'symmetry_span_provider.dart';

class SymmetrySpanScreen extends ConsumerStatefulWidget {
  const SymmetrySpanScreen({super.key});

  @override
  ConsumerState<SymmetrySpanScreen> createState() => _SymmetrySpanScreenState();
}

class _SymmetrySpanScreenState extends ConsumerState<SymmetrySpanScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(symmetrySpanNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 20;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('symmetry_span');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'SYMMETRY MASTER!' : 'GAME OVER',
        message: 'You scored $score points by recalling layouts and identifying symmetry!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(symmetrySpanNotifierProvider.notifier).initGame();
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
    final state = ref.watch(symmetrySpanNotifierProvider);
    final notifier = ref.read(symmetrySpanNotifierProvider.notifier);

    ref.listen(symmetrySpanNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'symmetry_span'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'symmetry_span'),
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
                      _buildMainLayout(state, constraints, notifier),
                      const Spacer(),
                      if (state.phase == SymSpanPhase.result)
                        _buildResult(state.lastRoundCorrect == true)
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

  Widget _buildPhaseIndicator(SymmetrySpanState state) {
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == SymSpanPhase.showingGrid) {
      text = 'MEMORIZE RED CELL LOCATION';
      color = DesignSystem.error;
    } else if (state.phase == SymSpanPhase.showingSymmetry) {
      text = 'IS THE PATTERN SYMMETRICAL?';
      color = DesignSystem.accentAmber;
    } else if (state.phase == SymSpanPhase.recalling) {
      text = 'RECALL SEQUENCE IN CORRECT ORDER';
      color = DesignSystem.gameIndigo;
    } else {
      text = state.lastRoundCorrect == true ? 'GREAT JOB!' : 'TRY AGAIN!';
      color = state.lastRoundCorrect == true ? DesignSystem.success : DesignSystem.error;
    }

    return Text(
      text,
      style: TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w800,
        color: color,
        fontSize: 14,
      ),
    );
  }

  Widget _buildMainLayout(SymmetrySpanState state, BoxConstraints constraints, SymmetrySpanNotifier notifier) {
    if (state.phase == SymSpanPhase.showingGrid || state.phase == SymSpanPhase.recalling) {
      // 4x4 grid
      final isSmall = constraints.maxHeight < 600;
      final reservedHeight = isSmall ? 180.0 : 250.0;
      final double gridSize = (constraints.maxHeight - reservedHeight).clamp(150.0, constraints.maxWidth - 48.0);

      return SizedBox(
        width: gridSize,
        height: gridSize,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            final isRed = state.highlightedCell == index;
            final isTapped = state.userSequence.contains(index);

            return TangibleButton(
              onTap: () {
                if (state.phase == SymSpanPhase.recalling) {
                  HapticFeedbackUtil.lightImpact();
                  notifier.onCellTapRecall(index);
                }
              },
              color: isRed
                  ? DesignSystem.error
                  : (isTapped ? DesignSystem.primary.withValues(alpha: 0.3) : Theme.of(context).colorScheme.surface),
              shadowColor: isRed ? DesignSystem.error.withValues(alpha: 0.5) : Theme.of(context).colorScheme.outline,
              depth: isRed ? 1.0 : 3.0,
              child: Center(
                child: isTapped
                    ? const Icon(Icons.check_rounded, color: DesignSystem.primary, size: 24)
                    : null,
              ),
            );
          },
        ),
      );
    } else if (state.phase == SymSpanPhase.showingSymmetry) {
      // Symmetry matrix with YES / NO buttons
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth - 64, maxHeight: 200),
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    final isActive = state.symmetryMatrix.length > index && state.symmetryMatrix[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: isActive ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.surface,
                        border: Border.all(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answerSymmetry(false); // NO
                    },
                    color: DesignSystem.error,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Center(
                      child: Text(
                        'NO',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TangibleButton(
                    onTap: () {
                      HapticFeedbackUtil.lightImpact();
                      notifier.answerSymmetry(true); // YES
                    },
                    color: DesignSystem.success,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: const Center(
                      child: Text(
                        'YES',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }

  Widget _buildResult(bool correct) {
    return Icon(
      correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: correct ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(SymmetrySpanState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('LENGTH', '${state.currentLength}', DesignSystem.accentAmber, isSmall),
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
        vertical: isSmall ? 4 : 8,
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
