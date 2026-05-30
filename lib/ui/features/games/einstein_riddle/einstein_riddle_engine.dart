import 'dart:math';

class EinsteinRiddleEngine {
  final Random _random = Random();

  static const List<String> _colors = ['Red', 'Green', 'Blue', 'Yellow', 'White'];
  static const List<String> _nationalities = ['Brit', 'Swede', 'Dane', 'Norwegian', 'German'];
  static const List<String> _drinks = ['Tea', 'Coffee', 'Milk', 'Beer', 'Water'];
  static const List<String> _pets = ['Dog', 'Bird', 'Cat', 'Horse', 'Fish'];

  Map<String, dynamic> generatePuzzle() {
    List<Map<String, String>> solution;
    List<Clue> clues;

    do {
      solution = _generateRandomSolution();
      clues = _generateSolvableClues(solution);
    } while (clues.isEmpty);

    final houses = ['1', '2', '3', '4', '5'];
    final options = {
      'House': houses,
      'Color': List<String>.from(_colors)..shuffle(_random),
      'Nationality': List<String>.from(_nationalities)..shuffle(_random),
      'Drink': List<String>.from(_drinks)..shuffle(_random),
      'Pet': List<String>.from(_pets)..shuffle(_random),
    };

    final mappedSolution = <String, Map<String, String>>{};
    for (var i = 0; i < 5; i++) {
      mappedSolution[(i + 1).toString()] = {
        'Color': solution[i]['Color']!,
        'Nationality': solution[i]['Nationality']!,
        'Drink': solution[i]['Drink']!,
        'Pet': solution[i]['Pet']!,
      };
    }

    return {
      'categories': ['House', 'Color', 'Nationality', 'Drink', 'Pet'],
      'options': options,
      'clues': clues.map((c) => c.text).toList(),
      'solution': mappedSolution,
    };
  }

  List<Map<String, String>> _generateRandomSolution() {
    final colors = List<String>.from(_colors)..shuffle(_random);
    final nationalities = List<String>.from(_nationalities)..shuffle(_random);
    final drinks = List<String>.from(_drinks)..shuffle(_random);
    final pets = List<String>.from(_pets)..shuffle(_random);

    return List.generate(5, (i) => {
      'Color': colors[i],
      'Nationality': nationalities[i],
      'Drink': drinks[i],
      'Pet': pets[i],
    });
  }

  List<Clue> _generateSolvableClues(List<Map<String, String>> solution) {
    final allClues = <Clue>[];

    // Generate Direct Property Clues (A and B are in same house)
    final categories = ['Color', 'Nationality', 'Drink', 'Pet'];
    for (var i = 0; i < categories.length; i++) {
      for (var j = i + 1; j < categories.length; j++) {
        final catA = categories[i];
        final catB = categories[j];
        for (var h = 0; h < 5; h++) {
          final valA = solution[h][catA]!;
          final valB = solution[h][catB]!;
          allClues.add(Clue("The $valA house owner has the $valB.", solution, [catA, valA, catB, valB], ClueType.sameHouse));
          allClues.add(Clue("The person who drinks $valA also has the $valB.", solution, [catA, valA, catB, valB], ClueType.sameHouse));
          allClues.add(Clue("The $valA is kept by the person who drinks $valB.", solution, [catA, valA, catB, valB], ClueType.sameHouse));
          allClues.add(Clue("The $valA lives in the $valB house.", solution, [catA, valA, catB, valB], ClueType.sameHouse));
        }
      }
    }

    // Generate House Number Clues
    for (var cat in categories) {
      for (var h = 0; h < 5; h++) {
        final val = solution[h][cat]!;
        allClues.add(Clue("The $val is in house ${h + 1}.", solution, [cat, val, 'House', (h + 1).toString()], ClueType.fixedHouse));
      }
    }

    // Generate Relative Clues (Next to, Left of)
    for (var i = 0; i < categories.length; i++) {
      for (var j = 0; j < categories.length; j++) {
        final catA = categories[i];
        final catB = categories[j];
        for (var h = 0; h < 4; h++) {
          final valA = solution[h][catA]!;
          final valB = solution[h+1][catB]!;
          allClues.add(Clue("The $valA is immediately to the left of the $valB.", solution, [catA, valA, catB, valB], ClueType.leftOf));
          allClues.add(Clue("The $valA lives next to the $valB.", solution, [catA, valA, catB, valB], ClueType.nextTo));
        }
      }
    }

    allClues.shuffle(_random);

    final selectedClues = <Clue>[];
    final solver = EinsteinSolver(5, categories);

    // To ensure intermediate level, we pick a mix of clues.
    // We add clues until we have a unique solution.
    for (var clue in allClues) {
      selectedClues.add(clue);
      if (selectedClues.length > 8 && solver.hasUniqueSolution(selectedClues)) {
        break;
      }
      if (selectedClues.length > 25) break; // Safety break
    }

    // If we didn't get a unique solution, try again (unlikely with 25 clues)
    if (!solver.hasUniqueSolution(selectedClues)) return [];

    // Optional: Minimize clues (remove redundant ones)
    final minimized = List<Clue>.from(selectedClues);
    for (var i = minimized.length - 1; i >= 0; i--) {
      final temp = List<Clue>.from(minimized)..removeAt(i);
      if (solver.hasUniqueSolution(temp)) {
        minimized.removeAt(i);
      }
    }

    return minimized;
  }

  bool checkVictory(Map<String, Map<String, String>> userSolution, Map<String, Map<String, String>> actualSolution) {
    for (var house in actualSolution.keys) {
      if (!userSolution.containsKey(house)) return false;
      var userHouse = userSolution[house]!;
      var actualHouse = actualSolution[house]!;
      for (var category in actualHouse.keys) {
        if (userHouse[category] != actualHouse[category]) return false;
      }
    }
    return true;
  }
}

enum ClueType { sameHouse, leftOf, nextTo, fixedHouse }

class Clue {
  final String text;
  final ClueType type;
  final List<String> data; // [CatA, ValA, CatB, ValB]
  
  Clue(this.text, List<Map<String, String>> solution, this.data, this.type);
}

class EinsteinSolver {
  final int housesCount;
  final List<String> categories;
  
  EinsteinSolver(this.housesCount, this.categories);

  bool hasUniqueSolution(List<Clue> clues) {
    int solutions = 0;
    
    // Grid: HouseIndex -> CategoryIndex -> Value
    // Values are 0-4
    final grid = List.generate(housesCount, (_) => List.filled(categories.length, -1));
    
    // Map category names to indices
    final catIdx = <String, int>{};
    for (var i = 0; i < categories.length; i++) {
      catIdx[categories[i]] = i;
    }
    
    // Pre-process clues into index-based constraints
    final constraints = clues.map((c) {
      if (c.type == ClueType.fixedHouse) {
        return _Constraint(
          catIdx[c.data[0]]!,
          _valIdx(c.data[0], c.data[1]),
          -1,
          -1,
          ClueType.fixedHouse,
          hB: int.parse(c.data[3]) - 1,
        );
      } else {
        return _Constraint(
          catIdx[c.data[0]]!,
          _valIdx(c.data[0], c.data[1]),
          catIdx[c.data[2]]!,
          _valIdx(c.data[2], c.data[3]),
          c.type,
        );
      }
    }).toList();

    void solve(int h, int c) {
      if (solutions > 1) return;
      if (h == housesCount) {
        solutions++;
        return;
      }

      int nextH = h, nextC = c + 1;
      if (nextC == categories.length) {
        nextH = h + 1;
        nextC = 0;
      }

      for (int v = 0; v < housesCount; v++) {
        // Check if value already used in this category
        bool alreadyUsed = false;
        for (int i = 0; i < h; i++) {
          if (grid[i][c] == v) {
            alreadyUsed = true;
            break;
          }
        }
        if (alreadyUsed) continue;

        grid[h][c] = v;
        if (_isPartiallyValid(grid, h, c, constraints)) {
          solve(nextH, nextC);
        }
        grid[h][c] = -1;
      }
    }

    solve(0, 0);
    return solutions == 1;
  }

  int _valIdx(String category, String value) {
    if (category == 'Color') return EinsteinRiddleEngine._colors.indexOf(value);
    if (category == 'Nationality') return EinsteinRiddleEngine._nationalities.indexOf(value);
    if (category == 'Drink') return EinsteinRiddleEngine._drinks.indexOf(value);
    if (category == 'Pet') return EinsteinRiddleEngine._pets.indexOf(value);
    return -1;
  }

  bool _isPartiallyValid(List<List<int>> grid, int lastH, int lastC, List<_Constraint> constraints) {
    for (var con in constraints) {
      if (con.type == ClueType.fixedHouse) {
        if (grid[con.hB][con.catA] != -1 && grid[con.hB][con.catA] != con.valA) return false;
      } else if (con.type == ClueType.sameHouse) {
        // Same house: if catA and catB are both assigned in same house, they must match values
        for (int i = 0; i < housesCount; i++) {
          final vA = grid[i][con.catA];
          final vB = grid[i][con.catB];
          if (vA != -1 && vB != -1) {
            if (vA == con.valA && vB != con.valB) return false;
            if (vA != con.valA && vB == con.valB) return false;
          }
        }
      } else if (con.type == ClueType.leftOf) {
        int posA = -1, posB = -1;
        for (int i = 0; i < housesCount; i++) {
          if (grid[i][con.catA] == con.valA) posA = i;
          if (grid[i][con.catB] == con.valB) posB = i;
        }
        // If both found, must be adjacent A-B
        if (posA != -1 && posB != -1 && posA != posB - 1) return false;
        // If only A found, cannot be in last house
        if (posA == housesCount - 1) return false;
        // If only B found, cannot be in first house
        if (posB == 0) return false;
      } else if (con.type == ClueType.nextTo) {
        int posA = -1, posB = -1;
        for (int i = 0; i < housesCount; i++) {
          if (grid[i][con.catA] == con.valA) posA = i;
          if (grid[i][con.catB] == con.valB) posB = i;
        }
        if (posA != -1 && posB != -1 && (posA - posB).abs() != 1) return false;
      }
    }
    return true;
  }
}

class _Constraint {
  final int catA, valA, catB, valB, hB;
  final ClueType type;
  _Constraint(this.catA, this.valA, this.catB, this.valB, this.type, {this.hB = -1});
}
