import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'block_count_3d_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'package:puzzle/l10n/app_localizations.dart';

class BlockCount3DScreen extends ConsumerStatefulWidget {
  const BlockCount3DScreen({super.key});

  @override
  ConsumerState<BlockCount3DScreen> createState() => _BlockCount3DScreenState();
}

class _BlockCount3DScreenState extends ConsumerState<BlockCount3DScreen> {
  final TextEditingController _guessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(blockCount3DNotifierProvider.notifier).initGame();
    });
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }

  void _appendDigit(String digit) {
    final current = _guessController.text;
    // Limit to 3 digits
    if (current.length >= 3) return;
    final next = current + digit;
    _guessController.text = next;
    final parsed = int.tryParse(next);
    if (parsed != null && parsed > 0) {
      HapticFeedbackUtil.selection();
      ref.read(blockCount3DNotifierProvider.notifier).setGuess(parsed);
    }
  }

  void _deleteDigit() {
    final current = _guessController.text;
    if (current.isEmpty) return;
    final next = current.substring(0, current.length - 1);
    _guessController.text = next;
    HapticFeedbackUtil.selection();
    final parsed = int.tryParse(next);
    ref.read(blockCount3DNotifierProvider.notifier).setGuess(parsed);
  }

  void _clearInput() {
    _guessController.clear();
    HapticFeedbackUtil.selection();
    ref.read(blockCount3DNotifierProvider.notifier).setGuess(null);
  }

  void _showHowToPlay() {
    final l10n = AppLocalizations.of(context)!;
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
                l10n.howToPlay.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                l10n.blockCount3DHowToPlayDescription,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                onTap: () => Navigator.of(context).pop(),
                child: Text(l10n.gotIt.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blockCount3DNotifierProvider);
    final notifier = ref.read(blockCount3DNotifierProvider.notifier);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Show dialog when won
    if (state.isVictory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) => GameCompletionDialog(
            title: l10n.blockCount3DExcellent,
            message: l10n.blockCount3DWinMessage(state.totalBlocks),
            onHome: () {
              Navigator.of(dialogCtx).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              Navigator.of(dialogCtx).pop();
              _guessController.clear();
              notifier.reset();
            },
          ),
        );
      });
    }

    return GameScaffold(
      title: l10n.blockCount3DTitle,
      subtitle: l10n.blockCount3DSubtitle,
      onHowToPlay: _showHowToPlay,
      onReset: () {
        _guessController.clear();
        notifier.reset();
      },
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                final viewSize = math.min(constraints.maxWidth, constraints.maxHeight * 0.55);
                
                return Column(
                  children: [
                    // 3D Viewport
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            // Sensitivity adjustments
                            final dx = details.delta.dx * 0.007;
                            final dy = details.delta.dy * 0.007;
                            notifier.updateRotation(dx, dy);
                          },
                          child: Container(
                            width: constraints.maxWidth,
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
                                      painter: IsometricBlocksPainter(
                                        grid: state.grid,
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

                    // Guessing section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.blockCount3DHowMany,
                            style: theme.textTheme.titleLarge?.copyWith(
                              letterSpacing: 1.0,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: DesignSystem.spaceSM),

                          // Number input field (read-only, driven by numpad)
                          TextField(
                            controller: _guessController,
                            readOnly: true,
                            showCursor: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: theme.colorScheme.onSurface,
                              letterSpacing: 4,
                            ),
                            decoration: InputDecoration(
                              hintText: '?',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
                              ),
                              filled: true,
                              fillColor: theme.colorScheme.surface,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: DesignSystem.spaceMD,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                borderSide: BorderSide(
                                  color: DesignSystem.primary.withValues(alpha: 0.6),
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                borderSide: BorderSide(
                                  color: DesignSystem.primary,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: DesignSystem.spaceSM),

                          // Virtual numpad
                          _VirtualNumpad(
                            onDigit: _appendDigit,
                            onDelete: _deleteDigit,
                            onClear: _clearInput,
                          ),
                          const SizedBox(height: DesignSystem.spaceSM),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            child: TangibleButton(
                              onTap: state.currentGuess == null
                                  ? null
                                  : () {
                                      HapticFeedbackUtil.mediumImpact();
                                      notifier.checkAnswer();
                                      if (state.currentGuess != state.totalBlocks) {
                                        HapticFeedbackUtil.error();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(l10n.blockCount3DNotQuite),
                                            duration: const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                              color: state.currentGuess == null ? theme.colorScheme.outline : DesignSystem.success,
                              shadowColor: state.currentGuess == null ? theme.colorScheme.outline : const Color(0xFF047857),
                              child: Center(
                                child: Text(
                                  l10n.blockCount3DSubmitGuess,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: DesignSystem.spaceMD),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class _VirtualNumpad extends StatelessWidget {
  final void Function(String digit) onDigit;
  final VoidCallback onDelete;
  final VoidCallback onClear;

  const _VirtualNumpad({
    required this.onDigit,
    required this.onDelete,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Layout: 3 columns, 4 rows → [1,2,3], [4,5,6], [7,8,9], [C,0,⌫]
    const keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['C', '0', '⌫'],
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: keys.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: row.map((key) {
              final isDelete = key == '⌫';
              final isClear = key == 'C';

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: TangibleButton(
                    depth: 4.0,
                    color: isDelete
                        ? theme.colorScheme.errorContainer
                        : isClear
                            ? theme.colorScheme.surfaceContainerHighest
                            : theme.colorScheme.surface,
                    shadowColor: isDelete
                        ? theme.colorScheme.error.withValues(alpha: 0.4)
                        : theme.colorScheme.outline,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    onTap: () {
                      if (isDelete) {
                        onDelete();
                      } else if (isClear) {
                        onClear();
                      } else {
                        onDigit(key);
                      }
                    },
                    child: Center(
                      child: isDelete
                          ? Icon(
                              Icons.backspace_outlined,
                              size: 16,
                              color: theme.colorScheme.error,
                            )
                          : Text(
                              key,
                              style: TextStyle(
                                fontSize: isClear ? 11 : 16,
                                fontWeight: FontWeight.w900,
                                color: isClear
                                    ? theme.colorScheme.onSurface.withValues(alpha: 0.6)
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
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

class IsometricBlocksPainter extends CustomPainter {
  final List<List<int>> grid;
  final double yaw;
  final double pitch;
  final ColorScheme colorScheme;

  IsometricBlocksPainter({
    required this.grid,
    required this.yaw,
    required this.pitch,
    required this.colorScheme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2.0;
    final centerY = size.height / 2.0;
    
    // Scale size of grid based on canvas
    final int gridSize = grid.length;
    final double maxDim = gridSize.toDouble();
    final double blockScale = math.min(size.width, size.height) / (maxDim * 2.2);

    List<ProjectedFace> facesToDraw = [];

    // Light source vector in local 3D coordinates (normalized)
    final lightVec = Point3D(0.5, -0.8, 1.5);
    final lightLen = math.sqrt(lightVec.x * lightVec.x + lightVec.y * lightVec.y + lightVec.z * lightVec.z);
    final lx = lightVec.x / lightLen;
    final ly = lightVec.y / lightLen;
    final lz = lightVec.z / lightLen;

    // We build unit-sized cubes centered at X, Y, Z
    final r = 0.45; // slightly smaller than 0.5 to leave gap

    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        final height = grid[x][y];
        for (int z = 0; z < height; z++) {
          // Center coordinate in local space
          final cx = x - (gridSize - 1) / 2.0;
          final cy = y - (gridSize - 1) / 2.0;
          final cz = z - 0.5; // shift down slightly to center it vertically

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

          // Indigo base color for blocks
          const baseColor = DesignSystem.primary;

          for (int f = 0; f < 6; f++) {
            final normal = faceNormals[f];
            final vertices = facesVertices[f];

            // 3D rotation of normal
            final rotNormalX = normal.x * math.cos(yaw) - normal.y * math.sin(yaw);
            final rotNormalY = normal.x * math.sin(yaw) + normal.y * math.cos(yaw);
            final rotNormalZ = normal.z;

            // X-rotation (pitch)
            final projNormalZ = rotNormalY * math.sin(pitch) + rotNormalZ * math.cos(pitch);

            // Back-face culling: if normal points away from viewer, don't draw
            // In this coordinate projection system, if projNormalZ is negative, it's facing away
            if (projNormalZ < -0.01) continue;

            // Lighting shading factor
            final dot = normal.x * lx + normal.y * ly + normal.z * lz;
            final intensity = (dot + 1.0) / 2.0; // scale to 0-1
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

    // Painter's algorithm: sort faces back-to-front (smaller depth value is further back, so draw first)
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
  bool shouldRepaint(covariant IsometricBlocksPainter oldDelegate) {
    return oldDelegate.yaw != yaw || oldDelegate.pitch != pitch || oldDelegate.grid != grid;
  }
}
