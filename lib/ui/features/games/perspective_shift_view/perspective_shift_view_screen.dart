import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class PerspectiveShiftViewScreen extends ConsumerStatefulWidget {
  const PerspectiveShiftViewScreen({super.key});

  @override
  ConsumerState<PerspectiveShiftViewScreen> createState() => _PerspectiveShiftViewScreenState();
}

class _PerspectiveShiftViewScreenState extends ConsumerState<PerspectiveShiftViewScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Camera rotation angle (radians) user can control to view the 3D space
  double _cameraAngle = 0.0;

  // Secret letter shape coordinates in 3D
  // If viewed from camera angle = targetAngle, the blocks align to form the letter.
  late List<Point<int>> _blockOffsets;
  late double _targetAngle;
  late String _correctLetter;
  late List<String> _options;

  final List<String> _lettersPool = ['L', 'T', 'H', 'C', 'E'];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Select random correct letter
    _correctLetter = _lettersPool[_random.nextInt(_lettersPool.length)];

    // Define 3D block coordinate offsets for spelling the target letter
    if (_correctLetter == 'L') {
      _blockOffsets = [
        const Point(0, 0), const Point(0, 1), const Point(0, 2), const Point(1, 2)
      ];
    } else if (_correctLetter == 'T') {
      _blockOffsets = [
        const Point(0, 0), const Point(1, 0), const Point(2, 0), const Point(1, 1), const Point(1, 2)
      ];
    } else if (_correctLetter == 'H') {
      _blockOffsets = [
        const Point(0, 0), const Point(0, 1), const Point(0, 2),
        const Point(1, 1),
        const Point(2, 0), const Point(2, 1), const Point(2, 2)
      ];
    } else if (_correctLetter == 'C') {
      _blockOffsets = [
        const Point(0, 0), const Point(0, 1), const Point(0, 2),
        const Point(1, 0), const Point(1, 2)
      ];
    } else {
      // E
      _blockOffsets = [
        const Point(0, 0), const Point(0, 1), const Point(0, 2),
        const Point(1, 0), const Point(1, 1), const Point(1, 2),
        const Point(2, 0), const Point(2, 2)
      ];
    }

    // Set a random target angle (e.g. either 0, 90, 180, or 270 degrees in radians)
    _targetAngle = [0.0, pi / 2, pi, pi * 1.5][_random.nextInt(4)];

    // Reset slider angle
    _cameraAngle = 0.0;

    // Distractor option letters
    _options = [_correctLetter];
    final distractors = _lettersPool.where((element) => element != _correctLetter).toList()..shuffle(_random);
    _options.add(distractors[0]);
    _options.add(distractors[1]);
    _options.shuffle(_random);
  }

  void _onAnswer(String chosen) {
    // Check if player rotated close to target alignment angle AND chose correct letter
    final angleDiff = (_cameraAngle - _targetAngle).abs();
    
    // Accept alignment if within ~15 degrees (0.26 radians) of target rotation perspective
    final bool isAligned = angleDiff < 0.28 || (2 * pi - angleDiff) < 0.28;

    if (isAligned && chosen == _correctLetter) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Aligned and correctly identified!'),
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
      String failMsg = 'Incorrect!';
      if (!isAligned) {
        failMsg = 'Incorrect perspective angle rotation! Try aligning them first.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failMsg),
          backgroundColor: DesignSystem.gameRed,
          duration: const Duration(milliseconds: 1500),
        ),
      );
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('perspective_shift_view');
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
      title: 'PERSPECTIVE SHIFT',
      subtitle: 'Rotate the camera view using the slider until the floating 3D block cluster aligns to spell a letter, then identify it.',
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
            // Score Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: DesignSystem.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                'Aligned: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            // Custom Painter drawing block projection space
            Expanded(
              child: Center(
                child: Container(
                  width: 255,
                  height: 255,
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  child: CustomPaint(
                    size: const Size(200, 200),
                    painter: _PerspectiveBlockPainter(
                      blockOffsets: _blockOffsets,
                      cameraAngle: _cameraAngle,
                      targetAngle: _targetAngle,
                      isDark: isDark,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Camera Rotation Slider controls
            Card(
              elevation: 0,
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                side: BorderSide(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.videocam_rounded, size: 20, color: Colors.grey),
                    const SizedBox(width: 8),
                    const Text('ROTATE VIEW', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                    Expanded(
                      child: Slider(
                        value: _cameraAngle,
                        min: 0.0,
                        max: pi * 2,
                        onChanged: (val) {
                          setState(() {
                            _cameraAngle = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Multi-choice letters options
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: _options.map((opt) {
                return SizedBox(
                  width: 100,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => _onAnswer(opt),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                      foregroundColor: isDark ? Colors.white : Colors.black87,
                      side: BorderSide(
                        color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    child: Text(
                      opt,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _PerspectiveBlockPainter extends CustomPainter {
  final List<Point<int>> blockOffsets;
  final double cameraAngle;
  final double targetAngle;
  final bool isDark;

  _PerspectiveBlockPainter({
    required this.blockOffsets,
    required this.cameraAngle,
    required this.targetAngle,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;

    final blockPaint = Paint()
      ..color = DesignSystem.primary
      ..style = PaintingStyle.fill;

    final blockOutline = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw isometric grid guidelines in background
    final guidePaint = Paint()
      ..color = isDark ? Colors.white10 : Colors.black12
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawCircle(Offset(cx, cy), size.width * 0.4, guidePaint);

    // Apply rotation transformations based on camera perspective
    canvas.save();
    canvas.translate(cx, cy);
    canvas.rotate(cameraAngle - targetAngle); // Aligns perfectly when cameraAngle == targetAngle

    // Render individual blocks
    // Grid size coordinates scaled around the origin
    final double scale = 36.0;
    for (final pt in blockOffsets) {
      final double bx = (pt.x - 1.0) * scale;
      final double by = (pt.y - 1.0) * scale;

      final rect = Rect.fromLTWH(bx - (scale / 2) + 2, by - (scale / 2) + 2, scale - 4, scale - 4);
      canvas.drawRect(rect, blockPaint);
      canvas.drawRect(rect, blockOutline);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
