import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'wireframe_3d_rotation_engine.dart';

class Wireframe3DRotationScreen extends ConsumerStatefulWidget {
  const Wireframe3DRotationScreen({super.key});

  @override
  ConsumerState<Wireframe3DRotationScreen> createState() => _Wireframe3DRotationScreenState();
}

class _Wireframe3DRotationScreenState extends ConsumerState<Wireframe3DRotationScreen> {
  static const int targetScore = 8;

  late WireframeRound _currentRound;
  int _score = 0;
  bool _isGameOver = false;
  int? _selectedOption;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _isGameOver = false;
      _selectedOption = null;
      _currentRound = Wireframe3DRotationEngine.generateRound();
    });
  }

  void _selectOption(int index) {
    if (_isGameOver || _selectedOption != null) return;

    final isCorrect = index == _currentRound.correctOptionIndex;
    setState(() {
      _selectedOption = index;
    });

    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('wireframe_3d_rotation');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedOption = null;
            _currentRound = Wireframe3DRotationEngine.generateRound();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _selectedOption = null;
            _currentRound = Wireframe3DRotationEngine.generateRound();
          });
        }
      });
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.wireframe3DRotationWinTitle,
        message: l10n.wireframe3DRotationWinMessage,
        onPlayAgain: () {
          Navigator.of(context).pop();
          _startNewGame();
        },
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: l10n.wireframe3DRotationTitle,
      subtitle: l10n.wireframe3DRotationSubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'SOURCE 3D WIREFRAME',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              _buildSourcePreview(colorScheme),
              const SizedBox(height: DesignSystem.spaceMD),
              Text(
                'WHICH OPTION IS ROTATED BY ${_currentRound.rotationAngleDeg.toInt()}° AROUND Y-AXIS?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: DesignSystem.primary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              Expanded(child: _buildOptionsGrid(colorScheme)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.architecture_rounded, size: 18, color: DesignSystem.gamePurple),
              const SizedBox(width: 6),
              Text(
                'WIREFRAME 3D',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gamePurple,
                ),
              ),
            ],
          ),
        ),
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.stars_rounded, size: 18, color: DesignSystem.primary),
              const SizedBox(width: 6),
              Text(
                '$_score / $targetScore',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSourcePreview(ColorScheme colorScheme) {
    return Container(
      width: 140,
      height: 110,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Center(
        child: CustomPaint(
          size: const Size(120, 90),
          painter: _WireframePainter(
            vertices: _currentRound.vertices,
            edges: _currentRound.edges,
            yawAngleRad: 0.3,
            color: DesignSystem.gamePurple,
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsGrid(ColorScheme colorScheme) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: DesignSystem.spaceMD,
        mainAxisSpacing: DesignSystem.spaceMD,
        childAspectRatio: 1.2,
      ),
      itemCount: 4,
      itemBuilder: (context, idx) {
        final isSelected = _selectedOption == idx;
        final isCorrect = _currentRound.correctOptionIndex == idx;

        double yaw = 0.3;
        if (idx == _currentRound.correctOptionIndex) {
          yaw += (_currentRound.rotationAngleDeg * math.pi / 180);
        } else {
          yaw += ((idx * 75 + 45) * math.pi / 180);
        }

        Color cardColor = colorScheme.surface;
        Color borderColor = colorScheme.outline.withValues(alpha: 0.4);

        if (_selectedOption != null) {
          if (isCorrect) {
            cardColor = DesignSystem.success.withValues(alpha: 0.15);
            borderColor = DesignSystem.success;
          } else if (isSelected) {
            cardColor = DesignSystem.error.withValues(alpha: 0.15);
            borderColor = DesignSystem.error;
          }
        }

        return GestureDetector(
          onTap: () => _selectOption(idx),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 4,
                  child: Text(
                    String.fromCharCode(65 + idx),
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                Center(
                  child: CustomPaint(
                    size: const Size(100, 75),
                    painter: _WireframePainter(
                      vertices: _currentRound.vertices,
                      edges: _currentRound.edges,
                      yawAngleRad: yaw,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _WireframePainter extends CustomPainter {
  final List<Point3D> vertices;
  final List<Edge3D> edges;
  final double yawAngleRad;
  final Color color;

  _WireframePainter({
    required this.vertices,
    required this.edges,
    required this.yawAngleRad,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final scale = size.height * 0.45;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final nodePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Project points with yaw rotation
    final projected = <Offset>[];
    for (final v in vertices) {
      final rx = v.x * math.cos(yawAngleRad) - v.z * math.sin(yawAngleRad);
      final rz = v.x * math.sin(yawAngleRad) + v.z * math.cos(yawAngleRad);
      final ry = v.y;

      final px = center.dx + rx * scale;
      final py = center.dy - ry * scale + (rz * scale * 0.2);
      projected.add(Offset(px, py));
    }

    for (final e in edges) {
      canvas.drawLine(projected[e.from], projected[e.to], paint);
    }

    for (final p in projected) {
      canvas.drawCircle(p, 4.0, nodePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
