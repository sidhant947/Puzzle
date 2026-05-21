import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'silhouette_match_ortho_provider.dart';
import 'silhouette_match_ortho_engine.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class SilhouetteMatchOrthoScreen extends ConsumerStatefulWidget {
  const SilhouetteMatchOrthoScreen({super.key});

  @override
  ConsumerState<SilhouetteMatchOrthoScreen> createState() => _SilhouetteMatchOrthoScreenState();
}

class _SilhouetteMatchOrthoScreenState extends ConsumerState<SilhouetteMatchOrthoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(silhouetteMatchOrthoNotifierProvider.notifier).initGame();
    });
  }

  void _showHowToPlay() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: TangibleContainer(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'HOW TO PLAY',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                '1. Drag your finger on the 3D viewport at the top to rotate and inspect the 3D block figure.\n\n'
                '2. Look at the challenge target perspective (TOP, FRONT, or SIDE view).\n\n'
                '3. Match the 3D block figure to its correct 2D silhouette option below.\n\n'
                '4. Tap the correct option (A, B, or C) and tap "SUBMIT RESPONSE" to check!',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                onTap: () => Navigator.of(context).pop(),
                child: const Text('GOT IT'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getViewLabel(PerspectiveType view) {
    switch (view) {
      case PerspectiveType.top:
        return 'TOP (Z-AXIS) VIEW';
      case PerspectiveType.front:
        return 'FRONT (Y-AXIS) VIEW';
      case PerspectiveType.side:
        return 'SIDE (X-AXIS) VIEW';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(silhouetteMatchOrthoNotifierProvider);
    final notifier = ref.read(silhouetteMatchOrthoNotifierProvider.notifier);
    final theme = Theme.of(context);

    if (state.isVictory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) => GameCompletionDialog(
            title: 'AMAZING',
            message: 'You have flawless orthographic alignment skills!',
            onHome: () {
              Navigator.of(dialogCtx).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(dialogCtx).pop();
              notifier.initGame();
            },
          ),
        );
      });
    }

    return GameScaffold(
      title: 'Silhouette Match',
      subtitle: 'MATCH 3D BLOCK FIGURE TO 2D PERSPECTIVE',
      onHowToPlay: _showHowToPlay,
      onReset: notifier.reset,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    // 3D Viewport
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            final dx = details.delta.dx * 0.007;
                            final dy = details.delta.dy * 0.007;
                            notifier.updateRotation(dx, dy);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                              border: Border.all(
                                color: theme.colorScheme.outline.withValues(alpha: 0.5),
                                width: 1.5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CustomPaint(
                                      painter: IsometricFigurePainter(
                                        grid3D: state.grid3D,
                                        yaw: state.yaw,
                                        pitch: state.pitch,
                                        colorScheme: theme.colorScheme,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: DesignSystem.spaceMD,
                                    right: DesignSystem.spaceMD,
                                    child: Icon(
                                      Icons.rotate_left_rounded,
                                      color: Colors.grey,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),

                    // Target indicator
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: DesignSystem.accentAmber.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        border: Border.all(color: DesignSystem.accentAmber.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        'TARGET: ${_getViewLabel(state.targetView)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.accentAmber,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    
                    const Spacer(flex: 1),

                    // Section 3: The 3 options
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(3, (index) {
                          final option = state.options[index];
                          final isSelected = state.selectedIndex == index;
                          
                          Color activeColor = DesignSystem.primary;
                          Color cardColor = theme.colorScheme.surface;
                          Color shadow = theme.colorScheme.outline;

                          if (isSelected) {
                            if (state.isFailed) {
                              cardColor = theme.colorScheme.error.withValues(alpha: 0.1);
                              shadow = theme.colorScheme.error;
                              activeColor = theme.colorScheme.error;
                            } else {
                              cardColor = DesignSystem.primary.withValues(alpha: 0.15);
                              shadow = DesignSystem.primary;
                            }
                          }

                          return SizedBox(
                            width: 96,
                            height: 120,
                            child: TangibleButton(
                              depth: isSelected ? 1.0 : 4.0,
                              color: cardColor,
                              shadowColor: shadow,
                              padding: EdgeInsets.zero,
                              onTap: () {
                                HapticFeedbackUtil.selection();
                                notifier.selectOption(index);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 10,
                                    child: OrthoGridWidget(
                                      grid: option,
                                      activeColor: activeColor,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? (state.isFailed ? theme.colorScheme.error : DesignSystem.primary)
                                            : theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                      ),
                                      child: Text(
                                        String.fromCharCode(65 + index), // A, B, C
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: isSelected ? Colors.white : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const Spacer(flex: 1),

                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: SizedBox(
                        width: double.infinity,
                        child: TangibleButton(
                          onTap: state.selectedIndex == null || state.isVictory || state.isFailed
                              ? null
                              : () {
                                  final correct = notifier.checkAnswer();
                                  if (correct) {
                                    HapticFeedbackUtil.success();
                                  } else {
                                    HapticFeedbackUtil.error();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Incorrect perspective projection! Tap Reset to try again.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                          color: state.selectedIndex == null
                              ? theme.colorScheme.outline
                              : (state.isFailed ? theme.colorScheme.error : DesignSystem.success),
                          shadowColor: state.selectedIndex == null
                              ? theme.colorScheme.outline
                              : (state.isFailed ? theme.colorScheme.error : const Color(0xFF047857)),
                          child: Center(
                            child: Text(
                              state.isFailed ? 'FAILED (TAP RESET)' : 'SUBMIT RESPONSE',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                  ],
                );
              },
            ),
    );
  }
}

class OrthoGridWidget extends StatelessWidget {
  final List<List<bool>> grid;
  final Color activeColor;

  const OrthoGridWidget({
    super.key,
    required this.grid,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (r) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (c) {
            final active = grid[r][c];
            return Container(
              width: 18,
              height: 18,
              margin: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                color: active ? activeColor : theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: active ? activeColor.withValues(alpha: 0.8) : theme.colorScheme.outline.withValues(alpha: 0.15),
                  width: 1,
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}

class Point3D {
  final double x;
  final double y;
  final double z;
  Point3D(this.x, this.y, this.z);
}

class ProjectedFace {
  final List<Offset> points;
  final double avgDepth;
  final Color color;

  ProjectedFace({
    required this.points,
    required this.avgDepth,
    required this.color,
  });
}

class IsometricFigurePainter extends CustomPainter {
  final List<List<List<bool>>> grid3D;
  final double yaw;
  final double pitch;
  final ColorScheme colorScheme;

  IsometricFigurePainter({
    required this.grid3D,
    required this.yaw,
    required this.pitch,
    required this.colorScheme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;
    
    final int gridSize = grid3D.length;
    final double blockScale = math.min(size.width, size.height) / (gridSize * 2.3);

    List<ProjectedFace> facesToDraw = [];

    // Light source vector in local 3D coordinates (normalized)
    final lightVec = Point3D(0.5, -0.8, 1.5);
    final lightLen = math.sqrt(lightVec.x * lightVec.x + lightVec.y * lightVec.y + lightVec.z * lightVec.z);
    final lx = lightVec.x / lightLen;
    final ly = lightVec.y / lightLen;
    final lz = lightVec.z / lightLen;

    final r = 0.45; // Unit block half-width (slightly under 0.5 for physical gaps)

    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        for (int z = 0; z < gridSize; z++) {
          if (!grid3D[x][y][z]) continue;

          // Center coordinate in local space
          final cx = x - 1.0;
          final cy = y - 1.0;
          final cz = z - 1.0; // centered block positions (-1, 0, 1)

          // Let's define the 6 faces for this cube
          final List<List<Point3D>> facesVertices = [
            // Top face
            [Point3D(cx-r, cy-r, cz+r), Point3D(cx+r, cy-r, cz+r), Point3D(cx+r, cy+r, cz+r), Point3D(cx-r, cy+r, cz+r)],
            // Front X+ face
            [Point3D(cx+r, cy-r, cz-r), Point3D(cx+r, cy+r, cz-r), Point3D(cx+r, cy+r, cz+r), Point3D(cx+r, cy-r, cz+r)],
            // Front Y+ face
            [Point3D(cx-r, cy+r, cz-r), Point3D(cx-r, cy+r, cz+r), Point3D(cx+r, cy+r, cz+r), Point3D(cx+r, cy+r, cz-r)],
            // Back X- face
            [Point3D(cx-r, cy-r, cz-r), Point3D(cx-r, cy-r, cz+r), Point3D(cx-r, cy+r, cz+r), Point3D(cx-r, cy+r, cz-r)],
            // Back Y- face
            [Point3D(cx-r, cy-r, cz-r), Point3D(cx+r, cy-r, cz-r), Point3D(cx+r, cy-r, cz+r), Point3D(cx-r, cy-r, cz+r)],
            // Bottom face
            [Point3D(cx-r, cy-r, cz-r), Point3D(cx-r, cy+r, cz-r), Point3D(cx+r, cy+r, cz-r), Point3D(cx+r, cy-r, cz-r)],
          ];

          final List<Point3D> faceNormals = [
            Point3D(0, 0, 1),
            Point3D(1, 0, 0),
            Point3D(0, 1, 0),
            Point3D(-1, 0, 0),
            Point3D(0, -1, 0),
            Point3D(0, 0, -1),
          ];

          // Teal base color for ortho stack
          const baseColor = DesignSystem.gameTeal;

          for (int f = 0; f < 6; f++) {
            final normal = faceNormals[f];
            final vertices = facesVertices[f];

            // 3D rotation of normal
            final rotNormalX = normal.x * math.cos(yaw) - normal.y * math.sin(yaw);
            final rotNormalY = normal.x * math.sin(yaw) + normal.y * math.cos(yaw);
            final rotNormalZ = normal.z;

            // X-rotation (pitch)
            final projNormalZ = rotNormalY * math.sin(pitch) + rotNormalZ * math.cos(pitch);

            // Back-face culling
            if (projNormalZ < -0.01) continue;

            // Lighting shading factor
            final dot = normal.x * lx + normal.y * ly + normal.z * lz;
            final intensity = (dot + 1.0) / 2.0; 
            final shadedColor = Color.lerp(
              Colors.black,
              baseColor,
              0.4 + 0.6 * intensity,
            )!;

            // Project vertices to 2D
            double sumDepth = 0;
            List<Offset> projectedPoints = [];

            for (final v in vertices) {
              // Yaw rotation
              final rx = v.x * math.cos(yaw) - v.y * math.sin(yaw);
              final ry = v.x * math.sin(yaw) + v.y * math.cos(yaw);
              final rz = v.z;

              // Pitch rotation
              final px = rx;
              final py = ry * math.cos(pitch) - rz * math.sin(pitch);
              final pz = ry * math.sin(pitch) + rz * math.cos(pitch);

              projectedPoints.add(Offset(
                centerX + px * blockScale,
                centerY + py * blockScale,
              ));
              sumDepth += pz;
            }

            facesToDraw.add(ProjectedFace(
              points: projectedPoints,
              avgDepth: sumDepth / 4.0,
              color: shadedColor,
            ));
          }
        }
      }
    }

    // Painter's algorithm: sort faces back-to-front
    facesToDraw.sort((a, b) => a.avgDepth.compareTo(b.avgDepth));

    // Draw the sorted faces
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = colorScheme.surface.withValues(alpha: 0.3)
      ..strokeWidth = 1.0;

    for (final face in facesToDraw) {
      final path = Path()..moveTo(face.points[0].dx, face.points[0].dy);
      for (int i = 1; i < face.points.length; i++) {
        path.lineTo(face.points[i].dx, face.points[i].dy);
      }
      path.close();

      paint.color = face.color;
      canvas.drawPath(path, paint);
      canvas.drawPath(path, borderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant IsometricFigurePainter oldDelegate) {
    return oldDelegate.yaw != yaw || oldDelegate.pitch != pitch || oldDelegate.grid3D != grid3D;
  }
}
