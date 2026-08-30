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
import 'visual_crowding_acuity_engine.dart';

class VisualCrowdingAcuityScreen extends ConsumerStatefulWidget {
  const VisualCrowdingAcuityScreen({super.key});

  @override
  ConsumerState<VisualCrowdingAcuityScreen> createState() => _VisualCrowdingAcuityScreenState();
}

class _VisualCrowdingAcuityScreenState extends ConsumerState<VisualCrowdingAcuityScreen> {
  static const int totalTrials = 12;

  late VisualCrowdingTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _trialCount = 0;
      _score = 0;
      _isGameOver = false;
      _loadNewTrial();
    });
  }

  void _loadNewTrial() {
    if (_trialCount >= totalTrials) {
      _endGame();
      return;
    }

    setState(() {
      _trialCount++;
      _currentTrial = VisualCrowdingAcuityEngine.generateTrial();
    });
  }

  void _submitOrientation(LandoltOrientation orientation) {
    if (_isGameOver) return;

    final isCorrect = orientation == _currentTrial.targetOrientation;
    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });
    } else {
      HapticFeedbackUtil.error();
    }

    _loadNewTrial();
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('visual_crowding_acuity');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.visualCrowdingAcuityWinTitle,
        message: 'Accuracy: $_score / $totalTrials uncrowded visual orientation discriminations!',
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
      title: l10n.visualCrowdingAcuityTitle,
      subtitle: l10n.visualCrowdingAcuitySubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const Spacer(flex: 1),
              _buildCrowdingStage(colorScheme),
              const Spacer(flex: 2),
              _buildDirectionPad(colorScheme),
              const Spacer(flex: 1),
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
              const Icon(Icons.remove_red_eye_rounded, size: 18, color: DesignSystem.gameRose),
              const SizedBox(width: 6),
              Text(
                'TRIAL $_trialCount / $totalTrials',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameRose,
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
                'ACCURACY: $_score',
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

  Widget _buildCrowdingStage(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.6), width: 2),
      ),
      child: Column(
        children: [
          Text(
            'WHICH DIRECTION IS THE CENTER "C" OPENING FACING?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Geist',
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLandoltC(_currentTrial.flankerLeft, colorScheme.onSurface.withValues(alpha: 0.4)),
              SizedBox(width: _currentTrial.flankerSpacing),
              _buildLandoltC(_currentTrial.targetOrientation, DesignSystem.primary, isTarget: true),
              SizedBox(width: _currentTrial.flankerSpacing),
              _buildLandoltC(_currentTrial.flankerRight, colorScheme.onSurface.withValues(alpha: 0.4)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLandoltC(LandoltOrientation orientation, Color color, {bool isTarget = false}) {
    double angle = 0;
    switch (orientation) {
      case LandoltOrientation.right:
        angle = 0;
        break;
      case LandoltOrientation.down:
        angle = math.pi / 2;
        break;
      case LandoltOrientation.left:
        angle = math.pi;
        break;
      case LandoltOrientation.up:
        angle = 3 * math.pi / 2;
        break;
    }

    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        size: Size(isTarget ? 36 : 30, isTarget ? 36 : 30),
        painter: _LandoltCPainter(color: color, strokeWidth: isTarget ? 5.0 : 4.0),
      ),
    );
  }

  Widget _buildDirectionPad(ColorScheme colorScheme) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _buildDirectionBtn(LandoltOrientation.up, Icons.arrow_upward_rounded, colorScheme),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _buildDirectionBtn(LandoltOrientation.left, Icons.arrow_back_rounded, colorScheme),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _buildDirectionBtn(LandoltOrientation.right, Icons.arrow_forward_rounded, colorScheme),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildDirectionBtn(LandoltOrientation.down, Icons.arrow_downward_rounded, colorScheme),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionBtn(LandoltOrientation orientation, IconData icon, ColorScheme colorScheme) {
    return TangibleButton(
      color: colorScheme.surface,
      onTap: () => _submitOrientation(orientation),
      padding: const EdgeInsets.all(16),
      child: Icon(icon, size: 28),
    );
  }
}

class _LandoltCPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _LandoltCPainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(strokeWidth / 2, strokeWidth / 2, size.width - strokeWidth, size.height - strokeWidth);
    // Draw arc leaving gap on right (from 45 deg to 315 deg)
    canvas.drawArc(rect, 0.6, 2 * math.pi - 1.2, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
