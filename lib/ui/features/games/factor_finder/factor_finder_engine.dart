import 'dart:math';

class FactorFinderLevel {
  final int targetNumber;
  final List<int> gridNumbers;
  final Set<int> factorIndices; // Indices in gridNumbers that are factors of targetNumber

  FactorFinderLevel({
    required this.targetNumber,
    required this.gridNumbers,
    required this.factorIndices,
  });
}

class FactorFinderEngine {
  final Random _random = Random();

  // Targets chosen for interesting sets of factors
  final List<int> _possibleTargets = [
    12, 15, 16, 18, 20, 24, 25, 27, 28, 30, 32, 35, 36, 40, 42, 45, 48, 50, 54, 60, 64, 72, 80
  ];

  List<int> _getFactors(int n) {
    final List<int> factors = [];
    for (int i = 1; i <= n; i++) {
      if (n % i == 0) {
        factors.add(i);
      }
    }
    return factors;
  }

  FactorFinderLevel generateLevel(int score) {
    // Determine target based on score (difficulty progression)
    int target;
    if (score < 3) {
      // Easier targets (smaller)
      final easyTargets = _possibleTargets.where((t) => t <= 24).toList();
      target = easyTargets[_random.nextInt(easyTargets.length)];
    } else if (score < 8) {
      // Medium targets
      final medTargets = _possibleTargets.where((t) => t > 20 && t <= 45).toList();
      target = medTargets[_random.nextInt(medTargets.length)];
    } else {
      // Harder targets
      final hardTargets = _possibleTargets.where((t) => t > 40).toList();
      target = hardTargets[_random.nextInt(hardTargets.length)];
    }

    final allFactors = _getFactors(target);
    
    // Grid size: 12 elements (3 rows, 4 columns)
    const int gridSize = 12;

    // We want to place between 3 and 6 factors of the target number in the grid
    final int factorCount = _random.nextInt(3) + 3; // 3, 4, 5 factors
    
    // Choose actual factors to place
    final Set<int> chosenFactors = {};
    final int maxFactorsToPlace = allFactors.length < factorCount ? allFactors.length : factorCount;
    
    final tempFactors = List<int>.from(allFactors)..shuffle(_random);
    for (int i = 0; i < maxFactorsToPlace; i++) {
      chosenFactors.add(tempFactors[i]);
    }

    // Now fill the rest of the grid with non-factors
    final List<int> grid = [];
    grid.addAll(chosenFactors);

    while (grid.length < gridSize) {
      // Generate non-factor numbers
      // Range: 1 to target + 15
      int num = _random.nextInt(target + 15) + 1;
      if (target % num != 0 && !grid.contains(num)) {
        grid.add(num);
      }
    }

    grid.shuffle(_random);

    // Identify which indices in the final grid are correct factors
    final Set<int> factorIndices = {};
    for (int i = 0; i < grid.length; i++) {
      if (target % grid[i] == 0) {
        factorIndices.add(i);
      }
    }

    return FactorFinderLevel(
      targetNumber: target,
      gridNumbers: grid,
      factorIndices: factorIndices,
    );
  }
}
