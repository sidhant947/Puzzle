import 'dart:math';

class TargetNumberEngine {
  final Random _random = Random();

  /// Generates 4 numbers and a target.
  /// For simplicity, we can aim for target 24 most of the time, 
  /// but occasionally vary it for diversity.
  Map<String, dynamic> generatePuzzle() {
    int target = 24;
    List<int> numbers = [];
    
    // We try to generate numbers that actually have a solution.
    // A simple way is to generate a few sets and pick one that works,
    // or just generate random numbers and trust the player to find a solution if it exists.
    // For better UX, let's ensure a solution exists.
    
    bool found = false;
    while (!found) {
      numbers = List.generate(4, (_) => _random.nextInt(9) + 1);
      if (hasSolution(numbers, target)) {
        found = true;
      }
    }

    return {
      'numbers': numbers,
      'target': target,
    };
  }

  bool hasSolution(List<int> nums, int target) {
    List<double> doubleNums = nums.map((e) => e.toDouble()).toList();
    return _solve(doubleNums, target.toDouble());
  }

  bool _solve(List<double> nums, double target) {
    if (nums.length == 1) {
      return (nums[0] - target).abs() < 1e-6;
    }

    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) continue;

        List<double> nextNums = [];
        for (int k = 0; k < nums.length; k++) {
          if (k != i && k != j) nextNums.add(nums[k]);
        }

        // Try all 4 operations
        // Add
        nextNums.add(nums[i] + nums[j]);
        if (_solve(nextNums, target)) return true;
        nextNums.removeLast();

        // Subtract
        nextNums.add(nums[i] - nums[j]);
        if (_solve(nextNums, target)) return true;
        nextNums.removeLast();

        // Multiply
        nextNums.add(nums[i] * nums[j]);
        if (_solve(nextNums, target)) return true;
        nextNums.removeLast();

        // Divide
        if (nums[j].abs() > 1e-6) {
          nextNums.add(nums[i] / nums[j]);
          if (_solve(nextNums, target)) return true;
          nextNums.removeLast();
        }
      }
    }
    return false;
  }

  /// Simple evaluator for postfix/infix isn't needed if we manage state 
  /// as a sequence of operations in the provider.
}
