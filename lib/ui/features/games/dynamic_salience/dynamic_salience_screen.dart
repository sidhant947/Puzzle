import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class SalientShape {
  final double id;
  final Offset basePosition;
  final double amplitude;
  final double speed;
  final Color color;
  final bool isTarget;

  SalientShape({
    required this.id,
    required this.basePosition,
    required this.amplitude,
    required this.speed,
    required this.color,
    required this.isTarget,
  });
}

class DynamicSalienceScreen extends ConsumerStatefulWidget {
  const DynamicSalienceScreen({super.key});

  @override
  ConsumerState<DynamicSalienceScreen> createState() => _DynamicSalienceScreenState();
}

class _DynamicSalienceScreenState extends ConsumerState<DynamicSalienceScreen> with SingleTickerProviderStateMixin {
  final Random _random = Random();
  late AnimationController _animationController;

  List<SalientShape> _shapes = [];
  int _score = 0;
  final int _targetScore = 10;
  bool _isGameOver = false;

  final List<Color> _colors = [
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gameOrange,
    DesignSystem.gamePurple,
    DesignSystem.gameRose,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _generateLevel();
  }

  void _generateLevel() {
    _shapes.clear();
    final int numShapes = 8;

    // Distractors share high-frequency shaking speed
    final commonSpeed = 6.0 + _random.nextDouble() * 4.0;
    // The target has a distinctly slower shaking dynamics speed (e.g. half the speed)
    final targetSpeed = commonSpeed * 0.45;

    final targetIndex = _random.nextInt(numShapes);

    for (int i = 0; i < numShapes; i++) {
      final isTarget = (i == targetIndex);
      final double angle = (i / numShapes) * 2 * pi;
      // Position shapes in a circle layout
      final double r = 100.0;
      final xOffset = cos(angle) * r;
      final yOffset = sin(angle) * r;

      _shapes.add(SalientShape(
        id: _random.nextDouble(),
        basePosition: Offset(xOffset, yOffset),
        amplitude: 12.0 + _random.nextDouble() * 8.0,
        speed: isTarget ? targetSpeed : commonSpeed,
        color: _colors[i % _colors.length],
        isTarget: isTarget,
      ));
    }
  }

  void _onTapShape(SalientShape shape) {
    if (_isGameOver) return;

    if (shape.isTarget) {
      setState(() {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          _generateLevel();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      setState(() {
        _score = max(0, _score - 2);
        _generateLevel();
      });
    }
  }

  void _onGameComplete() async {
    _animationController.stop();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('dynamic_salience');
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
            _animationController.repeat();
            _startNewGame();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'DYNAMIC SALIENCE',
      subtitle: 'Identify and tap the target shape that oscillates at a different frequency/speed.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Focal search on oscillations',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

                      return AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          final timeVal = _animationController.value * 2 * pi;

                          return Stack(
                            children: _shapes.map((shape) {
                              // Compute oscillatory offset displacement based on individual frequency parameters
                              final double dx = sin(timeVal * shape.speed) * shape.amplitude;
                              final double dy = cos(timeVal * shape.speed) * shape.amplitude;

                              final left = center.dx + shape.basePosition.dx + dx - 24;
                              final top = center.dy + shape.basePosition.dy + dy - 24;

                              return Positioned(
                                left: left,
                                top: top,
                                width: 48,
                                height: 48,
                                child: GestureDetector(
                                  onTapDown: (_) => _onTapShape(shape),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: shape.color.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                      border: Border.all(color: shape.color, width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                          color: shape.color.withOpacity(0.15),
                                          blurRadius: 10,
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.flare_rounded,
                                      color: shape.color,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
