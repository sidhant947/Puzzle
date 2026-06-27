import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class FeatureMatrixCell {
  final String shape;
  final Color color;
  final String symbol;

  FeatureMatrixCell({
    required this.shape,
    required this.color,
    required this.symbol,
  });
}

class FeatureMatrixRecallScreen extends ConsumerStatefulWidget {
  const FeatureMatrixRecallScreen({super.key});

  @override
  ConsumerState<FeatureMatrixRecallScreen> createState() => _FeatureMatrixRecallScreenState();
}

class _FeatureMatrixRecallScreenState extends ConsumerState<FeatureMatrixRecallScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final List<String> _shapes = ['Triangle', 'Circle', 'Square', 'Star'];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];
  final List<String> _symbols = ['◆', '▲', '●', '★'];

  // A 2x2 grid of cells
  late List<List<FeatureMatrixCell>> _grid;
  bool _isStudyMode = true;

  // Query details
  late int _queryRow;
  late int _queryCol;
  late String _queryText;
  late List<dynamic> _options;
  late dynamic _correctAnswer;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _isStudyMode = true;

    // Generate random 2x2 grid cells
    _grid = List.generate(2, (r) {
      return List.generate(2, (c) {
        return FeatureMatrixCell(
          shape: _shapes[_random.nextInt(_shapes.length)],
          color: _colors[_random.nextInt(_colors.length)],
          symbol: _symbols[_random.nextInt(_symbols.length)],
        );
      });
    });

    // Pick a random cell for the query
    _queryRow = _random.nextInt(2);
    _queryCol = _random.nextInt(2);
    final featureIndex = _random.nextInt(3);

    final rowLabel = _queryRow == 0 ? 'Top' : 'Bottom';
    final colLabel = _queryCol == 0 ? 'Left' : 'Right';
    final cellName = '$rowLabel-$colLabel cell';

    final cell = _grid[_queryRow][_queryCol];

    if (featureIndex == 0) {
      _queryText = 'What was the SHAPE of the $cellName?';
      _correctAnswer = cell.shape;
      _options = List.from(_shapes)..shuffle(_random);
    } else if (featureIndex == 1) {
      _queryText = 'What was the COLOR of the $cellName?';
      _correctAnswer = cell.color;
      _options = List.from(_colors)..shuffle(_random);
    } else {
      _queryText = 'What was the SYMBOL inside the $cellName?';
      _correctAnswer = cell.symbol;
      _options = List.from(_symbols)..shuffle(_random);
    }
  }

  void _onAnswer(dynamic answer) {
    if (_isStudyMode || _isGameOver) return;

    if (answer == _correctAnswer) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.snackbarCorrect),
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
          content: Text(l10n.snackbarIncorrectTryNew),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('feature_matrix_recall');
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
      title: L10nGameHelpers.getGameTitle(context, 'feature_matrix_recall'),
      subtitle: _isStudyMode
          ? AppLocalizations.of(context)!.phaseMemorizeDetails
          : L10nGameHelpers.getGameSubtitle(context, 'feature_matrix_recall'),
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
                color: DesignSystem.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: Text(
                '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: DesignSystem.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Center(
                child: _isStudyMode ? _buildStudyView(isDark) : _buildRecallView(isDark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyView(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 2x2 grid
        AspectRatio(
          aspectRatio: 1,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, idx) {
              final r = idx ~/ 2;
              final c = idx % 2;
              final cell = _grid[r][c];
              return Container(
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      r == 0 ? (c == 0 ? 'Top-Left' : 'Top-Right') : (c == 0 ? 'Bottom-Left' : 'Bottom-Right'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white30 : Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildShapeWidget(cell.shape, cell.color, cell.symbol),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              HapticFeedbackUtil.lightImpact();
              setState(() {
                _isStudyMode = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: DesignSystem.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              ),
            ),
            child: Text(
              'I\'M READY',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecallView(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            border: Border.all(
              color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
              width: 1.5,
            ),
          ),
          child: Text(
            _queryText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 40),
        // Options list
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: _options.map((opt) {
            return SizedBox(
              width: 140,
              height: 64,
              child: ElevatedButton(
                onPressed: () => _onAnswer(opt),
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
                child: _buildOptionWidget(opt),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildOptionWidget(dynamic opt) {
    if (opt is Color) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: opt,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
      );
    } else if (opt is String) {
      if (_shapes.contains(opt)) {
        // Just show text label for shape
        return Text(
          opt,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        );
      } else {
        // Symbol
        return Text(
          opt,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        );
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildShapeWidget(String shape, Color color, String symbol) {
    Widget child = Center(
      child: Text(
        symbol,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    switch (shape) {
      case 'Triangle':
        return CustomPaint(
          size: const Size(60, 60),
          painter: _TrianglePainter(color),
          child: Container(
            height: 60,
            alignment: const Alignment(0, 0.4),
            child: Text(
              symbol,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        );
      case 'Circle':
        return Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: child,
        );
      case 'Square':
        return Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        );
      case 'Star':
      default:
        return ClipPath(
          clipper: _StarClipper(),
          child: Container(
            width: 60,
            height: 60,
            color: color,
            child: child,
          ),
        );
    }
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  _TrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final int spikes = 5;
    final double outerRadius = size.width / 2;
    final double innerRadius = size.width / 4;

    double rot = pi / 2 * 3;
    double x = cx;
    double y = cy;
    final double step = pi / spikes;

    path.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
      x = cx + cos(rot) * outerRadius;
      y = cy + sin(rot) * outerRadius;
      path.lineTo(x, y);
      rot += step;

      x = cx + cos(rot) * innerRadius;
      y = cy + sin(rot) * innerRadius;
      path.lineTo(x, y);
      rot += step;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
