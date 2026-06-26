import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'complex_folding_nets_engine.dart';
import 'complex_folding_nets_provider.dart';

class ComplexFoldingNetsScreen extends ConsumerStatefulWidget {
  const ComplexFoldingNetsScreen({super.key});

  @override
  ConsumerState<ComplexFoldingNetsScreen> createState() => _ComplexFoldingNetsScreenState();
}

class _ComplexFoldingNetsScreenState extends ConsumerState<ComplexFoldingNetsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(complexFoldingNetsNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.complexFoldingNetsTitle.toUpperCase(),
        message: isVictory ? l10n.complexFoldingNetsCongrats : AppLocalizations.of(context)!.loseTryAgainSolution,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(complexFoldingNetsNotifierProvider.notifier).reset();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(complexFoldingNetsNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(complexFoldingNetsNotifierProvider, (previous, next) {
      if ((next.isVictory && !(previous?.isVictory ?? false)) ||
          (next.isFailed && !(previous?.isFailed ?? false))) {
        if (next.isVictory) {
          HapticFeedbackUtil.victory();
          ref.read(gameStreakNotifierProvider.notifier).completeGame('complex_folding_nets');
        } else {
          HapticFeedbackUtil.error();
        }
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _showCompletionDialog(next.isVictory);
          }
        });
      }
    });

    if (state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'complex_folding_nets'),
      subtitle: l10n.complexFoldingNetsSubtitle,
      onReset: () => ref.read(complexFoldingNetsNotifierProvider.notifier).reset(),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(DesignSystem.spaceMD),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
              ),
              child: Center(
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: NetPainter(
                    type: state.correctPair!.type,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Text(
              "WHICH SOLID MATCHES THIS NET?",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.0,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
              ),
              itemCount: state.options.length,
              itemBuilder: (context, index) {
                final option = state.options[index];
                final isSelected = state.selectedIndex == index;
                final isCorrect = state.isVictory && isSelected;
                final isWrong = state.isFailed && isSelected;

                Color cardColor = Theme.of(context).colorScheme.surface;
                if (isCorrect) {
                  cardColor = DesignSystem.success.withValues(alpha: 0.2);
                }
                if (isWrong) {
                  cardColor = DesignSystem.error.withValues(alpha: 0.2);
                }

                return GestureDetector(
                  onTap: () => ref.read(complexFoldingNetsNotifierProvider.notifier).selectOption(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: isCorrect 
                          ? DesignSystem.success 
                          : isWrong 
                            ? DesignSystem.error 
                            : isSelected 
                              ? Theme.of(context).colorScheme.primary 
                              : Theme.of(context).colorScheme.outlineVariant,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        option.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: isCorrect 
                            ? DesignSystem.success 
                            : isWrong 
                              ? DesignSystem.error 
                              : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NetPainter extends CustomPainter {
  final SolidType type;
  final Color color;

  NetPainter({required this.type, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    const s = 40.0; // side length

    switch (type) {
      case SolidType.triangularPrism:
        _drawTriangularPrism(canvas, center, s, paint, fillPaint);
        break;
      case SolidType.hexagonalPyramid:
        _drawHexagonalPyramid(canvas, center, s, paint, fillPaint);
        break;
      case SolidType.pentagonalPrism:
        _drawPentagonalPrism(canvas, center, s, paint, fillPaint);
        break;
      case SolidType.octahedron:
        _drawOctahedron(canvas, center, s, paint, fillPaint);
        break;
      case SolidType.tetrahedron:
      case SolidType.triangularPyramid:
        _drawTetrahedron(canvas, center, s, paint, fillPaint);
        break;
      case SolidType.squarePyramid:
        _drawSquarePyramid(canvas, center, s, paint, fillPaint);
        break;
    }
  }

  void _drawTriangularPrism(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    // 3 rectangles in a row, 2 triangles
    final h = s * 1.5;
    final startX = center.dx - 1.5 * s;
    final startY = center.dy - h / 2;

    for (int i = 0; i < 3; i++) {
      final rect = Rect.fromLTWH(startX + i * s, startY, s, h);
      canvas.drawRect(rect, fill);
      canvas.drawRect(rect, paint);
    }

    // Triangles on the middle rectangle
    final midX = startX + s;
    final triH = (sqrt(3) / 2) * s;
    
    final topTri = Path()
      ..moveTo(midX, startY)
      ..lineTo(midX + s, startY)
      ..lineTo(midX + s / 2, startY - triH)
      ..close();
    canvas.drawPath(topTri, fill);
    canvas.drawPath(topTri, paint);

    final botTri = Path()
      ..moveTo(midX, startY + h)
      ..lineTo(midX + s, startY + h)
      ..lineTo(midX + s / 2, startY + h + triH)
      ..close();
    canvas.drawPath(botTri, fill);
    canvas.drawPath(botTri, paint);
  }

  void _drawHexagonalPyramid(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    // 1 hexagon, 6 triangles
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = i * pi / 3;
      final x = center.dx + s * cos(angle);
      final y = center.dy + s * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, fill);
    canvas.drawPath(path, paint);

    final triH = s * 1.2;
    for (int i = 0; i < 6; i++) {
      final angle1 = i * pi / 3;
      final angle2 = (i + 1) * pi / 3;
      final midAngle = (angle1 + angle2) / 2;
      
      final p1 = Offset(center.dx + s * cos(angle1), center.dy + s * sin(angle1));
      final p2 = Offset(center.dx + s * cos(angle2), center.dy + s * sin(angle2));
      final p3 = Offset(center.dx + (s + triH) * cos(midAngle), center.dy + (s + triH) * sin(midAngle));
      
      final tri = Path()..moveTo(p1.dx, p1.dy)..lineTo(p2.dx, p2.dy)..lineTo(p3.dx, p3.dy)..close();
      canvas.drawPath(tri, fill);
      canvas.drawPath(tri, paint);
    }
  }

  void _drawPentagonalPrism(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    final h = s * 1.2;
    final startX = center.dx - 2.5 * s;
    final startY = center.dy - h / 2;

    for (int i = 0; i < 5; i++) {
      final rect = Rect.fromLTWH(startX + i * s, startY, s, h);
      canvas.drawRect(rect, fill);
      canvas.drawRect(rect, paint);
    }

    // Pentagons on the second rectangle
    final midX = startX + s;
    final pentagon = Path();
    final radius = s / (2 * sin(pi / 5));
    final pentCenterTop = Offset(midX + s / 2, startY - radius * cos(pi / 5));
    
    for (int i = 0; i < 5; i++) {
      final angle = -pi/2 + i * 2 * pi / 5;
      final x = pentCenterTop.dx + radius * cos(angle);
      final y = pentCenterTop.dy + radius * sin(angle);
      if (i == 0) {
        pentagon.moveTo(x, y);
      } else {
        pentagon.lineTo(x, y);
      }
    }
    pentagon.close();
    canvas.drawPath(pentagon, fill);
    canvas.drawPath(pentagon, paint);

    final pentagonBot = Path();
    final pentCenterBot = Offset(midX + s / 2, startY + h + radius * cos(pi / 5));
    for (int i = 0; i < 5; i++) {
      final angle = pi/2 + i * 2 * pi / 5;
      final x = pentCenterBot.dx + radius * cos(angle);
      final y = pentCenterBot.dy + radius * sin(angle);
      if (i == 0) {
        pentagonBot.moveTo(x, y);
      } else {
        pentagonBot.lineTo(x, y);
      }
    }
    pentagonBot.close();
    canvas.drawPath(pentagonBot, fill);
    canvas.drawPath(pentagonBot, paint);
  }

  void _drawOctahedron(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    // 2 rows of 4 triangles
    final triH = (sqrt(3) / 2) * s;
    final startX = center.dx - 2 * s;
    final startY = center.dy - triH;

    for (int i = 0; i < 4; i++) {
      final tri = Path()
        ..moveTo(startX + i * s, startY + triH)
        ..lineTo(startX + (i + 1) * s, startY + triH)
        ..lineTo(startX + i * s + s / 2, startY)
        ..close();
      canvas.drawPath(tri, fill);
      canvas.drawPath(tri, paint);

      final tri2 = Path()
        ..moveTo(startX + i * s + s / 2, startY)
        ..lineTo(startX + (i + 1) * s + s / 2, startY)
        ..lineTo(startX + (i + 1) * s, startY + triH)
        ..close();
      canvas.drawPath(tri2, fill);
      canvas.drawPath(tri2, paint);
    }
  }

  void _drawTetrahedron(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    final triH = (sqrt(3) / 2) * s;
    final p1 = Offset(center.dx, center.dy - triH / 2);
    final p2 = Offset(center.dx - s / 2, center.dy + triH / 2);
    final p3 = Offset(center.dx + s / 2, center.dy + triH / 2);

    final midTri = Path()..moveTo(p1.dx, p1.dy)..lineTo(p2.dx, p2.dy)..lineTo(p3.dx, p3.dy)..close();
    canvas.drawPath(midTri, fill);
    canvas.drawPath(midTri, paint);

    // 3 triangles on sides
    void drawTri(Offset a, Offset b, Offset c) {
      final p = Path()..moveTo(a.dx, a.dy)..lineTo(b.dx, b.dy)..lineTo(c.dx, c.dy)..close();
      canvas.drawPath(p, fill);
      canvas.drawPath(p, paint);
    }

    drawTri(p1, p2, Offset(center.dx - s, center.dy - triH / 2));
    drawTri(p1, p3, Offset(center.dx + s, center.dy - triH / 2));
    drawTri(p2, p3, Offset(center.dx, center.dy + 1.5 * triH));
  }

  void _drawSquarePyramid(Canvas canvas, Offset center, double s, Paint paint, Paint fill) {
    final rect = Rect.fromLTWH(center.dx - s / 2, center.dy - s / 2, s, s);
    canvas.drawRect(rect, fill);
    canvas.drawRect(rect, paint);

    final triH = (sqrt(3) / 2) * s;
    // Top
    final t1 = Path()..moveTo(center.dx - s / 2, center.dy - s / 2)..lineTo(center.dx + s / 2, center.dy - s / 2)..lineTo(center.dx, center.dy - s / 2 - triH)..close();
    canvas.drawPath(t1, fill);
    canvas.drawPath(t1, paint);
    // Bottom
    final t2 = Path()..moveTo(center.dx - s / 2, center.dy + s / 2)..lineTo(center.dx + s / 2, center.dy + s / 2)..lineTo(center.dx, center.dy + s / 2 + triH)..close();
    canvas.drawPath(t2, fill);
    canvas.drawPath(t2, paint);
    // Left
    final t3 = Path()..moveTo(center.dx - s / 2, center.dy - s / 2)..lineTo(center.dx - s / 2, center.dy + s / 2)..lineTo(center.dx - s / 2 - triH, center.dy)..close();
    canvas.drawPath(t3, fill);
    canvas.drawPath(t3, paint);
    // Right
    final t4 = Path()..moveTo(center.dx + s / 2, center.dy - s / 2)..lineTo(center.dx + s / 2, center.dy + s / 2)..lineTo(center.dx + s / 2 + triH, center.dy)..close();
    canvas.drawPath(t4, fill);
    canvas.drawPath(t4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
