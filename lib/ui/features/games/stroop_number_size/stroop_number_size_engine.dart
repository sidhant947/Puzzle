import 'dart:math' as math;

enum StroopDimension { numerical, physical }

class NumberSizeTrial {
  final int leftNumber; // 1 to 9
  final int rightNumber; // 1 to 9 (different)
  final double leftSize; // 28 or 52
  final double rightSize; // 52 or 28
  final StroopDimension taskDimension;
  final bool leftIsLarger; // Correct answer

  NumberSizeTrial({
    required this.leftNumber,
    required this.rightNumber,
    required this.leftSize,
    required this.rightSize,
    required this.taskDimension,
    required this.leftIsLarger,
  });
}

class StroopNumberSizeEngine {
  static NumberSizeTrial generateTrial({math.Random? random}) {
    final rng = random ?? math.Random();
    
    int num1 = rng.nextInt(9) + 1;
    int num2 = rng.nextInt(9) + 1;
    while (num1 == num2) {
      num2 = rng.nextInt(9) + 1;
    }

    final size1 = rng.nextBool() ? 28.0 : 54.0;
    final size2 = size1 == 28.0 ? 54.0 : 28.0;

    final dimension = rng.nextBool() ? StroopDimension.numerical : StroopDimension.physical;
    final leftIsLarger = dimension == StroopDimension.numerical ? (num1 > num2) : (size1 > size2);

    return NumberSizeTrial(
      leftNumber: num1,
      rightNumber: num2,
      leftSize: size1,
      rightSize: size2,
      taskDimension: dimension,
      leftIsLarger: leftIsLarger,
    );
  }
}
