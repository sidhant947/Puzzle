import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class BaseConversionRunScreen extends ConsumerStatefulWidget {
  const BaseConversionRunScreen({super.key});

  @override
  ConsumerState<BaseConversionRunScreen> createState() => _BaseConversionRunScreenState();
}

class _BaseConversionRunScreenState extends ConsumerState<BaseConversionRunScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _value;
  late int _srcBase;
  late int _dstBase;
  late String _srcValueStr;
  late String _correctAnswer;
  late List<String> _options;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Select two distinct bases from [2, 8, 10, 16]
    final bases = [2, 8, 10, 16];
    _srcBase = bases[_random.nextInt(bases.length)];
    do {
      _dstBase = bases[_random.nextInt(bases.length)];
    } while (_srcBase == _dstBase);

    // Keep numbers smaller for binary to make mental conversion fun and fast
    if (_srcBase == 2 || _dstBase == 2) {
      _value = 5 + _random.nextInt(27); // 5 to 31
    } else {
      _value = 10 + _random.nextInt(89); // 10 to 98
    }

    _srcValueStr = _toBaseString(_value, _srcBase);
    _correctAnswer = _toBaseString(_value, _dstBase);

    // Generate 4 options
    final set = <String>{_correctAnswer};
    while (set.length < 4) {
      int offset = _random.nextInt(16) - 8;
      if (offset != 0) {
        int val = _value + offset;
        if (val > 0) {
          set.add(_toBaseString(val, _dstBase));
        }
      }
    }
    _options = set.toList()..shuffle(_random);
  }

  String _toBaseString(int val, int base) {
    if (base == 2) return val.toRadixString(2).padLeft(5, '0'); // pad binary for neatness
    return val.toRadixString(base).toUpperCase();
  }

  String _baseName(int base) {
    switch (base) {
      case 2: return 'Binary (Base 2)';
      case 8: return 'Octal (Base 8)';
      case 10: return 'Decimal (Base 10)';
      case 16: return 'Hexadecimal (Base 16)';
    }
    return '';
  }

  void _onAnswer(String ans) {
    if (_isGameOver) return;

    if (ans == _correctAnswer) {
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
          content: Text('Incorrect! The correct answer was $_correctAnswer'),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('base_conversion_run');
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
      title: 'BASE CONVERSION',
      subtitle: 'Convert the value from the source base to the destination base.',
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
              const SizedBox(height: 30),
              // Conversion Card
              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'CONVERT FROM: ${_baseName(_srcBase)}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _srcValueStr,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: DesignSystem.primary,
                            letterSpacing: 2,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Icon(Icons.arrow_downward_rounded, size: 28, color: Colors.grey[500]),
                    const SizedBox(height: 16),
                    Text(
                      'CONVERT TO: ${_baseName(_dstBase)}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
    );
  }

  Widget _buildOptionButton(String value, bool isDark) {
    return SizedBox(
      width: 140,
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
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
