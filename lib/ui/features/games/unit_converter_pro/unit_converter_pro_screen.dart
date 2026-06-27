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

class ConversionTask {
  final String question;
  final double answer;
  final String unit;
  final List<double> options;

  ConversionTask({
    required this.question,
    required this.answer,
    required this.unit,
    required this.options,
  });
}

class UnitConverterProScreen extends ConsumerStatefulWidget {
  const UnitConverterProScreen({super.key});

  @override
  ConsumerState<UnitConverterProScreen> createState() => _UnitConverterProScreenState();
}

class _UnitConverterProScreenState extends ConsumerState<UnitConverterProScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late ConversionTask _currentTask;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    int category = _random.nextInt(5);
    String question = '';
    double answer = 0.0;
    String unit = '';

    switch (category) {
      case 0: // Length
        final sub = _random.nextInt(3);
        if (sub == 0) {
          int m = 2 + _random.nextInt(15);
          question = 'Convert $m meters to centimeters';
          answer = (m * 100).toDouble();
          unit = 'cm';
        } else if (sub == 1) {
          int km = 1 + _random.nextInt(8);
          question = 'Convert $km kilometers to meters';
          answer = (km * 1000).toDouble();
          unit = 'm';
        } else {
          int ft = 2 + _random.nextInt(9);
          question = 'Convert $ft feet to inches';
          answer = (ft * 12).toDouble();
          unit = 'in';
        }
        break;
      case 1: // Time
        final sub = _random.nextInt(3);
        if (sub == 0) {
          int hrs = 1 + _random.nextInt(5);
          question = 'Convert $hrs hours to minutes';
          answer = (hrs * 60).toDouble();
          unit = 'min';
        } else if (sub == 1) {
          int mins = 2 + _random.nextInt(9);
          question = 'Convert $mins minutes to seconds';
          answer = (mins * 60).toDouble();
          unit = 'sec';
        } else {
          int days = 1 + _random.nextInt(4);
          question = 'Convert $days days to hours';
          answer = (days * 24).toDouble();
          unit = 'hrs';
        }
        break;
      case 2: // Weight
        final sub = _random.nextInt(2);
        if (sub == 0) {
          int kg = 1 + _random.nextInt(8);
          question = 'Convert $kg kilograms to grams';
          answer = (kg * 1000).toDouble();
          unit = 'g';
        } else {
          int lbs = 1 + _random.nextInt(6);
          question = 'Convert $lbs pounds to ounces\n(1 lb = 16 oz)';
          answer = (lbs * 16).toDouble();
          unit = 'oz';
        }
        break;
      case 3: // Volume
        final sub = _random.nextInt(2);
        if (sub == 0) {
          int l = 1 + _random.nextInt(5);
          question = 'Convert $l liters to milliliters';
          answer = (l * 1000).toDouble();
          unit = 'mL';
        } else {
          int gal = 1 + _random.nextInt(5);
          question = 'Convert $gal gallons to quarts\n(1 gal = 4 qt)';
          answer = (gal * 4).toDouble();
          unit = 'qt';
        }
        break;
      case 4: // Temperature
        final temps = [
          {'c': 0, 'f': 32},
          {'c': 10, 'f': 50},
          {'c': 20, 'f': 68},
          {'c': 30, 'f': 86},
          {'c': 40, 'f': 104},
          {'c': 100, 'f': 212},
        ];
        final temp = temps[_random.nextInt(temps.length)];
        if (_random.nextBool()) {
          question = 'Convert ${temp['c']}°C to Fahrenheit';
          answer = temp['f']!.toDouble();
          unit = '°F';
        } else {
          question = 'Convert ${temp['f']}°F to Celsius';
          answer = temp['c']!.toDouble();
          unit = '°C';
        }
        break;
    }

    final set = <double>{answer};
    while (set.length < 4) {
      double offset;
      if (answer >= 1000) {
        offset = ((_random.nextInt(5) + 1) * 500).toDouble();
      } else if (answer >= 100) {
        offset = ((_random.nextInt(5) + 1) * 50).toDouble();
      } else if (answer >= 30) {
        offset = ((_random.nextInt(5) + 1) * 6).toDouble();
      } else {
        offset = (_random.nextInt(5) + 1).toDouble();
      }
      double alt = answer + (_random.nextBool() ? offset : -offset);
      if (alt >= 0) {
        set.add(alt);
      }
    }

    _currentTask = ConversionTask(
      question: question,
      answer: answer,
      unit: unit,
      options: set.toList()..shuffle(_random),
    );
  }

  void _onAnswer(double ans) {
    if (_isGameOver) return;

    if ((ans - _currentTask.answer).abs() < 0.01) {
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
          content: Text(AppLocalizations.of(context)!.snackbarIncorrectCorrectAnswer('${_currentTask.answer.toInt()} ${_currentTask.unit}')),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('unit_converter_pro');
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
      title: L10nGameHelpers.getGameTitle(context, 'unit_converter_pro'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'unit_converter_pro'),
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
                child: Text(
                  _currentTask.question,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: DesignSystem.primary,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _currentTask.options.map((value) => _buildOptionButton(value, isDark)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(double value, bool isDark) {
    final text = '${value.toInt()} ${_currentTask.unit}';
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
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
