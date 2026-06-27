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

class PercentageShoppingScreen extends ConsumerStatefulWidget {
  const PercentageShoppingScreen({super.key});

  @override
  ConsumerState<PercentageShoppingScreen> createState() => _PercentageShoppingScreenState();
}

class _PercentageShoppingScreenState extends ConsumerState<PercentageShoppingScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late String _itemName;
  late IconData _itemIcon;
  late int _originalPrice;
  late int _discountPercentage;
  late int _finalPrice;
  
  // Task Type: 0 = Calculate Final Price, 1 = Calculate Discount %
  late int _taskType;
  late String _questionText;
  late String _displayLabel;
  late double _correctAnswer;
  late String _suffix;
  late List<double> _options;

  final List<Map<String, dynamic>> _items = [
    {'name': 'Leather Jacket', 'icon': Icons.checkroom_rounded, 'prices': [80, 120, 160, 200]},
    {'name': 'Wireless Headphones', 'icon': Icons.headphones_rounded, 'prices': [60, 80, 100, 150]},
    {'name': 'Running Shoes', 'icon': Icons.directions_run_rounded, 'prices': [50, 80, 100, 120]},
    {'name': 'Smart Watch', 'icon': Icons.watch_rounded, 'prices': [120, 150, 200, 250]},
    {'name': 'Backpack', 'icon': Icons.backpack_rounded, 'prices': [40, 60, 80, 100]},
    {'name': 'Coffee Maker', 'icon': Icons.coffee_maker_rounded, 'prices': [60, 80, 100, 120]},
  ];

  final List<int> _percentages = [10, 15, 20, 25, 30, 40, 50];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final item = _items[_random.nextInt(_items.length)];
    _itemName = item['name'];
    _itemIcon = item['icon'];
    
    final pricesList = item['prices'] as List<int>;
    _originalPrice = pricesList[_random.nextInt(pricesList.length)];
    _discountPercentage = _percentages[_random.nextInt(_percentages.length)];
    
    // We compute final price. Make sure we avoid non-integer prices to keep it clean.
    // finalPrice = originalPrice * (100 - discountPercentage) / 100
    // To ensure finalPrice is integer, let's adjust percentages or original prices:
    // If originalPrice is 150 and percentage is 10 -> 15. final is 135 (int).
    // If percentage is 15% of 80 -> 12. final is 68 (int).
    // Let's loop until originalPrice * discountPercentage is divisible by 100
    while ((_originalPrice * _discountPercentage) % 100 != 0) {
      _originalPrice = pricesList[_random.nextInt(pricesList.length)];
      _discountPercentage = _percentages[_random.nextInt(_percentages.length)];
    }

    _finalPrice = (_originalPrice * (100 - _discountPercentage) ~/ 100);

    _taskType = _random.nextInt(2); // 0 or 1

    if (_taskType == 0) {
      // Calculate final price
      _questionText = 'What is the final price of the $_itemName?';
      _displayLabel = 'Original: \$$_originalPrice\nDiscount: $_discountPercentage% OFF';
      _correctAnswer = _finalPrice.toDouble();
      _suffix = '\$';
      
      final set = <double>{_correctAnswer};
      while (set.length < 4) {
        int offset = (_random.nextInt(5) + 1) * 5;
        double altVal = _correctAnswer + (_random.nextBool() ? offset : -offset);
        if (altVal > 0 && altVal < _originalPrice) {
          set.add(altVal);
        }
      }
      _options = set.toList()..shuffle(_random);
    } else {
      // Calculate discount percentage
      _questionText = 'What was the discount percentage applied?';
      _displayLabel = 'Original Price: \$$_originalPrice\nFinal Price: \$$_finalPrice';
      _correctAnswer = _discountPercentage.toDouble();
      _suffix = '%';

      final set = <double>{_correctAnswer};
      while (set.length < 4) {
        int altPct = _percentages[_random.nextInt(_percentages.length)];
        set.add(altPct.toDouble());
      }
      _options = set.toList()..shuffle(_random);
    }
  }

  void _onAnswer(double ans) {
    if (_isGameOver) return;

    if ((ans - _correctAnswer).abs() < 0.01) {
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
      final correctStr = _taskType == 0 ? '\$${_correctAnswer.toInt()}' : '${_correctAnswer.toInt()}%';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectCorrectValue(correctStr)),
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
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('percentage_shopping');
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
      title: L10nGameHelpers.getGameTitle(context, 'percentage_shopping'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'percentage_shopping'),
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
              const SizedBox(height: 30),
              // Item icon & details
              CircleAvatar(
                radius: 40,
                backgroundColor: DesignSystem.primary.withValues(alpha: 0.1),
                child: Icon(_itemIcon, size: 40, color: DesignSystem.primary),
              ),
              const SizedBox(height: 16),
              Text(
                _itemName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
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
                      _questionText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _displayLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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

  Widget _buildOptionButton(double value, bool isDark) {
    final text = _suffix == '\$' ? '\$${value.toInt()}' : '${value.toInt()}%';
    return SizedBox(
      width: 120,
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
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
