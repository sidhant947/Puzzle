import 'dart:async';
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

enum GameShape { circle, square, triangle, star }

class FallingShape {
  final double id;
  final GameShape shape;
  final Color color;
  final String colorName;
  double y; // 0.0 (top) to 1.0 (bottom)
  final double x; // horizontal align -0.8 to 0.8

  FallingShape({
    required this.id,
    required this.shape,
    required this.color,
    required this.colorName,
    this.y = 0.0,
    required this.x,
  });
}

class ShapeShifterScreen extends ConsumerStatefulWidget {
  const ShapeShifterScreen({super.key});

  @override
  ConsumerState<ShapeShifterScreen> createState() => _ShapeShifterScreenState();
}

class _ShapeShifterScreenState extends ConsumerState<ShapeShifterScreen> {
  final Random _random = Random();
  late Timer _gameTimer;
  late Timer _targetTimer;

  // Game state
  late GameShape _targetShape;
  late Color _targetColor;
  late String _targetColorName;

  final List<FallingShape> _fallingShapes = [];
  int _score = 0;
  final int _targetScore = 15;
  bool _isGameOver = false;

  final List<Color> _colors = [
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gameOrange,
    DesignSystem.gamePurple,
  ];

  final List<String> _colorNames = ['BLUE', 'GREEN', 'ORANGE', 'PURPLE'];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _fallingShapes.clear();
    _setRandomTarget();

    // Spawn and update loop
    _gameTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_isGameOver) return;
      _updatePhysics();
    });

    // Change target rule loop every 6 seconds
    _targetTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (_isGameOver) return;
      HapticFeedbackUtil.mediumImpact();
      setState(() {
        _setRandomTarget();
      });
    });
  }

  void _setRandomTarget() {
    _targetShape = GameShape.values[_random.nextInt(GameShape.values.length)];
    final colorIdx = _random.nextInt(_colors.length);
    _targetColor = _colors[colorIdx];
    _targetColorName = _colorNames[colorIdx];
  }

  void _updatePhysics() {
    setState(() {
      // Move existing shapes
      for (var shape in _fallingShapes) {
        shape.y += 0.008; // speed factor
      }

      // Filter out shapes that fell past bottom
      _fallingShapes.removeWhere((shape) {
        if (shape.y >= 1.0) {
          // If a matching shape fell off without being tapped, deduct score
          if (shape.shape == _targetShape && shape.color == _targetColor) {
            _score = max(0, _score - 1);
            HapticFeedbackUtil.lightImpact();
          }
          return true;
        }
        return false;
      });

      // Spawn new shapes periodically
      if (_fallingShapes.length < 5 && _random.nextDouble() < 0.03) {
        final shape = GameShape.values[_random.nextInt(GameShape.values.length)];
        final colorIdx = _random.nextInt(_colors.length);
        _fallingShapes.add(FallingShape(
          id: _random.nextDouble(),
          shape: shape,
          color: _colors[colorIdx],
          colorName: _colorNames[colorIdx],
          x: (_random.nextDouble() * 1.6) - 0.8,
          y: -0.1,
        ));
      }
    });
  }

  void _handleTapShape(FallingShape shape) {
    if (_isGameOver) return;

    final isMatch = (shape.shape == _targetShape && shape.color == _targetColor);

    setState(() {
      _fallingShapes.removeWhere((s) => s.id == shape.id);
      if (isMatch) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      } else {
        _score = max(0, _score - 2);
        HapticFeedbackUtil.error();
      }
    });
  }

  void _onGameComplete() async {
    _gameTimer.cancel();
    _targetTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('shape_shifter');
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
            _startNewGame();
          });
        },
      ),
    );
  }

  IconData _getShapeIcon(GameShape shape) {
    switch (shape) {
      case GameShape.circle:
        return Icons.circle;
      case GameShape.square:
        return Icons.square_rounded;
      case GameShape.triangle:
        return Icons.change_history_rounded;
      case GameShape.star:
        return Icons.star_rounded;
    }
  }

  @override
  void dispose() {
    _gameTimer.cancel();
    _targetTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'shape_shifter'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'shape_shifter'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _gameTimer.cancel();
            _targetTimer.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Target Header Card
          Container(
            margin: const EdgeInsets.all(DesignSystem.spaceMD),
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ACTIVE TARGET',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate,
                          ),
                    ),
                    const SizedBox(height: DesignSystem.spaceXS),
                    Row(
                      children: [
                        Icon(
                          _getShapeIcon(_targetShape),
                          color: _targetColor,
                          size: 36,
                        ),
                        const SizedBox(width: DesignSystem.spaceSM),
                        Text(
                          '$_targetColorName ${_targetShape.name.toUpperCase()}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: _targetColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.spaceMD,
                    vertical: DesignSystem.spaceSM,
                  ),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '$_score / $_targetScore',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: DesignSystem.primary,
                        ),
                  ),
                ),
              ],
            ),
          ),
          // Falling Area
          Expanded(
            child: ClipRect(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: _fallingShapes.map((shape) {
                      final left = (shape.x + 1.0) / 2.0 * (constraints.maxWidth - 60);
                      final top = shape.y * constraints.maxHeight;

                      return Positioned(
                        left: left,
                        top: top,
                        child: GestureDetector(
                          onTapDown: (_) => _handleTapShape(shape),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: shape.color.withValues(alpha: 0.2),
                              shape: shape.shape == GameShape.circle ? BoxShape.circle : BoxShape.rectangle,
                              borderRadius: shape.shape == GameShape.circle
                                  ? null
                                  : BorderRadius.circular(DesignSystem.radiusSM),
                              border: Border.all(color: shape.color, width: 3),
                            ),
                            child: Icon(
                              _getShapeIcon(shape.shape),
                              color: shape.color,
                              size: 32,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
