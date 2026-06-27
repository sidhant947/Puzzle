import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class VectorGridAlignmentScreen extends ConsumerStatefulWidget {
  const VectorGridAlignmentScreen({super.key});

  @override
  ConsumerState<VectorGridAlignmentScreen> createState() => _VectorGridAlignmentScreenState();
}

class _VectorGridAlignmentScreenState extends ConsumerState<VectorGridAlignmentScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  // Align shape states
  double _userRotation = 0.0; // rotation angle in radians
  double _userScale = 1.0; // scale factor
  double _userTx = 0.0; // translation X (offset)
  double _userTy = 0.0; // translation Y (offset)

  // Target shape constants (puzzle parameters to match)
  late double _targetRotation;
  late double _targetScale;
  late double _targetTx;
  late double _targetTy;

  // Shapes pool points (Offset vectors from origin)
  final List<List<Offset>> _shapesPool = [
    // Triangle
    [const Offset(0, -60), const Offset(50, 40), const Offset(-50, 40)],
    // Arrow-head
    [const Offset(0, -60), const Offset(40, -10), const Offset(20, -10), const Offset(20, 50), const Offset(-20, 50), const Offset(-20, -10), const Offset(-40, -10)],
    // Diamond
    [const Offset(0, -60), const Offset(50, 0), const Offset(0, 60), const Offset(-50, 0)],
  ];

  late int _activeShapeIdx;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _activeShapeIdx = _random.nextInt(_shapesPool.length);

    // Target parameters are set randomly
    _targetRotation = (_random.nextDouble() * pi) - (pi / 2); // -90 to +90 degrees
    _targetScale = 0.8 + _random.nextDouble() * 0.6; // 0.8 to 1.4
    _targetTx = (_random.nextDouble() * 60) - 30; // -30 to 30 offset
    _targetTy = (_random.nextDouble() * 60) - 30; // -30 to 30 offset

    // Reset user controls
    _userRotation = 0.0;
    _userScale = 1.0;
    _userTx = 0.0;
    _userTy = 0.0;
  }

  void _checkAlignment() {
    final double rotDiff = (_userRotation - _targetRotation).abs();
    final double scaleDiff = (_userScale - _targetScale).abs();
    final double txDiff = (_userTx - _targetTx).abs();
    final double tyDiff = (_userTy - _targetTy).abs();

    // Check alignment threshold criteria
    if (rotDiff < 0.15 && scaleDiff < 0.15 && txDiff < 12.0 && tyDiff < 12.0) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _onGameComplete();
      } else {
        final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarAlignedPerfectly),
          backgroundColor: DesignSystem.gameGreen,
          duration: Duration(seconds: 1),
        ),
      );
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarNotAligned),
          backgroundColor: DesignSystem.gameRed,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('vector_grid_alignment');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'VECTOR ALIGNMENT',
      subtitle: 'Adjust rotation, scale, and translation offset sliders to match the blue shape to the dotted target silhouette.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
            _score = 0;
            _generatePuzzle();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                'Aligned: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            // Alignment Sandbox Board View
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: CustomPaint(
                  size: Size.infinite,
                  painter: _VectorAlignmentPainter(
                    shapePoints: _shapesPool[_activeShapeIdx],
                    targetRot: _targetRotation,
                    targetScale: _targetScale,
                    targetTx: _targetTx,
                    targetTy: _targetTy,
                    userRot: _userRotation,
                    userScale: _userScale,
                    userTx: _userTx,
                    userTy: _userTy,
                    isDark: isDark,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Adjustment sliders panel controls
            Card(
              elevation: 0,
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                side: BorderSide(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _buildSliderRow(
                      'ROTATION',
                      _userRotation,
                      -pi / 2,
                      pi / 2,
                      (val) => setState(() => _userRotation = val),
                    ),
                    _buildSliderRow(
                      'SCALE',
                      _userScale,
                      0.5,
                      1.7,
                      (val) => setState(() => _userScale = val),
                    ),
                    _buildSliderRow(
                      'OFFSET X',
                      _userTx,
                      -50.0,
                      50.0,
                      (val) => setState(() => _userTx = val),
                    ),
                    _buildSliderRow(
                      'OFFSET Y',
                      _userTy,
                      -50.0,
                      50.0,
                      (val) => setState(() => _userTy = val),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _checkAlignment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignSystem.gameGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.btnSubmitAlignment, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderRow(
    String label,
    double value,
    double minVal,
    double maxVal,
    ValueChanged<double> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: DesignSystem.primary,
                thumbColor: DesignSystem.primary,
                trackHeight: 3,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              ),
              child: Slider(
                value: value,
                min: minVal,
                max: maxVal,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VectorAlignmentPainter extends CustomPainter {
  final List<Offset> shapePoints;
  final double targetRot;
  final double targetScale;
  final double targetTx;
  final double targetTy;

  final double userRot;
  final double userScale;
  final double userTx;
  final double userTy;

  final bool isDark;

  _VectorAlignmentPainter({
    required this.shapePoints,
    required this.targetRot,
    required this.targetScale,
    required this.targetTx,
    required this.targetTy,
    required this.userRot,
    required this.userScale,
    required this.userTx,
    required this.userTy,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;

    // 1. Draw Target Dotted Silhouette
    canvas.save();
    canvas.translate(cx + targetTx, cy + targetTy);
    canvas.rotate(targetRot);
    canvas.scale(targetScale);

    final targetPaint = Paint()
      ..color = isDark ? Colors.white24 : Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final targetPath = _buildPath();
    canvas.drawPath(targetPath, targetPaint);
    canvas.restore();

    // 2. Draw User Glowing Shape
    canvas.save();
    canvas.translate(cx + userTx, cy + userTy);
    canvas.rotate(userRot);
    canvas.scale(userScale);

    final userPaint = Paint()
      ..color = DesignSystem.primary.withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;

    final userOutlinePaint = Paint()
      ..color = DesignSystem.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5;

    final userPath = _buildPath();
    canvas.drawPath(userPath, userPaint);
    canvas.drawPath(userPath, userOutlinePaint);
    canvas.restore();
  }

  Path _buildPath() {
    final path = Path();
    if (shapePoints.isNotEmpty) {
      path.moveTo(shapePoints[0].dx, shapePoints[0].dy);
      for (int i = 1; i < shapePoints.length; i++) {
        path.lineTo(shapePoints[i].dx, shapePoints[i].dy);
      }
      path.close();
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
