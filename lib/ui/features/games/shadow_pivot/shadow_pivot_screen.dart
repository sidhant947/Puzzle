import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shadow_pivot_provider.dart';
import 'shadow_pivot_engine.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';

class ShadowPivotScreen extends ConsumerStatefulWidget {
  const ShadowPivotScreen({super.key});

  @override
  ConsumerState<ShadowPivotScreen> createState() => _ShadowPivotScreenState();
}

class _ShadowPivotScreenState extends ConsumerState<ShadowPivotScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shadowPivotNotifierProvider.notifier).initGame();
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
                '1. Drag on the 3D viewport to rotate the block figure.\n\n'
                '2. Observe the target light source direction (FRONT, SIDE, or TOP).\n\n'
                '3. Choose the correct 2D shadow (silhouette) that the light would cast.\n\n'
                '4. Select your answer and tap "CHECK RESPONSE".',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              TangibleButton(
                onTap: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context)!.btnGotIt),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => GameCompletionDialog(
        title: isVictory ? l10n.shadowPivotTitle : AppLocalizations.of(context)!.gameOver,
        message: isVictory ? l10n.shadowPivotCongrats : AppLocalizations.of(context)!.loseTryAgainSolution,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(dialogCtx).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(dialogCtx).pop();
          ref.read(shadowPivotNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  String _getLightLabel(LightDirection dir) {
    switch (dir) {
      case LightDirection.top:
        return 'TOP LIGHT';
      case LightDirection.front:
        return 'FRONT LIGHT';
      case LightDirection.side:
        return 'SIDE LIGHT';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shadowPivotNotifierProvider);
    final notifier = ref.read(shadowPivotNotifierProvider.notifier);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(shadowPivotNotifierProvider, (previous, next) {
      if ((next.isVictory && !(previous?.isVictory ?? false)) ||
          (next.isFailed && !(previous?.isFailed ?? false))) {
        if (next.isVictory) {
          ref.read(gameStreakNotifierProvider.notifier).completeGame('shadow_pivot');
        }
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(next.isVictory);
        });
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'shadow_pivot'),
      subtitle: l10n.shadowPivotSubtitle,
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
                      flex: 4,
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
                                      painter: ShadowPivotPainter(
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
                        'LIGHT SOURCE: ${_getLightLabel(state.lightDirection)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.accentAmber,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: DesignSystem.spaceMD),

                    // Options Grid (2x2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: DesignSystem.spaceMD,
                          mainAxisSpacing: DesignSystem.spaceMD,
                          childAspectRatio: 1.2,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
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

                          return TangibleButton(
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
                                Center(
                                  child: ShadowGridWidget(
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
                                      'OPTION ${String.fromCharCode(65 + index)}',
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
                          );
                        },
                      ),
                    ),

                    const Spacer(),

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
                              state.isFailed ? AppLocalizations.of(context)!.gameOver : AppLocalizations.of(context)!.btnSubmit,
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

class ShadowGridWidget extends StatelessWidget {
  final List<List<bool>> grid;
  final Color activeColor;

  const ShadowGridWidget({
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
              width: 16,
              height: 16,
              margin: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: active ? activeColor : theme.colorScheme.outlineVariant.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(3),
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

class ShadowPivotPainter extends CustomPainter {
  final List<List<List<bool>>> grid3D;
  final double yaw;
  final double pitch;
  final ColorScheme colorScheme;

  ShadowPivotPainter({
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
    final double blockScale = math.min(size.width, size.height) / (gridSize * 2.5);

    List<ProjectedFace> facesToDraw = [];

    final lightVec = Point3D(0.5, -0.8, 1.5);
    final lightLen = math.sqrt(lightVec.x * lightVec.x + lightVec.y * lightVec.y + lightVec.z * lightVec.z);
    final lx = lightVec.x / lightLen;
    final ly = lightVec.y / lightLen;
    final lz = lightVec.z / lightLen;

    const r = 0.46; 

    for (int x = 0; x < gridSize; x++) {
      for (int y = 0; y < gridSize; y++) {
        for (int z = 0; z < gridSize; z++) {
          if (!grid3D[x][y][z]) continue;

          final cx = x - 1.0;
          final cy = y - 1.0;
          final cz = z - 1.0;

          final List<List<Point3D>> facesVertices = [
            [Point3D(cx-r, cy-r, cz+r), Point3D(cx+r, cy-r, cz+r), Point3D(cx+r, cy+r, cz+r), Point3D(cx-r, cy+r, cz+r)],
            [Point3D(cx+r, cy-r, cz-r), Point3D(cx+r, cy+r, cz-r), Point3D(cx+r, cy+r, cz+r), Point3D(cx+r, cy-r, cz+r)],
            [Point3D(cx-r, cy+r, cz-r), Point3D(cx-r, cy+r, cz+r), Point3D(cx+r, cy+r, cz+r), Point3D(cx+r, cy+r, cz-r)],
            [Point3D(cx-r, cy-r, cz-r), Point3D(cx-r, cy-r, cz+r), Point3D(cx-r, cy+r, cz+r), Point3D(cx-r, cy+r, cz-r)],
            [Point3D(cx-r, cy-r, cz-r), Point3D(cx+r, cy-r, cz-r), Point3D(cx+r, cy-r, cz+r), Point3D(cx-r, cy-r, cz+r)],
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

          const baseColor = DesignSystem.primary;

          for (int f = 0; f < 6; f++) {
            final normal = faceNormals[f];
            final vertices = facesVertices[f];

            final rotNormalY = normal.x * math.sin(yaw) + normal.y * math.cos(yaw);
            final rotNormalZ = normal.z;
            final projNormalZ = rotNormalY * math.sin(pitch) + rotNormalZ * math.cos(pitch);

            if (projNormalZ < -0.01) continue;

            final dot = normal.x * lx + normal.y * ly + normal.z * lz;
            final intensity = (dot + 1.0) / 2.0; 
            final shadedColor = Color.lerp(
              Colors.black,
              baseColor,
              0.5 + 0.5 * intensity,
            )!;

            double sumDepth = 0;
            List<Offset> projectedPoints = [];

            for (final v in vertices) {
              final rx = v.x * math.cos(yaw) - v.y * math.sin(yaw);
              final ry = v.x * math.sin(yaw) + v.y * math.cos(yaw);
              final rz = v.z;

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

    facesToDraw.sort((a, b) => a.avgDepth.compareTo(b.avgDepth));

    final paint = Paint()..style = PaintingStyle.fill;
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withValues(alpha: 0.2)
      ..strokeWidth = 0.5;

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
  bool shouldRepaint(covariant ShadowPivotPainter oldDelegate) {
    return oldDelegate.yaw != yaw || oldDelegate.pitch != pitch || oldDelegate.grid3D != grid3D;
  }
}
