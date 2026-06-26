import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class DelayedMatchSampleScreen extends ConsumerStatefulWidget {
  const DelayedMatchSampleScreen({super.key});

  @override
  ConsumerState<DelayedMatchSampleScreen> createState() => _DelayedMatchSampleScreenState();
}

class _DelayedMatchSampleScreenState extends ConsumerState<DelayedMatchSampleScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Game Phases:
  // 1. Study the target shape
  // 2. Math distraction phase (solve 2 basic math questions)
  // 3. Selection phase (select the original target shape from similar rotated/styled options)
  int _gamePhase = 1; // 1 = Study, 2 = Distract, 3 = Match

  // Shapes pool
  final List<List<Offset>> _symbolShapes = [
    // Diamond path points
    [const Offset(0.5, 0.1), const Offset(0.9, 0.5), const Offset(0.5, 0.9), const Offset(0.1, 0.5)],
    // Arrow-like shape
    [const Offset(0.2, 0.2), const Offset(0.8, 0.2), const Offset(0.5, 0.8), const Offset(0.5, 0.5)],
    // Butterfly path
    [const Offset(0.1, 0.1), const Offset(0.9, 0.9), const Offset(0.9, 0.1), const Offset(0.1, 0.9)],
    // Shield path
    [const Offset(0.2, 0.1), const Offset(0.8, 0.1), const Offset(0.9, 0.5), const Offset(0.5, 0.9), const Offset(0.1, 0.5)],
    // Cross path
    [const Offset(0.4, 0.1), const Offset(0.6, 0.1), const Offset(0.6, 0.9), const Offset(0.4, 0.9), const Offset(0.4, 0.1)],
  ];

  late int _targetShapeIndex;
  late double _targetAngle;
  late Color _targetColor;

  // Distraction data
  late int _distractNum1;
  late int _distractNum2;
  late int _distractCorrect;
  late List<int> _distractOptions;
  int _distractCount = 0;

  // Match options data
  late List<Map<String, dynamic>> _matchOptions;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _gamePhase = 1;
    _distractCount = 0;

    // Generate Target Properties
    _targetShapeIndex = _random.nextInt(_symbolShapes.length);
    _targetAngle = _random.nextDouble() * pi * 2; // Random rotation angle
    _targetColor = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ][_random.nextInt(5)];

    _generateDistractorQuestion();
  }

  void _generateDistractorQuestion() {
    _distractNum1 = _random.nextInt(12) + 2;
    _distractNum2 = _random.nextInt(12) + 2;
    _distractCorrect = _distractNum1 + _distractNum2;
    _distractOptions = [
      _distractCorrect,
      _distractCorrect + _random.nextInt(4) + 1,
      _distractCorrect - _random.nextInt(3) - 1,
    ]..shuffle(_random);
  }

  void _onDistractAnswer(int ans) {
    if (ans == _distractCorrect) {
      HapticFeedbackUtil.success();
      _distractCount++;
      if (_distractCount >= 2) {
        // Switch to Match phase
        _generateMatchOptions();
        setState(() {
          _gamePhase = 3;
        });
      } else {
        setState(() {
          _generateDistractorQuestion();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      // Restart math step
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect sum! Try another one.')),
      );
      setState(() {
        _generateDistractorQuestion();
      });
    }
  }

  void _generateMatchOptions() {
    // We want 4 options:
    // Option 1: The correct one (original index, angle, and color)
    // Option 2: Same shape, different color
    // Option 3: Same shape, rotated differently (e.g. angle + pi/2)
    // Option 4: Different shape, same color
    final correctColor = _targetColor;
    final altColor = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ].firstWhere((c) => c != correctColor);

    final altShapeIdx = (_targetShapeIndex + 1) % _symbolShapes.length;

    _matchOptions = [
      {
        'shapeIdx': _targetShapeIndex,
        'angle': _targetAngle,
        'color': correctColor,
        'isCorrect': true,
      },
      {
        'shapeIdx': _targetShapeIndex,
        'angle': _targetAngle,
        'color': altColor,
        'isCorrect': false,
      },
      {
        'shapeIdx': _targetShapeIndex,
        'angle': _targetAngle + pi / 2,
        'color': correctColor,
        'isCorrect': false,
      },
      {
        'shapeIdx': altShapeIdx,
        'angle': _targetAngle,
        'color': correctColor,
        'isCorrect': false,
      },
    ]..shuffle(_random);
  }

  void _onMatchSelected(bool isCorrect) {
    if (isCorrect) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Correct match!'),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong match! Study a new shape.'),
          backgroundColor: DesignSystem.gameRed,
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('delayed_match_sample');
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
            _isGameOver = false;
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
      title: 'DELAYED MATCH',
      subtitle: _gamePhase == 1
          ? 'Memorize the target shape, color, and rotation angle.'
          : (_gamePhase == 2
              ? 'Solve subtraction/addition to unlock matching selection.'
              : 'Choose the exact target symbol from the original study phase.'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Board
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                'Score: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: _buildPhaseView(isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseView(bool isDark) {
    if (_gamePhase == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'STUDY TARGET',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          const SizedBox(height: 24),
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(120, 120),
                painter: _SymbolShapePainter(
                  points: _symbolShapes[_targetShapeIndex],
                  angle: _targetAngle,
                  color: _targetColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                HapticFeedbackUtil.lightImpact();
                setState(() {
                  _gamePhase = 2;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignSystem.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                ),
              ),
              child: const Text(
                'I\'VE MEMORIZED IT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      );
    } else if (_gamePhase == 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'DISTRACTION STAGE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const SizedBox(height: 12),
          Text(
            'Solve math problems: Progress ${_distractCount}/2',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Text(
              '$_distractNum1 + $_distractNum2 = ?',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _distractOptions.map((opt) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 90,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _onDistractAnswer(opt),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                      side: BorderSide(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    child: Text(
                      '$opt',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    } else {
      // Phase 3 Selection match
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'CHOOSE THE TARGET SYMBOL',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, idx) {
                final option = _matchOptions[idx];
                return GestureDetector(
                  onTap: () => _onMatchSelected(option['isCorrect'] as bool),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: CustomPaint(
                        size: const Size(80, 80),
                        painter: _SymbolShapePainter(
                          points: _symbolShapes[option['shapeIdx'] as int],
                          angle: option['angle'] as double,
                          color: option['color'] as Color,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}

class _SymbolShapePainter extends CustomPainter {
  final List<Offset> points;
  final double angle;
  final Color color;

  _SymbolShapePainter({
    required this.points,
    required this.angle,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.save();
    // Translate origin to center of shape bounding container
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);

    final path = Path();
    if (points.isNotEmpty) {
      final startOffset = Offset(
        (points[0].dx - 0.5) * size.width,
        (points[0].dy - 0.5) * size.height,
      );
      path.moveTo(startOffset.dx, startOffset.dy);

      for (int i = 1; i < points.length; i++) {
        final pt = Offset(
          (points[i].dx - 0.5) * size.width,
          (points[i].dy - 0.5) * size.height,
        );
        path.lineTo(pt.dx, pt.dy);
      }
      path.close();
    }

    canvas.drawPath(path, paint);

    // Draw some outline details
    final strokePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, strokePaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
