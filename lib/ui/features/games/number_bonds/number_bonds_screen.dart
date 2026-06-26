import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class NumberBondsScreen extends ConsumerStatefulWidget {
  const NumberBondsScreen({super.key});

  @override
  ConsumerState<NumberBondsScreen> createState() => _NumberBondsScreenState();
}

class _NumberBondsScreenState extends ConsumerState<NumberBondsScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _v, _l, _r, _ll, _lr, _rl, _rr;
  late String _hiddenNodeKey; // 'V', 'L', 'R', 'LL', 'LR', 'RL', 'RR'
  late int _correctValue;
  late List<int> _options;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate hierarchical number bonds
    _v = 40 + _random.nextInt(60); // 40 to 99
    
    // Split V into L and R
    _l = 15 + _random.nextInt(_v - 30);
    _r = _v - _l;

    // Split L into LL and LR
    _ll = 5 + _random.nextInt(_l - 10);
    _lr = _l - _ll;

    // Split R into RL and RR
    _rl = 5 + _random.nextInt(_r - 10);
    _rr = _r - _rl;

    // Pick a node to hide
    const keys = ['V', 'L', 'R', 'LL', 'LR', 'RL', 'RR'];
    _hiddenNodeKey = keys[_random.nextInt(keys.length)];

    switch (_hiddenNodeKey) {
      case 'V': _correctValue = _v; break;
      case 'L': _correctValue = _l; break;
      case 'R': _correctValue = _r; break;
      case 'LL': _correctValue = _ll; break;
      case 'LR': _correctValue = _lr; break;
      case 'RL': _correctValue = _rl; break;
      case 'RR': _correctValue = _rr; break;
    }

    // Generate 4 options
    final set = <int>{_correctValue};
    while (set.length < 4) {
      int offset = _random.nextInt(16) - 8;
      if (offset != 0) {
        int val = _correctValue + offset;
        if (val > 0) {
          set.add(val);
        }
      }
    }
    _options = set.toList()..shuffle(_random);
  }

  void _onAnswer(int ans) {
    if (_isGameOver) return;

    if (ans == _correctValue) {
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
          content: Text('Incorrect! The missing value was $_correctValue'),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
      setState(() {
        _generatePuzzle();
      });
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('number_bonds');
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
      title: 'NUMBER BONDS',
      subtitle: 'Calculate the missing value in the number bond hierarchy.',
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
        child: SingleChildScrollView(
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
                // Number Bond Hierarchy Canvas & Stack
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final w = constraints.maxWidth;
                      final h = constraints.maxHeight;

                      // Define Node Positions
                      final root = Offset(w / 2, 45);
                      final left = Offset(w / 4, 125);
                      final right = Offset(3 * w / 4, 125);

                      final ll = Offset(w / 8, 215);
                      final lr = Offset(3 * w / 8, 215);
                      final rl = Offset(5 * w / 8, 215);
                      final rr = Offset(7 * w / 8, 215);

                      return Stack(
                        children: [
                          // Line Connections
                          CustomPaint(
                            size: Size(w, h),
                            painter: BondLinesPainter(
                              connections: [
                                Pair(root, left),
                                Pair(root, right),
                                Pair(left, ll),
                                Pair(left, lr),
                                Pair(right, rl),
                                Pair(right, rr),
                              ],
                              color: isDark ? Colors.white24 : Colors.black12,
                            ),
                          ),
                          // Nodes
                          _buildNode(root, 'V', _v, isDark),
                          _buildNode(left, 'L', _l, isDark),
                          _buildNode(right, 'R', _r, isDark),
                          _buildNode(ll, 'LL', _ll, isDark),
                          _buildNode(lr, 'LR', _lr, isDark),
                          _buildNode(rl, 'RL', _rl, isDark),
                          _buildNode(rr, 'RR', _rr, isDark),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Choose the correct value for the missing node (?)',
                  style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                // Options list
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: _options.map((value) => _buildOptionButton(value, isDark)).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNode(Offset pos, String key, int val, bool isDark) {
    final isHidden = _hiddenNodeKey == key;
    return Positioned(
      left: pos.dx - 26,
      top: pos.dy - 26,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: isHidden
              ? DesignSystem.gameOrange.withOpacity(0.2)
              : (isDark ? Colors.grey[850] : Colors.grey[100]),
          shape: BoxShape.circle,
          border: Border.all(
            color: isHidden
                ? DesignSystem.gameOrange
                : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
            width: 2.5,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          isHidden ? '?' : '$val',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isHidden
                ? DesignSystem.gameOrange
                : (isDark ? Colors.white : Colors.black87),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(int value, bool isDark) {
    return SizedBox(
      width: 100,
      height: 55,
      child: ElevatedButton(
        onPressed: () => _onAnswer(value),
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
          '$value',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Pair<T> {
  final T first;
  final T second;
  Pair(this.first, this.second);
}

class BondLinesPainter extends CustomPainter {
  final List<Pair<Offset>> connections;
  final Color color;

  BondLinesPainter({required this.connections, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    for (final conn in connections) {
      canvas.drawLine(conn.first, conn.second, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
