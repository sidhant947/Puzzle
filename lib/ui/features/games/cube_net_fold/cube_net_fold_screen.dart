import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cube_net_fold_provider.dart';
import 'cube_net_fold_engine.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class CubeNetFoldScreen extends ConsumerStatefulWidget {
  const CubeNetFoldScreen({super.key});

  @override
  ConsumerState<CubeNetFoldScreen> createState() => _CubeNetFoldScreenState();
}

class _CubeNetFoldScreenState extends ConsumerState<CubeNetFoldScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cubeNetFoldNotifierProvider.notifier).initGame();
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
                '1. Look at the unfolded 2D net at the top.\n\n'
                '2. Mentally fold the net into a 3D cube.\n\n'
                '3. Choose the option below that represents a valid 3D perspective of that folded cube.\n\n'
                '4. Be careful: opposite faces in the net cannot be adjacent in 3D, and the order of adjacent faces must match!',
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

  Widget _buildNetFace(BuildContext context, int row, int col, List<Color> colors) {
    int? faceIndex;
    if (row == 0 && col == 1) faceIndex = 0; // Top
    if (row == 1 && col == 0) faceIndex = 5; // Left
    if (row == 1 && col == 1) faceIndex = 2; // Front
    if (row == 1 && col == 2) faceIndex = 4; // Right
    if (row == 2 && col == 1) faceIndex = 1; // Bottom
    if (row == 3 && col == 1) faceIndex = 3; // Back

    if (faceIndex == null) {
      return const SizedBox(width: 44, height: 44);
    }

    final color = colors[faceIndex];
    return Container(
      margin: const EdgeInsets.all(2),
      child: TangibleContainer(
        depth: 3.0,
        radius: DesignSystem.radiusXS,
        color: color,
        shadowColor: color.withValues(alpha: 0.7),
        child: const SizedBox(
          width: 40,
          height: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cubeNetFoldNotifierProvider);
    final notifier = ref.read(cubeNetFoldNotifierProvider.notifier);
    final theme = Theme.of(context);

    if (state.isVictory) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogCtx) => GameCompletionDialog(
            title: 'CORRECT',
            message: 'You have perfect 3D spatial folding logic!',
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
      title: 'Cube Net Fold',
      subtitle: 'SELECT THE MATCHING 3D CUBE OPTION',
      onHowToPlay: _showHowToPlay,
      onReset: notifier.reset,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
              child: Column(
                children: [
                  const SizedBox(height: DesignSystem.spaceMD),
                  
                  // Section 1: The 2D net card
                  Text(
                    'UNFOLDED 2D NET',
                    style: theme.textTheme.titleMedium?.copyWith(
                      letterSpacing: 1.0,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceSM),
                  
                  TangibleContainer(
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(4, (r) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(3, (c) {
                            return _buildNetFace(context, r, c, state.netColors);
                          }),
                        );
                      }),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Section 2: The folded 3D cube options
                  Text(
                    'WHICH CUBE MATCHES?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      letterSpacing: 1.0,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (index) {
                      final option = state.options[index];
                      final isSelected = state.selectedIndex == index;
                      final isCorrect = option.isValid;
                      
                      Color cardColor = theme.colorScheme.surface;
                      Color shadow = theme.colorScheme.outline;
                      if (isSelected) {
                        if (state.isFailed) {
                          cardColor = theme.colorScheme.error.withValues(alpha: 0.1);
                          shadow = theme.colorScheme.error;
                        } else {
                          cardColor = DesignSystem.primary.withValues(alpha: 0.15);
                          shadow = DesignSystem.primary;
                        }
                      }

                      return SizedBox(
                        width: 100,
                        height: 110,
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
                                top: 8,
                                child: SizedBox(
                                  width: 65,
                                  height: 65,
                                  child: CustomPaint(
                                    painter: IsometricCubePainter(
                                      visibleColors: option.visibleColors,
                                    ),
                                  ),
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
                                      fontSize: 11,
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
                  
                  const Spacer(),
                  
                  // Submit Button
                  SizedBox(
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
                                    content: Text('Incorrect fold logic! Tap Reset or change your choice.'),
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
                          state.isFailed ? 'FAILED (TAP RESET)' : 'SUBMIT CHOICE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceLG),
                ],
              ),
            ),
    );
  }
}

class IsometricCubePainter extends CustomPainter {
  final List<Color> visibleColors;

  IsometricCubePainter({required this.visibleColors});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2.0;
    final cy = size.height / 2.0;
    
    final r = math.min(size.width, size.height) * 0.46;
    
    final cos30 = math.cos(math.pi / 6.0); // 0.866
    final sin30 = math.sin(math.pi / 6.0); // 0.5

    // Vertices
    final c = Offset(cx, cy);
    final t = Offset(cx, cy - r);
    final tl = Offset(cx - r * cos30, cy - r * sin30);
    final tr = Offset(cx + r * cos30, cy - r * sin30);
    final bl = Offset(cx - r * cos30, cy + r * sin30);
    final br = Offset(cx + r * cos30, cy + r * sin30);
    final b = Offset(cx, cy + r);

    final paint = Paint()..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white.withValues(alpha: 0.3)
      ..strokeWidth = 1.2;

    // 1. Draw Top Face
    final pathTop = Path()
      ..moveTo(c.dx, c.dy)
      ..lineTo(tr.dx, tr.dy)
      ..lineTo(t.dx, t.dy)
      ..lineTo(tl.dx, tl.dy)
      ..close();
    paint.color = visibleColors[0];
    canvas.drawPath(pathTop, paint);
    canvas.drawPath(pathTop, strokePaint);

    // 2. Draw Left Face (Front)
    final pathLeft = Path()
      ..moveTo(c.dx, c.dy)
      ..lineTo(tl.dx, tl.dy)
      ..lineTo(bl.dx, bl.dy)
      ..lineTo(b.dx, b.dy)
      ..close();
    paint.color = Color.lerp(Colors.black, visibleColors[1], 0.86)!;
    canvas.drawPath(pathLeft, paint);
    canvas.drawPath(pathLeft, strokePaint);

    // 3. Draw Right Face
    final pathRight = Path()
      ..moveTo(c.dx, c.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(br.dx, br.dy)
      ..lineTo(tr.dx, tr.dy)
      ..close();
    paint.color = Color.lerp(Colors.black, visibleColors[2], 0.74)!;
    canvas.drawPath(pathRight, paint);
    canvas.drawPath(pathRight, strokePaint);
  }

  @override
  bool shouldRepaint(covariant IsometricCubePainter oldDelegate) {
    return oldDelegate.visibleColors != visibleColors;
  }
}
