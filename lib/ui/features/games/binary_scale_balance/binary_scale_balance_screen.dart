import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class BinaryScaleBalanceScreen extends ConsumerStatefulWidget {
  const BinaryScaleBalanceScreen({super.key});

  @override
  ConsumerState<BinaryScaleBalanceScreen> createState() => _BinaryScaleBalanceScreenState();
}

class _BinaryScaleBalanceScreenState extends ConsumerState<BinaryScaleBalanceScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _targetWeight;
  final List<int> _binaryWeights = [32, 16, 8, 4, 2, 1];
  final Set<int> _selectedWeights = {};

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate a target weight between 5 and 63
    _targetWeight = 5 + _random.nextInt(59);
    _selectedWeights.clear();
  }

  int get _currentWeight => _selectedWeights.fold(0, (sum, w) => sum + w);

  void _toggleWeight(int w) {
    if (_isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_selectedWeights.contains(w)) {
        _selectedWeights.remove(w);
      } else {
        _selectedWeights.add(w);
      }
    });
  }

  void _onSubmit() {
    if (_isGameOver) return;

    if (_currentWeight == _targetWeight) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    } else {
      HapticFeedbackUtil.error();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Scale is not balanced! Current weight is $_currentWeight, Target is $_targetWeight.'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('binary_scale_balance');
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
      title: 'BINARY SCALE BALANCE',
      subtitle: 'Balance the scale by selecting powers of two (binary weights) that sum to the target.',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(height: 20),
              // Balance scale visualizer
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: CustomPaint(
                  painter: ScalePainter(
                    targetWeight: _targetWeight,
                    currentWeight: _currentWeight,
                    isDark: isDark,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Targets text row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('TARGET', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
                      Text(
                        '$_targetWeight',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: DesignSystem.gameOrange),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('CURRENT', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
                      Text(
                        '$_currentWeight',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: _currentWeight == _targetWeight ? Colors.green : DesignSystem.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Toggle Weight Blocks
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'BINARY WEIGHT BLOCKS:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: _binaryWeights.map((w) {
                  final isSelected = _selectedWeights.contains(w);
                  return GestureDetector(
                    onTap: () => _toggleWeight(w),
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? DesignSystem.primary
                            : (isDark ? Colors.grey[850] : Colors.grey[200]),
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        border: Border.all(
                          color: isSelected ? Colors.white : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                          width: 2,
                        ),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(color: DesignSystem.primary.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '$w',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 35),
              // Submit button
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _currentWeight == _targetWeight ? Colors.green : DesignSystem.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                  ),
                  child: const Text(
                    'BALANCED?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScalePainter extends CustomPainter {
  final int targetWeight;
  final int currentWeight;
  final bool isDark;

  ScalePainter({required this.targetWeight, required this.currentWeight, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 + 10);
    final themeColor = isDark ? Colors.white70 : Colors.black87;

    // Draw base stand
    final standPaint = Paint()
      ..color = themeColor
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    // Vertical stand
    canvas.drawLine(center, Offset(center.dx, center.dy + 60), standPaint);
    // Foot of the stand
    canvas.drawLine(Offset(center.dx - 30, center.dy + 60), Offset(center.dx + 30, center.dy + 60), standPaint);

    // Calculate rotation angle based on weight difference
    int diff = currentWeight - targetWeight;
    double angle = 0.0;
    if (diff != 0) {
      // Clamp tilt angle to [-0.2, 0.2] radians
      angle = (diff > 0 ? 1 : -1) * 0.15;
    }

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);

    // Draw beam
    final beamPaint = Paint()
      ..color = Colors.amber[700]!
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(-100, 0), const Offset(100, 0), beamPaint);

    // Left pan hanger & pan (Target side)
    const leftEnd = Offset(-100, 0);
    _drawPan(canvas, leftEnd, Colors.orangeAccent);

    // Right pan hanger & pan (User side)
    const rightEnd = Offset(100, 0);
    _drawPan(canvas, rightEnd, DesignSystem.primary);

    canvas.restore();
  }

  void _drawPan(Canvas canvas, Offset hookPoint, Color color) {
    // Hanger lines
    final hangerPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0;
    canvas.drawLine(hookPoint, Offset(hookPoint.dx - 22, hookPoint.dy + 45), hangerPaint);
    canvas.drawLine(hookPoint, Offset(hookPoint.dx + 22, hookPoint.dy + 45), hangerPaint);

    // Pan plate
    final platePaint = Paint()
      ..color = color
      ..strokeWidth = 4.0;
    canvas.drawLine(Offset(hookPoint.dx - 30, hookPoint.dy + 45), Offset(hookPoint.dx + 30, hookPoint.dy + 45), platePaint);
  }

  @override
  bool shouldRepaint(covariant ScalePainter oldDelegate) => true;
}
