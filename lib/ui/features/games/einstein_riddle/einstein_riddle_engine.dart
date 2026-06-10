import 'dart:math';

class EinsteinRiddleEngine {
  final Random _random = Random();

  static const List<String> _colors = ['Red', 'Green', 'Blue', 'Yellow', 'White'];
  static const List<String> _nationalities = ['Brit', 'Swede', 'Dane', 'Norwegian', 'German'];
  static const List<String> _drinks = ['Tea', 'Coffee', 'Milk', 'Beer', 'Water'];
  static const List<String> _pets = ['Dog', 'Bird', 'Cat', 'Horse', 'Fish'];
  static const List<String> _cigars = ['Pall Mall', 'Dunhill', 'Blue Master', 'Prince', 'Blends'];

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
      'Cigar': List<String>.from(_cigars)..shuffle(_random),
    };

    final mappedSolution = <String, Map<String, String>>{};
    for (var i = 0; i < 5; i++) {
      mappedSolution[(i + 1).toString()] = {
        'Color': solution[i]['Color']!,
        'Nationality': solution[i]['Nationality']!,
        'Drink': solution[i]['Drink']!,
        'Pet': solution[i]['Pet']!,
        'Cigar': solution[i]['Cigar']!,
      };
    }

    return {
      'categories': ['House', 'Color', 'Nationality', 'Drink', 'Cigar', 'Pet'],
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
    final cigars = List<String>.from(_cigars)..shuffle(_random);

    return List.generate(5, (i) => {
      'Color': colors[i],
      'Nationality': nationalities[i],
      'Drink': drinks[i],
      'Pet': pets[i],
      'Cigar': cigars[i],
    });
  }

  List<Clue> _generateSolvableClues(List<Map<String, String>> solution) {
    final allClues = <Clue>[];
    final categories = ['Color', 'Nationality', 'Drink', 'Pet', 'Cigar'];

    // Generate Same House Clues
    for (var i = 0; i < categories.length; i++) {
      for (var j = i + 1; j < categories.length; j++) {
        final catA = categories[i];
        final catB = categories[j];
        for (var h = 0; h < 5; h++) {
          final valA = solution[h][catA]!;
          final valB = solution[h][catB]!;
          allClues.add(Clue(_formatClue(catA, valA, catB, valB, ClueType.sameHouse), [catA, valA, catB, valB], ClueType.sameHouse));
        }
      }
    }

    // Generate House Number Clues
    for (var cat in categories) {
      for (var h = 0; h < 5; h++) {
        final val = solution[h][cat]!;
        allClues.add(Clue(_formatClue(cat, val, 'House', (h + 1).toString(), ClueType.fixedHouse), [cat, val, 'House', (h + 1).toString()], ClueType.fixedHouse));
      }
    }

    // Generate Relative Clues (Next to, Left of)
    for (var i = 0; i < categories.length; i++) {
      for (var j = 0; j < categories.length; j++) {
        final catA = categories[i];
        final catB = categories[j];
        
        // Left of
        for (var h = 0; h < 4; h++) {
          final valA = solution[h][catA]!;
          final valB = solution[h+1][catB]!;
          // In original riddle, LeftOf is mostly for colors, but we can use it for others too
          allClues.add(Clue(_formatClue(catA, valA, catB, valB, ClueType.leftOf), [catA, valA, catB, valB], ClueType.leftOf));
        }

        // Next to
        for (var h = 0; h < 4; h++) {
          final valA = solution[h][catA]!;
          final valB = solution[h+1][catB]!;
          allClues.add(Clue(_formatClue(catA, valA, catB, valB, ClueType.nextTo), [catA, valA, catB, valB], ClueType.nextTo));
          allClues.add(Clue(_formatClue(catB, valB, catA, valA, ClueType.nextTo), [catB, valB, catA, valA], ClueType.nextTo));
        }
      }
    }

    allClues.shuffle(_random);

    final selectedClues = <Clue>[];
    final solver = EinsteinSolver(5, categories);

    // Filter out some redundant or too many clues of same type
    final typeCounts = <ClueType, int>{};
    
    for (var clue in allClues) {
      typeCounts[clue.type] = (typeCounts[clue.type] ?? 0) + 1;
      
      // Limit sameHouse clues as they are very common
      if (clue.type == ClueType.sameHouse && (typeCounts[clue.type] ?? 0) > 15) continue;
      
      selectedClues.add(clue);
      
      // Check for uniqueness periodically to save time
      if (selectedClues.length >= 10 && selectedClues.length % 2 == 0) {
        if (solver.hasUniqueSolution(selectedClues)) {
          break;
        }
      }
      
      if (selectedClues.length > 30) break; // Safety break
    }

    if (!solver.hasUniqueSolution(selectedClues)) return [];

    // Minimize clues
    final minimized = List<Clue>.from(selectedClues);
    for (var i = minimized.length - 1; i >= 0; i--) {
      final temp = List<Clue>.from(minimized)..removeAt(i);
      if (solver.hasUniqueSolution(temp)) {
        minimized.removeAt(i);
      }
    }

    return minimized;
  }

  String _formatClue(String catA, String valA, String catB, String valB, ClueType type) {
    switch (type) {
      case ClueType.sameHouse:
        final order = ['Nationality', 'Drink', 'Cigar', 'Pet', 'Color'];
        String c1 = catA, v1 = valA, c2 = catB, v2 = valB;
        if (order.indexOf(catA) > order.indexOf(catB)) {
          c1 = catB; v1 = valB; c2 = catA; v2 = valA;
        }

        if (c1 == 'Nationality') {
          if (c2 == 'Drink') return "The $v1 drinks $v2.";
          if (c2 == 'Cigar') return "The $v1 smokes $v2.";
          if (c2 == 'Pet') return "The $v1 keeps $v2.";
          if (c2 == 'Color') return "The $v1 lives in the $v2 house.";
        }
        if (c1 == 'Drink') {
          if (c2 == 'Cigar') return "The person who drinks $v1 smokes $v2.";
          if (c2 == 'Pet') return "The person who drinks $v1 keeps $v2.";
          if (c2 == 'Color') return "The person who drinks $v1 lives in the $v2 house.";
        }
        if (c1 == 'Cigar') {
          if (c2 == 'Pet') return "The person who smokes $v1 keeps $v2.";
          if (c2 == 'Color') return "The person who smokes $v1 lives in the $v2 house.";
        }
        if (c1 == 'Pet') {
          if (c2 == 'Color') return "The person who keeps $v1 lives in the $v2 house.";
        }
        return "The $v1 and the $v2 are in the same house.";

      case ClueType.fixedHouse:
        if (catA == 'Nationality') {
            if (valB == '1') return "The $valA lives in the first house.";
            if (valB == '3') return "The $valA lives in the middle house.";
            return "The $valA lives in house $valB.";
        }
        if (catA == 'Drink') return "The person who drinks $valA lives in house $valB.";
        if (catA == 'Cigar') return "The person who smokes $valA lives in house $valB.";
        if (catA == 'Pet') return "The person who keeps $valA lives in house $valB.";
        if (catA == 'Color') return "The $valA house is house $valB.";
        return "The $valA is in house $valB.";

      case ClueType.leftOf:
        String p1 = _propertyDesc(catA, valA);
        String p2 = _propertyDesc(catB, valB);
        return "The $p1 is immediately to the left of the $p2.";

      case ClueType.nextTo:
        String p1 = _propertyDesc(catA, valA);
        String p2 = _propertyDesc(catB, valB);
        return "The $p1 lives next to the $p2.";
    }
  }

  String _propertyDesc(String cat, String val) {
    if (cat == 'Color') return "$val house";
    if (cat == 'Nationality') return val;
    if (cat == 'Drink') return "person who drinks $val";
    if (cat == 'Cigar') return "person who smokes $val";
    if (cat == 'Pet') return "person who keeps $val";
    return val;
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
  
  Clue(this.text, this.data, this.type);
}

class EinsteinSolver {
  final int housesCount;
  final List<String> categories;
  
  EinsteinSolver(this.housesCount, this.categories);

  bool hasUniqueSolution(List<Clue> clues) {
    int solutions = 0;
    
    final grid = List.generate(housesCount, (_) => List.filled(categories.length, -1));
    
    final catIdx = <String, int>{};
    for (var i = 0; i < categories.length; i++) {
      catIdx[categories[i]] = i;
    }
    
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
    if (category == 'Cigar') return EinsteinRiddleEngine._cigars.indexOf(value);
    return -1;
  }

  bool _isPartiallyValid(List<List<int>> grid, int lastH, int lastC, List<_Constraint> constraints) {
    for (var con in constraints) {
      if (con.type == ClueType.fixedHouse) {
        // If the house is specified, value must be there
        if (grid[con.hB][con.catA] != -1 && grid[con.hB][con.catA] != con.valA) return false;
        // If the value is assigned elsewhere, return false
        for (int i = 0; i < housesCount; i++) {
          if (grid[i][con.catA] == con.valA && i != con.hB) return false;
        }
      } else if (con.type == ClueType.sameHouse) {
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
        if (posA != -1 && posB != -1 && posA != posB - 1) return false;
        if (posA == housesCount - 1) return false;
        if (posB == 0) return false;
        
        // Pruning: if posA is known, posA+1 must be able to hold valB
        if (posA != -1 && posA < housesCount - 1) {
            final nextValB = grid[posA + 1][con.catB];
            if (nextValB != -1 && nextValB != con.valB) return false;
        }
        // Pruning: if posB is known, posB-1 must be able to hold valA
        if (posB != -1 && posB > 0) {
            final prevValA = grid[posB - 1][con.catA];
            if (prevValA != -1 && prevValA != con.valA) return false;
        }
      } else if (con.type == ClueType.nextTo) {
        int posA = -1, posB = -1;
        for (int i = 0; i < housesCount; i++) {
          if (grid[i][con.catA] == con.valA) posA = i;
          if (grid[i][con.catB] == con.valB) posB = i;
        }
        if (posA != -1 && posB != -1 && (posA - posB).abs() != 1) return false;
        
        // Pruning: if posA is known, at least one neighbor must be able to hold valB
        if (posA != -1) {
            bool leftPossible = posA > 0 && (grid[posA - 1][con.catB] == -1 || grid[posA - 1][con.catB] == con.valB);
            bool rightPossible = posA < housesCount - 1 && (grid[posA + 1][con.catB] == -1 || grid[posA + 1][con.catB] == con.valB);
            if (!leftPossible && !rightPossible) return false;
        }
        // Pruning: same for posB
        if (posB != -1) {
            bool leftPossible = posB > 0 && (grid[posB - 1][con.catA] == -1 || grid[posB - 1][con.catA] == con.valA);
            bool rightPossible = posB < housesCount - 1 && (grid[posB + 1][con.catA] == -1 || grid[posB + 1][con.catA] == con.valA);
            if (!leftPossible && !rightPossible) return false;
        }
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
