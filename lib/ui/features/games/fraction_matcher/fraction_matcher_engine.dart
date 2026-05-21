import 'dart:math';

enum OptionType { decimal, percentage, visual }

class FractionOption {
  final OptionType type;
  final String text;       // Used for decimal / percentage, e.g. "0.25" or "25%"
  final int visualSlices;   // Used for visual pie charts (total divisions)
  final int visualFilled;   // Used for visual pie charts (filled slices)
  final double value;

  FractionOption({
    required this.type,
    this.text = '',
    this.visualSlices = 0,
    this.visualFilled = 0,
    required this.value,
  });
}

class FractionMatcherLevel {
  final int targetNumerator;
  final int targetDenominator;
  final List<FractionOption> options;
  final int correctOptionIndex;

  FractionMatcherLevel({
    required this.targetNumerator,
    required this.targetDenominator,
    required this.options,
    required this.correctOptionIndex,
  });
}

class FractionMatcherEngine {
  final Random _random = Random();

  // Pure clean fractions to ensure integer percentages and clean decimals
  final List<Map<String, int>> _cleanFractions = [
    {'n': 1, 'd': 2},
    {'n': 1, 'd': 4},
    {'n': 3, 'd': 4},
    {'n': 1, 'd': 5},
    {'n': 2, 'd': 5},
    {'n': 3, 'd': 5},
    {'n': 4, 'd': 5},
    {'n': 1, 'd': 10},
    {'n': 3, 'd': 10},
    {'n': 7, 'd': 10},
    {'n': 9, 'd': 10},
  ];

  FractionMatcherLevel generateLevel(int score) {
    // Pick a target fraction
    final targetMap = _cleanFractions[_random.nextInt(_cleanFractions.length)];
    final int targetN = targetMap['n']!;
    final int targetD = targetMap['d']!;
    final double targetValue = targetN / targetD;

    // Pick correct option type
    final correctType = OptionType.values[_random.nextInt(OptionType.values.length)];
    final FractionOption correctOption = _createOption(correctType, targetN, targetD, targetValue);

    // Create 3 decoy options of random types
    final List<FractionOption> options = [correctOption];
    final Set<double> activeValues = {targetValue};

    while (options.length < 4) {
      final decoyMap = _cleanFractions[_random.nextInt(_cleanFractions.length)];
      final int decoyN = decoyMap['n']!;
      final int decoyD = decoyMap['d']!;
      final double decoyValue = decoyN / decoyD;

      if (!activeValues.contains(decoyValue)) {
        activeValues.add(decoyValue);
        final decoyType = OptionType.values[_random.nextInt(OptionType.values.length)];
        options.add(_createOption(decoyType, decoyN, decoyD, decoyValue));
      }
    }

    options.shuffle(_random);

    int correctIdx = 0;
    for (int i = 0; i < options.length; i++) {
      if ((options[i].value - targetValue).abs() < 0.001) {
        correctIdx = i;
        break;
      }
    }

    return FractionMatcherLevel(
      targetNumerator: targetN,
      targetDenominator: targetD,
      options: options,
      correctOptionIndex: correctIdx,
    );
  }

  FractionOption _createOption(OptionType type, int n, int d, double val) {
    switch (type) {
      case OptionType.decimal:
        final String text = val.toStringAsFixed(val == 0.25 || val == 0.75 ? 2 : 1);
        return FractionOption(type: type, text: text, value: val);
      case OptionType.percentage:
        final String text = '${(val * 100).round()}%';
        return FractionOption(type: type, text: text, value: val);
      case OptionType.visual:
        // Visual can show original d & n, or multiples (e.g. 2/4 for 1/2) to make it more interesting
        int slices = d;
        int filled = n;
        if (d <= 5 && _random.nextBool()) {
          slices *= 2;
          filled *= 2;
        }
        return FractionOption(
          type: type,
          visualSlices: slices,
          visualFilled: filled,
          value: val,
        );
    }
  }
}
