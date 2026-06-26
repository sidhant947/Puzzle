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

class ColorWordMatchUpScreen extends ConsumerStatefulWidget {
  const ColorWordMatchUpScreen({super.key});

  @override
  ConsumerState<ColorWordMatchUpScreen> createState() => _ColorWordMatchUpScreenState();
}

class _ColorWordMatchUpScreenState extends ConsumerState<ColorWordMatchUpScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 15;
  bool _isGameOver = false;

  // Word collections
  final List<String> _words = ['RED', 'BLUE', 'GREEN', 'YELLOW', 'PURPLE'];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.purple,
  ];

  // Active Rule
  // true = Match meaning (e.g. Word 1 semantic == Word 2 semantic)
  // false = Match ink color (e.g. Word 1 text color == Word 2 text color)
  bool _matchMeaningRule = true;

  late String _word1Text;
  late Color _word1Color;
  late String _word2Text;
  late Color _word2Color;

  late double _progress;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _generatePuzzle();
  }

  void _generatePuzzle() {
    _matchMeaningRule = _random.nextBool();

    final idx1Text = _random.nextInt(_words.length);
    final idx1Color = _random.nextInt(_colors.length);
    _word1Text = _words[idx1Text];
    _word1Color = _colors[idx1Color];

    final idx2Text = _random.nextInt(_words.length);
    final idx2Color = _random.nextInt(_colors.length);
    _word2Text = _words[idx2Text];
    _word2Color = _colors[idx2Color];

    _progress = 1.0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_isGameOver) return;
      setState(() {
        _progress -= 0.01;
        if (_progress <= 0.0) {
          _onAnswer(false, isTimeout: true); // Timeout counts as incorrect
        }
      });
    });
  }

  void _onAnswer(bool userMatch, {bool isTimeout = false}) {
    if (_isGameOver) return;

    _timer?.cancel();

    // Determine correct answer
    bool correctMatch = false;
    if (_matchMeaningRule) {
      // Rule: Do their meanings match?
      correctMatch = (_word1Text == _word2Text);
    } else {
      // Rule: Do their ink colors match?
      correctMatch = (_word1Color == _word2Color);
    }

    final isCorrect = (userMatch == correctMatch) && !isTimeout;

    setState(() {
      if (isCorrect) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          _generatePuzzle();
        }
      } else {
        _score = max(0, _score - 2);
        HapticFeedbackUtil.error();
        _generatePuzzle();
      }
    });
  }

  void _onGameComplete() async {
    _timer?.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('color_word_match_up');
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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'COLOR WORD MATCH',
      subtitle: 'Read the changing rule card carefully. Tap MATCH or NO MATCH.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _timer?.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Timer bar
          LinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(DesignSystem.primary),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'React quickly before the bar drains',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Active Rule Display
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: _matchMeaningRule
                          ? Colors.blue.withOpacity(0.15)
                          : Colors.orange.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      border: Border.all(
                        color: _matchMeaningRule ? Colors.blue : Colors.orange,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      _matchMeaningRule ? 'MATCH MEANINGS' : 'MATCH INK COLORS',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: _matchMeaningRule ? Colors.blue : Colors.orange,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  // The two words
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                          border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                        ),
                        child: Text(
                          _word1Text,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: _word1Color,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                          border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                        ),
                        child: Text(
                          _word2Text,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: _word2Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => _onAnswer(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Colors.grey[850] : Colors.grey[200],
                        foregroundColor: isDark ? Colors.white : Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        ),
                      ),
                      child: const Text('NO MATCH', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => _onAnswer(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DesignSystem.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        ),
                      ),
                      child: const Text('MATCH', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
