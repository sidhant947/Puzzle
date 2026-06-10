import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';
import 'mandala_recall_provider.dart';

class MandalaRecallScreen extends ConsumerStatefulWidget {
  const MandalaRecallScreen({super.key});

  @override
  ConsumerState<MandalaRecallScreen> createState() => _MandalaRecallScreenState();
}

class _MandalaRecallScreenState extends ConsumerState<MandalaRecallScreen> {
  int _selectedPaletteColor = 0; // index in palette (0-3)

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(mandalaRecallNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(int score) {
    bool won = score >= 12;
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('mandala_recall');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'MANDALA ARTIST!' : 'GAME OVER',
        message: 'You scored $score points by recreating colored geometric layouts!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(mandalaRecallNotifierProvider.notifier).initGame();
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
    final state = ref.watch(mandalaRecallNotifierProvider);
    final notifier = ref.read(mandalaRecallNotifierProvider.notifier);

    ref.listen(mandalaRecallNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.score);
      }
    });

    return GameScaffold(
      title: 'MANDALA RECALL',
      subtitle: 'MEMORIZE COLOR CONFIGURATION. PICK COLORS AND REPAINT THE TILES.',
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
                      const SizedBox(height: 16),
                      _buildGrid(state, constraints, notifier),
                      const Spacer(),
                      if (state.phase == MandalaPhase.repaint)
                        _buildPaintingControls(state, notifier)
                      else if (state.phase == MandalaPhase.result)
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

  Widget _buildPhaseIndicator(MandalaRecallState state) {
    String text = '';
    Color color = DesignSystem.primary;
    if (state.phase == MandalaPhase.memorize) {
      text = 'MEMORIZE TILE COLORS';
      color = DesignSystem.accentAmber;
    } else if (state.phase == MandalaPhase.repaint) {
      text = 'PAINT CELLS TO MATCH ORIGINAL';
      color = DesignSystem.gameIndigo;
    } else {
      text = state.lastRoundCorrect == true ? 'EXCELLENT!' : 'INCORRECT MATCH!';
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

  Widget _buildGrid(MandalaRecallState state, BoxConstraints constraints, MandalaRecallNotifier notifier) {
    final showColors = state.phase == MandalaPhase.memorize || state.phase == MandalaPhase.result;
    final isSmall = constraints.maxHeight < 600;
    
    // Dynamically calculate grid size based on both width and remaining height
    final reservedHeight = isSmall ? 200.0 : 280.0;
    final double gridSize = (constraints.maxHeight - reservedHeight).clamp(150.0, constraints.maxWidth - 72.0);
    
    return SizedBox(
      width: gridSize,
      height: gridSize,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          Color cellColor = Colors.transparent;
          bool isPainted = false;
          
          if (showColors) {
            if (state.targetColors.containsKey(index)) {
              cellColor = MandalaRecallNotifier.palette[state.targetColors[index]!];
              isPainted = true;
            }
          } else {
            if (state.userColors.containsKey(index)) {
              cellColor = MandalaRecallNotifier.palette[state.userColors[index]!];
              isPainted = true;
            }
          }

          return TangibleButton(
            onTap: () {
              if (state.phase == MandalaPhase.repaint) {
                HapticFeedbackUtil.lightImpact();
                if (state.userColors[index] == _selectedPaletteColor) {
                  // Clear cell
                  notifier.onPaintCell(index, -1);
                } else {
                  // Paint selected color
                  notifier.onPaintCell(index, _selectedPaletteColor);
                }
              }
            },
            color: isPainted ? cellColor : Theme.of(context).colorScheme.surface,
            shadowColor: isPainted ? cellColor.withValues(alpha: 0.5) : Theme.of(context).colorScheme.outline,
            depth: isPainted ? 1.0 : 4.0,
            child: Center(
              child: (!showColors && isPainted)
                  ? Icon(Icons.brush_rounded, color: cellColor.computeLuminance() > 0.5 ? Colors.black : Colors.white, size: 24)
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaintingControls(MandalaRecallState state, MandalaRecallNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(MandalaRecallNotifier.palette.length, (colorIdx) {
              final color = MandalaRecallNotifier.palette[colorIdx];
              final isSelected = _selectedPaletteColor == colorIdx;
              
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    HapticFeedbackUtil.lightImpact();
                    setState(() {
                      _selectedPaletteColor = colorIdx;
                    });
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Theme.of(context).colorScheme.onSurface : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: isSelected
                        ? Icon(Icons.check_rounded, color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white)
                        : null,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          TangibleButton(
            onTap: () {
              HapticFeedbackUtil.lightImpact();
              notifier.submitRepaint();
            },
            color: DesignSystem.success,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 48),
            child: const Center(
              child: Text(
                'SUBMIT REPAINT',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResult(bool correct) {
    return Icon(
      correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
      color: correct ? DesignSystem.success : DesignSystem.error,
      size: 60,
    );
  }

  Widget _buildStats(MandalaRecallState state, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStat('TIME', '${state.timeLeft}s', state.timeLeft < 10 ? DesignSystem.error : DesignSystem.primary, isSmall),
          _buildStat('TILES', '${state.targetCellCount}', DesignSystem.accentAmber, isSmall),
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
