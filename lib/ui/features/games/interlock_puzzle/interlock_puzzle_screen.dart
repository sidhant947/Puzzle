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
  double _rotationX = -0.5; // Initial tilt
  double _rotationY = 0.5;

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
      onReset: () {
        setState(() {
          _rotationX = -0.5;
          _rotationY = 0.5;
        });
        ref.read(interlockPuzzleNotifierProvider.notifier).initGame();
      },
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Drag to rotate and see if they fit perfectly!',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: DesignSystem.fontSizeSM),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _rotationY += details.delta.dx * 0.01;
                        _rotationX += details.delta.dy * 0.01;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildShapeView(context, 'Shape A', state.shapeA.toList(), Colors.indigo),
                        ),
                        Expanded(
                          child: _buildShapeView(context, 'Shape B', state.shapeB.toList(), Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
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

  Widget _buildShapeView(BuildContext context, String title, List<int> shape, Color color) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Expanded(
          child: CustomPaint(
            size: Size.infinite,
            painter: IsometricPainter(context, shape, color, _rotationX, _rotationY),
          ),
        ),
      ],
    );
  }
}

class IsometricPainter extends CustomPainter {
  final BuildContext context;
  final List<int> shape;
  final Color baseColor;
  final double rotX;
  final double rotY;
  static const int size = 3;

  IsometricPainter(this.context, this.shape, this.baseColor, this.rotX, this.rotY);

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final center = Offset(canvasSize.width / 2, canvasSize.height / 2);
    final cubeSize = min(canvasSize.width, canvasSize.height) / 8;

    List<_CubeData> cubes = [];
    for (int z = 0; z < size; z++) {
      for (int y = 0; y < size; y++) {
        for (int x = 0; x < size; x++) {
          int idx = z * size * size + y * size + x;
          if (shape[idx] == 1) {
            double cx = x - (size - 1) / 2.0;
            double cy = y - (size - 1) / 2.0;
            double cz = z - (size - 1) / 2.0;

            // Rotation around Y then X
            // Yaw (Y-axis)
            double r1x = cx * cos(rotY) + cz * sin(rotY);
            double r1y = cy;
            double r1z = -cx * sin(rotY) + cz * cos(rotY);

            // Pitch (X-axis)
            double r2x = r1x;
            double r2y = r1y * cos(rotX) - r1z * sin(rotX);
            double r2z = r1y * sin(rotX) + r1z * cos(rotX);

            cubes.add(_CubeData(r2x, r2y, r2z, r2z)); // depth is r2z
          }
        }
      }
    }

    // Sort by depth (farthest first)
    cubes.sort((a, b) => a.depth.compareTo(b.depth));

    _drawBoundary(canvas, center, cubeSize);

    for (var cube in cubes) {
      _drawCube(canvas, center, cube.rx, cube.ry, cube.rz, cubeSize);
    }
  }

  void _drawBoundary(Canvas canvas, Offset center, double s) {
    final paint = Paint()
      ..color = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Offset project(double cx, double cy, double cz) {
      double r1x = cx * cos(rotY) + cz * sin(rotY);
      double r1y = cy;
      double r1z = -cx * sin(rotY) + cz * cos(rotY);

      double r2x = r1x;
      double r2y = r1y * cos(rotX) - r1z * sin(rotX);
      
      return center + Offset(r2x * s * 1.5, r2y * s * 1.5);
    }

    const double limit = 1.5;
    final v = [
      [-limit, -limit, -limit], [limit, -limit, -limit],
      [limit, limit, -limit], [-limit, limit, -limit],
      [-limit, -limit, limit], [limit, -limit, limit],
      [limit, limit, limit], [-limit, limit, limit],
    ];

    void line(int a, int b) {
      canvas.drawLine(project(v[a][0], v[a][1], v[a][2]), project(v[b][0], v[b][1], v[b][2]), paint);
    }

    line(0, 1); line(1, 2); line(2, 3); line(3, 0);
    line(4, 5); line(5, 6); line(6, 7); line(7, 4);
    line(0, 4); line(1, 5); line(2, 6); line(3, 7);
  }

  void _drawCube(Canvas canvas, Offset center, double rx, double ry, double rz, double s) {
    Offset p(double vx, double vy) => center + Offset(vx * s * 1.5, vy * s * 1.5);

    // Simplified projection for the cube faces based on current rotation
    // We use the transformed coordinates to draw the 6 faces, but only 3 are usually visible.
    // To keep it efficient and solid, we'll draw based on the normals or just standard 3D cube.
    
    // Vertices in "projected" 2D space
    // Since rx, ry are already rotated, we just need the local offsets
    // This is a bit tricky with raw CustomPaint without a full 3D engine.
    // Let's use a simpler approach: 8 vertices and draw the faces that are "forward".
    
    List<Offset> v = [];
    for(int i=0; i<8; i++) {
      double lx = (i & 1) == 0 ? -0.5 : 0.5;
      double ly = (i & 2) == 0 ? -0.5 : 0.5;
      double lz = (i & 4) == 0 ? -0.5 : 0.5;

      // Local rotation for the cube itself (same as the center rotation)
      // Actually, since rx, ry, rz are already the rotated CENTER of the cube,
      // and the cube is small, we can just project the 8 corners.
      
      double cx = rx + lx;
      double cy = ry + ly;
      double cz = rz + lz;

      // Note: rx, ry, rz are ALREADY rotated. But lx, ly, lz are NOT.
      // We need to rotate lx, ly, lz by the same rotX, rotY.
      
      double r1x = lx * cos(rotY) + lz * sin(rotY);
      double r1y = ly;
      double r1z = -lx * sin(rotY) + lz * cos(rotY);

      double r2x = r1x;
      double r2y = r1y * cos(rotX) - r1z * sin(rotX);
      
      v.add(center + Offset((rx + r2x) * s * 1.5, (ry + r2y) * s * 1.5));
    }

    void drawFace(List<int> indices, Color color) {
      final path = Path()..moveTo(v[indices[0]].dx, v[indices[0]].dy);
      for(int i=1; i<indices.length; i++) path.lineTo(v[indices[i]].dx, v[indices[i]].dy);
      path.close();
      canvas.drawPath(path, Paint()..color = color);
      canvas.drawPath(path, Paint()..color = Colors.black.withValues(alpha: 0.1)..style = PaintingStyle.stroke..strokeWidth = 0.5);
    }

    // Faces (approximate visibility)
    // Front (lz=0.5), Back (lz=-0.5), Top (ly=-0.5), Bottom (ly=0.5), Left (lx=-0.5), Right (lx=0.5)
    // Depending on rotation, we draw different ones.
    // For a solid look, we can just draw all 6 in a specific order or use a simple normal check.
    
    // Standard indices for 6 faces:
    final faces = [
      [0, 1, 3, 2], // Back
      [4, 5, 7, 6], // Front
      [0, 1, 5, 4], // Bottom
      [2, 3, 7, 6], // Top
      [0, 2, 6, 4], // Left
      [1, 3, 7, 5], // Right
    ];
    
    final colors = [
      Color.lerp(baseColor, Colors.black, 0.4)!,
      baseColor,
      Color.lerp(baseColor, Colors.black, 0.5)!,
      Color.lerp(baseColor, Colors.white, 0.2)!,
      Color.lerp(baseColor, Colors.black, 0.2)!,
      Color.lerp(baseColor, Colors.black, 0.3)!,
    ];

    for(int i=0; i<6; i++) {
      drawFace(faces[i], colors[i]);
    }
  }

  @override
  bool shouldRepaint(covariant IsometricPainter oldDelegate) => 
    oldDelegate.rotX != rotX || oldDelegate.rotY != rotY || oldDelegate.shape != shape;
}

class _CubeData {
  final double rx, ry, rz, depth;
  _CubeData(this.rx, this.ry, this.rz, this.depth);
}
