import 'dart:math';

class DominosaEngine {
  final Random _random = Random();

  Map<String, dynamic> generateLevel({int maxVal = 3}) {
    // Dominosa generation:
    // 1. Create a complete set of dominoes for maxVal (e.g., if maxVal=3, dominoes are 0-0 to 3-3).
    // 2. Arrange them in a grid of size (maxVal+1) x (maxVal+2).
    // 3. Shuffle and present the numbers.
    
    int numDominoes = (maxVal + 1) * (maxVal + 2) ~/ 2;
    List<List<int>> dominoes = [];
    for (int i = 0; i <= maxVal; i++) {
      for (int j = i; j <= maxVal; j++) {
        dominoes.add([i, j]);
      }
    }
    dominoes.shuffle();

    int rows = maxVal + 1;
    int cols = maxVal + 2;
    List<List<int>> grid = List.generate(rows, (_) => List.filled(cols, -1));
    
    // Simple tiling (backtracking would be better but let's try a simple one)
    // For maxVal=3, rows=4, cols=5. Total cells = 20. Dominoes = 10.
    
    // Tiling 4x5 with 10 dominoes:
    // For now, let's use a fixed tiling and fill with random dominoes
    List<List<List<int>>> tiling = [
      [[0,0],[0,1]], [[0,2],[0,3]], [[0,4],[1,4]],
      [[1,0],[1,1]], [[1,2],[1,3]],
      [[2,0],[2,1]], [[2,2],[2,3]], [[2,4],[3,4]],
      [[3,0],[3,1]], [[3,2],[3,3]]
    ];
    
    for (int i = 0; i < dominoes.length; i++) {
      var d = dominoes[i];
      var pos = tiling[i];
      if (_random.nextBool()) d = [d[1], d[0]];
      grid[pos[0][0]][pos[0][1]] = d[0];
      grid[pos[1][0]][pos[1][1]] = d[1];
    }

    return {
      'grid': grid,
      'maxVal': maxVal,
    };
  }

  static bool checkVictoryWrapper(Map<String, dynamic> params) {
    final grid = params['grid'] as List<List<int>>;
    final selections = params['selections'] as List<List<List<int>>>; // List of pairs [[r1,c1],[r2,c2]]
    final maxVal = params['maxVal'] as int;

    int totalCells = grid.length * grid[0].length;
    if (selections.length * 2 != totalCells) return false;

    Set<String> usedDominoes = {};
    Set<String> usedCells = {};

    for (var sel in selections) {
      int r1 = sel[0][0], c1 = sel[0][1];
      int r2 = sel[1][0], c2 = sel[1][1];
      
      String cKey1 = '$r1,$c1';
      String cKey2 = '$r2,$c2';
      if (usedCells.contains(cKey1) || usedCells.contains(cKey2)) return false;
      usedCells.add(cKey1);
      usedCells.add(cKey2);

      int v1 = grid[r1][c1];
      int v2 = grid[r2][c2];
      
      String dKey = v1 < v2 ? '$v1-$v2' : '$v2-$v1';
      if (usedDominoes.contains(dKey)) return false;
      usedDominoes.add(dKey);
    }

    int expectedDominoes = (maxVal + 1) * (maxVal + 2) ~/ 2;
    return usedDominoes.length == expectedDominoes;
  }
}
