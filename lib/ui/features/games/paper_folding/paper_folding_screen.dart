import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'paper_folding_provider.dart';
import 'paper_folding_engine.dart';

class PaperFoldingScreen extends ConsumerStatefulWidget {
  const PaperFoldingScreen({super.key});

  @override
  ConsumerState<PaperFoldingScreen> createState() => _PaperFoldingScreenState();
}

class _PaperFoldingScreenState extends ConsumerState<PaperFoldingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(paperFoldingNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'UNFOLDED PERFECTION!',
        message: 'You can see the patterns in your mind.',
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(paperFoldingNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paperFoldingNotifierProvider);
    final notifier = ref.read(paperFoldingNotifierProvider.notifier);

    ref.listen(paperFoldingNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('paper_folding');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Paper Folding',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Paper Folding',
      subtitle: 'What will it look like when unfolded?',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceMD),
            _buildFoldingSequence(state),
            const Spacer(),
            const Text(
              'CHOOSE THE RESULT',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                letterSpacing: 1.2,
                color: DesignSystem.inkSlate,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
                childAspectRatio: 1.1,
              ),
              itemCount: state.options.length,
              itemBuilder: (context, index) {
                return _buildOption(state, notifier, index);
              },
            ),
            const SizedBox(height: DesignSystem.space2XL),
          ],
        ),
      ),
    );
  }

  Widget _buildFoldingSequence(PaperFoldingState state) {
    return Column(
      children: [
        const Text(
          'FOLDING SEQUENCE',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 12,
            letterSpacing: 1.2,
            color: DesignSystem.inkSlate,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(state.folds.length, (i) {
                return Row(
                  children: [
                    _buildFoldStep(state, i),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(Icons.chevron_right_rounded, color: DesignSystem.outlineVariant, size: 24),
                    ),
                  ],
                );
              }),
              _buildPunchStep(state),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFoldStep(PaperFoldingState state, int stepIndex) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: DesignSystem.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomPaint(
        painter: FoldStepPainter(state.folds, stepIndex),
      ),
    );
  }

  Widget _buildPunchStep(PaperFoldingState state) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: DesignSystem.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomPaint(
        painter: PunchStepPainter(state.folds, state.punch),
      ),
    );
  }

  Widget _buildOption(PaperFoldingState state, PaperFoldingNotifier notifier, int index) {
    final isSelected = state.selectedIndex == index;
    final isCorrect = state.correctIndex == index;
    final showResult = state.selectedIndex != null;

    Color borderColor = DesignSystem.outline;
    if (showResult) {
      if (isCorrect) {
        borderColor = DesignSystem.success;
      } else if (isSelected) {
        borderColor = DesignSystem.error;
      }
    } else if (isSelected) {
      borderColor = DesignSystem.primary;
    }

    return GestureDetector(
      onTap: () => notifier.selectOption(index),
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceXS),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: DesignSystem.ink.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: _buildResultGrid(state.options[index], 14),
            ),
            if (showResult && isCorrect)
              const Positioned(
                top: 4, right: 4,
                child: Icon(Icons.check_circle, color: DesignSystem.success, size: 20),
              ),
            if (showResult && isSelected && !isCorrect)
              const Positioned(
                top: 4, right: 4,
                child: Icon(Icons.cancel, color: DesignSystem.error, size: 20),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultGrid(List<Point<int>> holes, double cellSize) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(PaperFoldingEngine.gridSize, (y) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(PaperFoldingEngine.gridSize, (x) {
            final hasHole = holes.any((p) => p.x == x && p.y == y);
            return Container(
              width: cellSize,
              height: cellSize,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: hasHole ? DesignSystem.ink : DesignSystem.outline.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      }),
    );
  }
}

class FoldStepPainter extends CustomPainter {
  final List<FoldType> folds;
  final int stepIndex;

  FoldStepPainter(this.folds, this.stepIndex);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = DesignSystem.inkSlate
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dashPaint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw the active area based on previous folds
    double left = 0, top = 0, right = size.width, bottom = size.height;
    for (int i = 0; i < stepIndex; i++) {
      if (folds[i] == FoldType.vertical) right = size.width / 2;
      if (folds[i] == FoldType.horizontal) bottom = size.height / 2;
      if (folds[i] == FoldType.diagonal) {
         // Diagonal fold logic for drawing active area is complex, 
         // let's just draw the full square for simplicity in step diagrams
      }
    }

    canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);

    // Draw the fold line for the current step
    final fold = folds[stepIndex];
    if (fold == FoldType.vertical) {
      double centerX = (left + right) / 2;
      canvas.drawLine(Offset(centerX, top), Offset(centerX, bottom), dashPaint);
      // Arrow from right to left
      _drawArrow(canvas, Offset(right - 5, (top + bottom) / 2), Offset(left + 5, (top + bottom) / 2));
    } else if (fold == FoldType.horizontal) {
      double centerY = (top + bottom) / 2;
      canvas.drawLine(Offset(left, centerY), Offset(right, centerY), dashPaint);
      // Arrow from bottom to top
      _drawArrow(canvas, Offset((left + right) / 2, bottom - 5), Offset((left + right) / 2, top + 5));
    } else if (fold == FoldType.diagonal) {
      canvas.drawLine(Offset(left, top), Offset(right, bottom), dashPaint);
      _drawArrow(canvas, Offset(right - 5, top + 5), Offset(left + 5, bottom - 5));
    }
  }

  void _drawArrow(Canvas canvas, Offset start, Offset end) {
    final paint = Paint()
      ..color = DesignSystem.primary
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
    
    final path = Path();
    final angle = (end - start).direction;
    const arrowSize = 6.0;
    path.moveTo(end.dx, end.dy);
    path.lineTo(end.dx - arrowSize * cos(angle - pi / 6), end.dy - arrowSize * sin(angle - pi / 6));
    path.lineTo(end.dx - arrowSize * cos(angle + pi / 6), end.dy - arrowSize * sin(angle + pi / 6));
    path.close();
    
    final arrowPaint = Paint()
      ..color = DesignSystem.primary
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PunchStepPainter extends CustomPainter {
  final List<FoldType> folds;
  final Point<int> punch;

  PunchStepPainter(this.folds, this.punch);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = DesignSystem.inkSlate
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double left = 0, top = 0, right = size.width, bottom = size.height;
    for (int i = 0; i < folds.length; i++) {
      if (folds[i] == FoldType.vertical) right = size.width / 2;
      if (folds[i] == FoldType.horizontal) bottom = size.height / 2;
    }

    canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);

    // Draw the punch hole
    final punchPaint = Paint()
      ..color = DesignSystem.error
      ..style = PaintingStyle.fill;

    // Calculate grid cell size in the final area
    // Original grid is 6x6. 
    // Final area is usually 3x3 (after V and H folds)
    double gridX = punch.x.toDouble();
    double gridY = punch.y.toDouble();
    
    double cellSize = (size.width / PaperFoldingEngine.gridSize);
    canvas.drawCircle(Offset(gridX * cellSize + cellSize / 2, gridY * cellSize + cellSize / 2), 4, punchPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
