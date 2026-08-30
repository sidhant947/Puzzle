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
import 'gear_train_direction_engine.dart';

class GearTrainDirectionScreen extends ConsumerStatefulWidget {
  const GearTrainDirectionScreen({super.key});

  @override
  ConsumerState<GearTrainDirectionScreen> createState() => _GearTrainDirectionScreenState();
}

class _GearTrainDirectionScreenState extends ConsumerState<GearTrainDirectionScreen> with SingleTickerProviderStateMixin {
  static const int targetScore = 8;

  late GearTrainPuzzle _puzzle;
  late AnimationController _animController;
  int _score = 0;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _startNewGame();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _isGameOver = false;
      _loadNewPuzzle();
    });
  }

  void _loadNewPuzzle() {
    final numGears = _score < 3 ? 4 : (_score < 6 ? 5 : 6);
    _puzzle = GearTrainDirectionEngine.generatePuzzle(numGears: numGears);
  }

  void _submitAnswer(GearDirection direction) {
    if (_isGameOver) return;

    final isCorrect = direction == _puzzle.targetDirection;
    if (isCorrect) {
      HapticFeedbackUtil.victory();
      setState(() {
        _score++;
      });

      if (_score >= targetScore) {
        setState(() {
          _isGameOver = true;
        });
        ref.read(gameStreakNotifierProvider.notifier).completeGame('gear_train_direction');
        _showWinDialog();
        return;
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted && !_isGameOver) {
          setState(() {
            _loadNewPuzzle();
          });
        }
      });
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect rotation! Trace each gear connection carefully.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _showWinDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.gearTrainDirectionWinTitle,
        message: l10n.gearTrainDirectionWinMessage,
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
      title: l10n.gearTrainDirectionTitle,
      subtitle: l10n.gearTrainDirectionSubtitle,
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
                'WHAT DIRECTION WILL THE GREEN "?" GEAR ROTATE?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Expanded(child: _buildTrainCanvas(colorScheme)),
              const SizedBox(height: DesignSystem.spaceLG),
              _buildControlButtons(colorScheme),
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
              const Icon(Icons.settings_rounded, size: 18, color: DesignSystem.gamePurple),
              const SizedBox(width: 6),
              Text(
                'GEAR TRAIN',
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

  Widget _buildTrainCanvas(ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          return Stack(
            children: [
              // Draw connections
              CustomPaint(
                size: Size(w, h),
                painter: _GearTrainPainter(
                  puzzle: _puzzle,
                  colorScheme: colorScheme,
                ),
              ),
              // Draw gears
              ..._puzzle.gears.map((g) {
                final isInput = g.id == _puzzle.inputGearId;
                final isTarget = g.id == _puzzle.targetGearId;

                Color gColor;
                if (isInput) {
                  gColor = DesignSystem.primary;
                } else if (isTarget) {
                  gColor = DesignSystem.accentEmerald;
                } else {
                  gColor = colorScheme.onSurface.withValues(alpha: 0.6);
                }

                return Positioned(
                  left: (g.x * w) - g.radius,
                  top: (g.y * h) - g.radius,
                  child: AnimatedBuilder(
                    animation: _animController,
                    builder: (context, child) {
                      double angle = 0.0;
                      if (isInput) {
                        angle = _puzzle.inputDirection == GearDirection.clockwise
                            ? _animController.value * 2 * math.pi
                            : -_animController.value * 2 * math.pi;
                      }

                      return Transform.rotate(
                        angle: angle,
                        child: Container(
                          width: g.radius * 2,
                          height: g.radius * 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gColor.withValues(alpha: 0.15),
                            border: Border.all(color: gColor, width: 3),
                          ),
                          child: Center(
                            child: isTarget
                                ? const Text(
                                    '?',
                                    style: TextStyle(
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: DesignSystem.accentEmerald,
                                    ),
                                  )
                                : Icon(
                                    isInput
                                        ? (_puzzle.inputDirection == GearDirection.clockwise
                                            ? Icons.rotate_right_rounded
                                            : Icons.rotate_left_rounded)
                                        : Icons.settings_rounded,
                                    color: gColor,
                                    size: isInput ? 32 : 24,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildControlButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitAnswer(GearDirection.clockwise),
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.rotate_right_rounded, color: DesignSystem.primary, size: 24),
                SizedBox(width: 8),
                Text(
                  'CLOCKWISE',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceMD),
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _submitAnswer(GearDirection.counterClockwise),
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.rotate_left_rounded, color: DesignSystem.gameRose, size: 24),
                SizedBox(width: 8),
                Text(
                  'COUNTER-CW',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GearTrainPainter extends CustomPainter {
  final GearTrainPuzzle puzzle;
  final ColorScheme colorScheme;

  _GearTrainPainter({required this.puzzle, required this.colorScheme});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorScheme.outline.withValues(alpha: 0.8)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (final conn in puzzle.connections) {
      final from = puzzle.gears.firstWhere((g) => g.id == conn.fromId);
      final to = puzzle.gears.firstWhere((g) => g.id == conn.toId);

      final p1 = Offset(from.x * size.width, from.y * size.height);
      final p2 = Offset(to.x * size.width, to.y * size.height);

      if (conn.type == ConnectionType.meshed) {
        // Direct contact / dashed line
        canvas.drawLine(p1, p2, paint);
      } else if (conn.type == ConnectionType.belt) {
        // Parallel belts
        final perp = Offset(-(p2.dy - p1.dy), p2.dx - p1.dx) / (p2 - p1).distance * 14;
        canvas.drawLine(p1 + perp, p2 + perp, paint);
        canvas.drawLine(p1 - perp, p2 - perp, paint);
      } else {
        // Crossed belt
        final perp = Offset(-(p2.dy - p1.dy), p2.dx - p1.dx) / (p2 - p1).distance * 14;
        canvas.drawLine(p1 + perp, p2 - perp, paint);
        canvas.drawLine(p1 - perp, p2 + perp, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
