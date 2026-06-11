import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/ui/core/juice/game_scaffold.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'interlock_puzzle_provider.dart';

class InterlockPuzzleScreen extends ConsumerStatefulWidget {
  const InterlockPuzzleScreen({super.key});

  @override
  ConsumerState<InterlockPuzzleScreen> createState() => _InterlockPuzzleScreenState();
}

class _InterlockPuzzleScreenState extends ConsumerState<InterlockPuzzleScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(interlockPuzzleNotifierProvider.notifier).initGame());
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => GameCompletionDialog(
        title: isVictory ? l10n.interlockPuzzleTitle : 'GAME OVER',
        message: isVictory ? l10n.interlockPuzzleCongrats : 'Try again!',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(dialogCtx).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(dialogCtx).pop();
          ref.read(interlockPuzzleNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(interlockPuzzleNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(interlockPuzzleNotifierProvider, (prev, next) {
      if (next.isSolved && !(prev?.isSolved ?? false)) {
        if (next.isCorrect) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(next.isCorrect);
        });
      }
    });

    return GameScaffold(
      title: l10n.interlockPuzzleTitle,
      onReset: () => ref.read(interlockPuzzleNotifierProvider.notifier).initGame(),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Do these two shapes fit together perfectly to form a solid cube?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: DesignSystem.fontSizeSM),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildShapeView(context, 'Shape A', state.shapeA.toList()),
                      ),
                      Expanded(
                        child: _buildShapeView(context, 'Shape B', state.shapeB.toList()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                if (!state.isSolved)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: TangibleButton(
                            onTap: () {
                              HapticFeedbackUtil.selection();
                              ref.read(interlockPuzzleNotifierProvider.notifier).submitAnswer(true);
                            },
                            color: Colors.green,
                            child: const Text('YES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TangibleButton(
                            onTap: () {
                              HapticFeedbackUtil.selection();
                              ref.read(interlockPuzzleNotifierProvider.notifier).submitAnswer(false);
                            },
                            color: Colors.red,
                            child: const Text('NO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Spacer(),
              ],
            ),
    );
  }

  Widget _buildShapeView(BuildContext context, String title, List<int> shape) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Expanded(
          child: CustomPaint(
            size: Size.infinite,
            painter: IsometricPainter(context, shape),
          ),
        ),
      ],
    );
  }
}

class IsometricPainter extends CustomPainter {
  final BuildContext context;
  final List<int> shape;
  static const int size = 3;

  IsometricPainter(this.context, this.shape);

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final cubeSize = min(canvasSize.width, canvasSize.height) / 6;

    // Draw from back to front
    for (int z = 0; z < size; z++) {
      for (int y = 0; y < size; y++) {
        for (int x = 0; x < size; x++) {
          int idx = z * size * size + y * size + x;
          if (shape[idx] == 1) {
            _drawCube(canvas, center, x, y, z, cubeSize);
          }
        }
      }
    }
  }

  void _drawCube(Canvas canvas, Offset center, int x, int y, int z, double s) {
    // Isometric projection
    // isoX = (x - y) * cos(30)
    // isoY = (x + y) * sin(30) - z
    double dx = (x - y) * s * 0.866;
    double dy = (x + y) * s * 0.5 - z * s;
    Offset pos = center + Offset(dx, dy);

    final primaryColor = Theme.of(context).colorScheme.primary;
    final topPaint = Paint()..color = primaryColor.withValues(alpha: 0.8);
    final leftPaint = Paint()..color = primaryColor.withValues(alpha: 0.6);
    final rightPaint = Paint()..color = primaryColor.withValues(alpha: 0.4);
    final borderPaint = Paint()..color = Colors.white.withValues(alpha: 0.5)..style = PaintingStyle.stroke..strokeWidth = 1;

    // Top face
    final top = Path()
      ..moveTo(pos.dx, pos.dy - s)
      ..lineTo(pos.dx + s * 0.866, pos.dy - s * 0.5)
      ..lineTo(pos.dx, pos.dy)
      ..lineTo(pos.dx - s * 0.866, pos.dy - s * 0.5)
      ..close();
    canvas.drawPath(top, topPaint);
    canvas.drawPath(top, borderPaint);

    // Left face
    final left = Path()
      ..moveTo(pos.dx - s * 0.866, pos.dy - s * 0.5)
      ..lineTo(pos.dx, pos.dy)
      ..lineTo(pos.dx, pos.dy + s)
      ..lineTo(pos.dx - s * 0.866, pos.dy + s * 0.5)
      ..close();
    canvas.drawPath(left, leftPaint);
    canvas.drawPath(left, borderPaint);

    // Right face
    final right = Path()
      ..moveTo(pos.dx + s * 0.866, pos.dy - s * 0.5)
      ..lineTo(pos.dx, pos.dy)
      ..lineTo(pos.dx, pos.dy + s)
      ..lineTo(pos.dx + s * 0.866, pos.dy + s * 0.5)
      ..close();
    canvas.drawPath(right, rightPaint);
    canvas.drawPath(right, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
