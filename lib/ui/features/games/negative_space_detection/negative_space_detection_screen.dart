import 'dart:math' as math;
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'negative_space_detection_provider.dart';
import 'negative_space_detection_engine.dart';

class NegativeSpaceDetectionScreen extends ConsumerStatefulWidget {
  const NegativeSpaceDetectionScreen({super.key});

  @override
  ConsumerState<NegativeSpaceDetectionScreen> createState() => _NegativeSpaceDetectionScreenState();
}

class _NegativeSpaceDetectionScreenState extends ConsumerState<NegativeSpaceDetectionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(negativeSpaceDetectionNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) => GameCompletionDialog(
        title: isVictory ? l10n.negativeSpaceDetectionTitle.toUpperCase() : AppLocalizations.of(context)!.gameOver,
        message: isVictory ? l10n.negativeSpaceDetectionMessage : AppLocalizations.of(context)!.loseTryAgainSolution,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(dialogCtx).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(dialogCtx).pop();
          ref.read(negativeSpaceDetectionNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(negativeSpaceDetectionNotifierProvider);
    final notifier = ref.read(negativeSpaceDetectionNotifierProvider.notifier);

    ref.listen(negativeSpaceDetectionNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('negative_space_detection');
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(true);
        });
      } else if (next.isFailed && !(previous?.isFailed ?? false)) {
        HapticFeedbackUtil.error();
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _showCompletionDialog(false);
        });
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: L10nGameHelpers.getGameTitle(context, 'negative_space_detection'),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'negative_space_detection'),
      subtitle: l10n.negativeSpaceDetectionSubtitle,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Text(
              'REVEAL THE HIDDEN OBJECT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            _buildTarget(state.target!, colorScheme.onSurface),
            const SizedBox(height: DesignSystem.spaceXL),
            Text(
              'WHICH OBJECT IS IT?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            Wrap(
              spacing: DesignSystem.spaceMD,
              runSpacing: DesignSystem.spaceMD,
              alignment: WrapAlignment.center,
              children: List.generate(state.options.length, (index) {
                return _buildOption(state, notifier, index, colorScheme.onSurface);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTarget(NegativeSpaceShape shape, Color onSurfaceColor) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        boxShadow: [
          BoxShadow(
            color: onSurfaceColor.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        child: CustomPaint(
          painter: NegativeSpacePainter(shape, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  Widget _buildOption(NegativeSpaceDetectionState state, NegativeSpaceDetectionNotifier notifier, int index, Color onSurfaceColor) {
    final isSelected = state.selectedIndex == index;
    final isCorrect = state.correctIndex == index;
    final showResult = state.selectedIndex != null;
    final shape = state.options[index];

    Color borderColor = Theme.of(context).colorScheme.outline.withValues(alpha: 0.5);
    if (showResult) {
      if (isCorrect) {
        borderColor = Colors.green;
      } else if (isSelected) {
        borderColor = Colors.red;
      }
    } else if (isSelected) {
      borderColor = Theme.of(context).colorScheme.primary;
    }

    return GestureDetector(
      onTap: () => notifier.selectOption(index),
      child: Container(
        width: 140,
        height: 140,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: onSurfaceColor.withValues(alpha: 0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(80, 80),
              painter: ShapePainter(shape, color: Theme.of(context).colorScheme.primary),
            ),
            if (showResult && isCorrect)
              const Positioned(top: 4, right: 4, child: Icon(Icons.check_circle, color: Colors.green, size: 24)),
            if (showResult && isSelected && !isCorrect)
              const Positioned(top: 4, right: 4, child: Icon(Icons.cancel, color: Colors.red, size: 24)),
          ],
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final NegativeSpaceShape shape;
  final Color color;
  final bool fill;

  ShapePainter(this.shape, {required this.color, this.fill = true});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = fill ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = getShapePath(shape, size);
    canvas.drawPath(path, paint);
  }

  static Path getShapePath(NegativeSpaceShape shape, Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    switch (shape) {
      case NegativeSpaceShape.circle:
        path.addOval(Rect.fromCircle(center: center, radius: radius));
        break;
      case NegativeSpaceShape.triangle:
        path.moveTo(center.dx, center.dy - radius);
        path.lineTo(center.dx + radius, center.dy + radius);
        path.lineTo(center.dx - radius, center.dy + radius);
        path.close();
        break;
      case NegativeSpaceShape.star:
        const points = 5;
        const innerRadius = 0.4;
        for (int i = 0; i < points * 2; i++) {
          final angle = i * math.pi / points;
          final r = i.isEven ? radius : radius * innerRadius;
          final x = center.dx + r * math.cos(-(angle + math.pi / 2));
          final y = center.dy + r * math.sin(-(angle + math.pi / 2));
          if (i == 0) {
            path.moveTo(x, y);
          } else {
            path.lineTo(x, y);
          }
        }
        path.close();
        break;
      case NegativeSpaceShape.heart:
        path.moveTo(center.dx, center.dy + radius * 0.7);
        path.cubicTo(center.dx - radius, center.dy - radius * 0.5, center.dx - radius * 0.5, center.dy - radius, center.dx, center.dy - radius * 0.3);
        path.cubicTo(center.dx + radius * 0.5, center.dy - radius, center.dx + radius, center.dy - radius * 0.5, center.dx, center.dy + radius * 0.7);
        break;
      case NegativeSpaceShape.moon:
        path.addArc(Rect.fromCircle(center: center, radius: radius), -1.5, 4.0);
        path.arcToPoint(Offset(center.dx + radius * 0.1, center.dy - radius * 0.99), radius: Radius.circular(radius * 0.8), clockwise: false);
        break;
      case NegativeSpaceShape.cross:
        final w = radius * 0.4;
        path.moveTo(center.dx - w, center.dy - radius);
        path.lineTo(center.dx + w, center.dy - radius);
        path.lineTo(center.dx + w, center.dy - w);
        path.lineTo(center.dx + radius, center.dy - w);
        path.lineTo(center.dx + radius, center.dy + w);
        path.lineTo(center.dx + w, center.dy + w);
        path.lineTo(center.dx + w, center.dy + radius);
        path.lineTo(center.dx - w, center.dy + radius);
        path.lineTo(center.dx - w, center.dy + w);
        path.lineTo(center.dx - radius, center.dy + w);
        path.lineTo(center.dx - radius, center.dy - w);
        path.lineTo(center.dx - w, center.dy - w);
        path.close();
        break;
      case NegativeSpaceShape.diamond:
        path.moveTo(center.dx, center.dy - radius);
        path.lineTo(center.dx + radius, center.dy);
        path.lineTo(center.dx, center.dy + radius);
        path.lineTo(center.dx - radius, center.dy);
        path.close();
        break;
      case NegativeSpaceShape.pentagon:
        _addPolygon(path, center, radius, 5);
        break;
      case NegativeSpaceShape.hexagon:
        _addPolygon(path, center, radius, 6);
        break;
      case NegativeSpaceShape.octagon:
        _addPolygon(path, center, radius, 8);
        break;
    }
    return path;
  }

  static void _addPolygon(Path path, Offset center, double radius, int sides) {
    for (int i = 0; i < sides; i++) {
      final angle = (i * 2 * math.pi / sides) - math.pi / 2;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Fixed the extension above to use dart:math
class NegativeSpacePainter extends CustomPainter {
  final NegativeSpaceShape shape;
  final Color color;

  NegativeSpacePainter(this.shape, {required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw background
    final rectPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // Create shape path
    final shapePath = ShapePainter.getShapePath(shape, size * 0.7);
    final shapeSize = size * 0.7;
    final shiftedPath = shapePath.shift(Offset((size.width - shapeSize.width) / 2, (size.height - shapeSize.height) / 2));

    // Combine paths (subtract shape from rect)
    final combinedPath = Path.combine(PathOperation.difference, rectPath, shiftedPath);
    
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
