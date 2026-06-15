import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/ui/core/juice/game_scaffold.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import 'cross_section_slice_engine.dart';
import 'cross_section_slice_provider.dart';

class CrossSectionSliceScreen extends ConsumerStatefulWidget {
  const CrossSectionSliceScreen({super.key});

  @override
  ConsumerState<CrossSectionSliceScreen> createState() => _CrossSectionSliceScreenState();
}

class _CrossSectionSliceScreenState extends ConsumerState<CrossSectionSliceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(crossSectionSliceNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        isVictory: isVictory,
        title: isVictory ? l10n.wellDone : l10n.gameOver,
        message: isVictory ? l10n.crossSectionSliceCongrats : l10n.gameOver,
        onHome: () => Navigator.of(context).popUntil((route) => route.isFirst),
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(crossSectionSliceNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crossSectionSliceNotifierProvider);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(crossSectionSliceNotifierProvider.select((s) => s.isGameOver), (prev, next) {
      if (next && !(prev ?? false)) {
        final isVictory = state.score >= (state.isTrialMode ? state.targetTrials / 2 : 5);
        if (isVictory) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.error();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('cross_section_slice');
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(isVictory);
        });
      }
    });

    if (state.challenge == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: l10n.crossSectionSliceTitle,
      subtitle: l10n.crossSectionSliceSubtitle,
      onReset: () => ref.read(crossSectionSliceNotifierProvider.notifier).startGame(),
      body: Column(
        children: [
          _buildHeader(state, l10n),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: Padding(
                  padding: const EdgeInsets.all(DesignSystem.spaceXL),
                  child: CustomPaint(
                    painter: SolidPainter(
                      solid: state.challenge!.solid,
                      orientation: state.challenge!.orientation,
                      theme: Theme.of(context),
                    ),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
          ),
          _buildOptions(state, l10n),
        ],
      ),
    );
  }

  Widget _buildHeader(CrossSectionSliceState state, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard(l10n.score, state.score.toString(), theme.colorScheme.primary),
          if (!state.isTrialMode)
            _buildStatCard(l10n.timeLeft, "${state.timeLeft}s", theme.colorScheme.secondary)
          else
            _buildStatCard(l10n.trials, "${state.totalTrials}/${state.targetTrials}", theme.colorScheme.secondary),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: color.withValues(alpha: 0.8),
              letterSpacing: 1,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'Bebas Neue',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions(CrossSectionSliceState state, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceLG),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: DesignSystem.spaceMD,
        crossAxisSpacing: DesignSystem.spaceMD,
        childAspectRatio: 2.5,
        children: state.challenge!.options.map((shape) {
          return TangibleButton(
            onTap: () => ref.read(crossSectionSliceNotifierProvider.notifier).submitAnswer(shape),
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(_getShapeIcon(shape), size: 20),
                const SizedBox(width: 8),
                Text(
                  _getShapeLabel(shape, l10n),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  IconData _getShapeIcon(SectionShape shape) {
    switch (shape) {
      case SectionShape.circle:
        return Icons.circle_outlined;
      case SectionShape.square:
        return Icons.square_outlined;
      case SectionShape.triangle:
        return Icons.change_history_rounded;
      case SectionShape.rectangle:
        return Icons.crop_landscape_rounded;
      case SectionShape.ellipse:
        return Icons.lens_blur_rounded;
      case SectionShape.trapezoid:
        return Icons.architecture_rounded;
    }
  }

  String _getShapeLabel(SectionShape shape, AppLocalizations l10n) {
    switch (shape) {
      case SectionShape.circle:
        return l10n.shapeCircle;
      case SectionShape.square:
        return l10n.shapeSquare;
      case SectionShape.triangle:
        return l10n.shapeTriangle;
      case SectionShape.rectangle:
        return l10n.shapeRectangle;
      case SectionShape.ellipse:
        return l10n.shapeEllipse;
      case SectionShape.trapezoid:
        return l10n.shapeTrapezoid;
    }
  }
}

class SolidPainter extends CustomPainter {
  final SolidType solid;
  final CutOrientation orientation;
  final ThemeData theme;

  SolidPainter({
    required this.solid,
    required this.orientation,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.35;

    final solidPaint = Paint()
      ..color = theme.colorScheme.primary.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = theme.colorScheme.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final planePaint = Paint()
      ..color = theme.colorScheme.secondary.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    final planeStroke = Paint()
      ..color = theme.colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw the solid
    _drawSolid(canvas, center, radius, solidPaint, strokePaint);

    // Draw the slicing plane
    _drawPlane(canvas, center, radius, planePaint, planeStroke);
  }

  void _drawSolid(Canvas canvas, Offset center, double r, Paint fill, Paint stroke) {
    switch (solid) {
      case SolidType.sphere:
        canvas.drawCircle(center, r, fill);
        canvas.drawCircle(center, r, stroke);
        // Draw some 3D ellipses to give sphere volume
        canvas.drawOval(Rect.fromCenter(center: center, width: r * 2, height: r * 0.5), stroke..color = stroke.color.withValues(alpha: 0.3));
        canvas.drawOval(Rect.fromCenter(center: center, width: r * 0.5, height: r * 2), stroke..color = stroke.color.withValues(alpha: 0.3));
        break;

      case SolidType.cube:
        final top = center + Offset(0, -r);
        final topRight = center + Offset(r * 0.866, -r * 0.5);
        final bottomRight = center + Offset(r * 0.866, r * 0.5);
        final bottom = center + Offset(0, r);
        final bottomLeft = center + Offset(-r * 0.866, r * 0.5);
        final topLeft = center + Offset(-r * 0.866, -r * 0.5);

        final hexPath = Path()
          ..moveTo(top.dx, top.dy)
          ..lineTo(topRight.dx, topRight.dy)
          ..lineTo(bottomRight.dx, bottomRight.dy)
          ..lineTo(bottom.dx, bottom.dy)
          ..lineTo(bottomLeft.dx, bottomLeft.dy)
          ..lineTo(topLeft.dx, topLeft.dy)
          ..close();
        canvas.drawPath(hexPath, fill);
        canvas.drawPath(hexPath, stroke);

        final topFace = Path()
          ..moveTo(center.dx, center.dy)
          ..lineTo(top.dx, top.dy)
          ..lineTo(topRight.dx, topRight.dy)
          ..lineTo(bottomRight.dx, bottomRight.dy)
          ..close();
        canvas.drawPath(topFace, fill);
        canvas.drawPath(topFace, stroke);

        final rightFace = Path()
          ..moveTo(center.dx, center.dy)
          ..lineTo(bottomRight.dx, bottomRight.dy)
          ..lineTo(bottom.dx, bottom.dy)
          ..lineTo(bottomLeft.dx, bottomLeft.dy)
          ..close();
        canvas.drawPath(rightFace, fill);
        canvas.drawPath(rightFace, stroke);

        final leftFace = Path()
          ..moveTo(center.dx, center.dy)
          ..lineTo(topLeft.dx, topLeft.dy)
          ..lineTo(top.dx, top.dy)
          ..lineTo(bottomLeft.dx, bottomLeft.dy)
          ..close();
        canvas.drawPath(leftFace, fill);
        canvas.drawPath(leftFace, stroke);

        canvas.drawLine(center, top, stroke);
        canvas.drawLine(center, bottomRight, stroke);
        canvas.drawLine(center, bottomLeft, stroke);
        break;

      case SolidType.cylinder:
        final topOval = Rect.fromCenter(center: center - Offset(0, r * 0.7), width: r * 1.4, height: r * 0.4);
        final bottomOval = Rect.fromCenter(center: center + Offset(0, r * 0.7), width: r * 1.4, height: r * 0.4);
        
        canvas.drawRect(Rect.fromLTRB(center.dx - r * 0.7, center.dy - r * 0.7, center.dx + r * 0.7, center.dy + r * 0.7), fill);
        canvas.drawOval(topOval, fill);
        canvas.drawOval(bottomOval, fill);
        
        canvas.drawLine(Offset(center.dx - r * 0.7, center.dy - r * 0.7), Offset(center.dx - r * 0.7, center.dy + r * 0.7), stroke);
        canvas.drawLine(Offset(center.dx + r * 0.7, center.dy - r * 0.7), Offset(center.dx + r * 0.7, center.dy + r * 0.7), stroke);
        canvas.drawOval(topOval, stroke);
        canvas.drawOval(bottomOval, stroke);
        break;

      case SolidType.cone:
        final bottomOval = Rect.fromCenter(center: center + Offset(0, r * 0.7), width: r * 1.4, height: r * 0.4);
        final top = center - Offset(0, r * 0.7);
        
        final path = Path()
          ..moveTo(center.dx - r * 0.7, center.dy + r * 0.7)
          ..lineTo(top.dx, top.dy)
          ..lineTo(center.dx + r * 0.7, center.dy + r * 0.7)
          ..close();
        
        canvas.drawPath(path, fill);
        canvas.drawOval(bottomOval, fill);
        
        canvas.drawPath(path, stroke);
        canvas.drawOval(bottomOval, stroke);
        break;

      case SolidType.pyramid:
        final top = center - Offset(0, r * 0.8);
        final p1 = center + const Offset(-0.7, 0.4) * r;
        final p2 = center + const Offset(0.3, 0.4) * r;
        final p3 = center + const Offset(0.7, 0.7) * r;
        final p4 = center + const Offset(-0.3, 0.7) * r;

        final path = Path()
          ..moveTo(p1.dx, p1.dy)
          ..lineTo(p2.dx, p2.dy)
          ..lineTo(p3.dx, p3.dy)
          ..lineTo(p4.dx, p4.dy)
          ..close();
        canvas.drawPath(path, fill);
        canvas.drawPath(path, stroke);
        
        canvas.drawPath(Path()..moveTo(p1.dx, p1.dy)..lineTo(top.dx, top.dy)..lineTo(p2.dx, p2.dy), stroke);
        canvas.drawPath(Path()..moveTo(p2.dx, p2.dy)..lineTo(top.dx, top.dy)..lineTo(p3.dx, p3.dy), stroke);
        canvas.drawPath(Path()..moveTo(p3.dx, p3.dy)..lineTo(top.dx, top.dy)..lineTo(p4.dx, p4.dy), stroke);
        canvas.drawPath(Path()..moveTo(p4.dx, p4.dy)..lineTo(top.dx, top.dy)..lineTo(p1.dx, p1.dy), stroke);
        break;
    }
  }

  void _drawPlane(Canvas canvas, Offset center, double r, Paint fill, Paint stroke) {
    Path path = Path();
    double size = r * 1.5;

    switch (orientation) {
      case CutOrientation.horizontal:
        path.moveTo(center.dx - size, center.dy);
        path.lineTo(center.dx - size * 0.5, center.dy - size * 0.3);
        path.lineTo(center.dx + size, center.dy - size * 0.3);
        path.lineTo(center.dx + size * 0.5, center.dy);
        path.close();
        break;
      case CutOrientation.vertical:
        path.moveTo(center.dx, center.dy - size);
        path.lineTo(center.dx + size * 0.2, center.dy - size * 0.8);
        path.lineTo(center.dx + size * 0.2, center.dy + size);
        path.lineTo(center.dx, center.dy + size * 0.8);
        path.close();
        break;
      case CutOrientation.diagonal:
        path.moveTo(center.dx - size, center.dy - size * 0.5);
        path.lineTo(center.dx + size, center.dy + size * 0.5);
        path.lineTo(center.dx + size * 0.8, center.dy + size * 0.8);
        path.lineTo(center.dx - size * 0.8, center.dy - size * 0.2);
        path.close();
        break;
    }

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
