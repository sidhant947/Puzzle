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

class BinomialMatchScreen extends ConsumerStatefulWidget {
  const BinomialMatchScreen({super.key});

  @override
  ConsumerState<BinomialMatchScreen> createState() => _BinomialMatchScreenState();
}

class _BinomialMatchScreenState extends ConsumerState<BinomialMatchScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _a;
  late int _b;
  late int _coeffB;
  late int _coeffC;
  late String _quadraticText;
  late String _correctFactored;
  late List<String> _options;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate two non-zero integers in [-6, 6]
    _a = 0;
    _b = 0;
    while (_a == 0) {
      _a = _random.nextInt(13) - 6;
    }
    while (_b == 0) {
      _b = _random.nextInt(13) - 6;
    }

    _coeffB = _a + _b;
    _coeffC = _a * _b;

    _quadraticText = _formatQuadratic(_coeffB, _coeffC);
    _correctFactored = _formatFactored(_a, _b);

    // Generate distractors
    final set = <String>{_correctFactored};
    
    // Add sign variants which are common student mistakes
    set.add(_formatFactored(-_a, _b));
    set.add(_formatFactored(_a, -_b));
    set.add(_formatFactored(-_a, -_b));

    // Fallback if they collapse to the same string (e.g. if a == b)
    while (set.length < 4) {
      int altA = _random.nextInt(13) - 6;
      int altB = _random.nextInt(13) - 6;
      if (altA != 0 && altB != 0) {
        set.add(_formatFactored(altA, altB));
      }
    }

    _options = set.toList()..shuffle(_random);
  }

  String _formatQuadratic(int b, int c) {
    String s = 'x²';
    if (b > 0) {
      s += ' + ${b}x';
    } else if (b < 0) {
      s += ' - ${b.abs()}x';
    }
    
    if (c > 0) {
      s += ' + $c';
    } else if (c < 0) {
      s += ' - ${c.abs()}';
    }
    return s;
  }

  String _formatFactored(int a, int b) {
    final sorted = [a, b]..sort();
    final part1 = sorted[0] >= 0 ? '(x + ${sorted[0]})' : '(x - ${sorted[0].abs()})';
    final part2 = sorted[1] >= 0 ? '(x + ${sorted[1]})' : '(x - ${sorted[1].abs()})';
    return '$part1$part2';
  }

  void _onAnswer(String ans) {
    if (_isGameOver) return;

    if (ans == _correctFactored) {
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
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectCorrectForm(_correctFactored)),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('binomial_match');
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
      title: L10nGameHelpers.getGameTitle(context, 'binomial_match'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'binomial_match'),
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
              const SizedBox(height: 40),
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
                  _quadraticText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: DesignSystem.primary,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Select the correct factored form:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final opt = _options[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SizedBox(
                      height: 55,
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
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
