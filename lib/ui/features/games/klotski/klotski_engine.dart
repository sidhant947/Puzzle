class KlotskiBlock {
  final String id;
  final int width;
  final int height;
  int x;
  int y;

  KlotskiBlock({
    required this.id,
    required this.width,
    required this.height,
    required this.x,
    required this.y,
  });

  KlotskiBlock copy() => KlotskiBlock(
        id: id,
        width: width,
        height: height,
        x: x,
        y: y,
      );
}

class KlotskiEngine {
  static const int gridWidth = 4;
  static const int gridHeight = 5;

  // Verified solvable Klotski layout (1 hero + 4 vertical + 1 horizontal + 4 singles = 10 blocks)
  // V H H V
  // V . S V
  // S H H .
  // V H H V
  // V S S V
  static List<KlotskiBlock> get defaultLayout => [
        KlotskiBlock(id: 'hero', width: 2, height: 2, x: 1, y: 2),
        KlotskiBlock(id: 'v0', width: 1, height: 2, x: 0, y: 3),
        KlotskiBlock(id: 'v1', width: 1, height: 2, x: 3, y: 0),
        KlotskiBlock(id: 'v2', width: 1, height: 2, x: 0, y: 0),
        KlotskiBlock(id: 'v3', width: 1, height: 2, x: 3, y: 3),
        KlotskiBlock(id: 'h1', width: 2, height: 1, x: 1, y: 0),
        KlotskiBlock(id: 's0', width: 1, height: 1, x: 0, y: 2),
        KlotskiBlock(id: 's1', width: 1, height: 1, x: 2, y: 4),
        KlotskiBlock(id: 's2', width: 1, height: 1, x: 1, y: 4),
        KlotskiBlock(id: 's3', width: 1, height: 1, x: 2, y: 1),
      ];

  static bool isSolved(List<KlotskiBlock> blocks) {
    final hero = blocks.firstWhere((b) => b.id == 'hero');
    return hero.x == 1 && hero.y == 3;
  }

  static bool isSolvable(List<KlotskiBlock> blocks) {
    final visited = <String>{};
    final queue = [blocks.map((b) => b.copy()).toList()];
    visited.add(_encodeState(blocks));
    int iterations = 0;

    while (queue.isNotEmpty && iterations < 100000) {
      iterations++;
      final current = queue.removeAt(0);

      if (isSolved(current)) return true;

      for (final block in current) {
        for (final dir in [
          [0, -1],
          [0, 1],
          [-1, 0],
          [1, 0],
        ]) {
          final newX = block.x + dir[0];
          final newY = block.y + dir[1];

          if (_canMoveTo(current, block, newX, newY)) {
            final newBlocks = current.map((b) => b.copy()).toList();
            final movedBlock = newBlocks.firstWhere((b) => b.id == block.id);
            movedBlock.x = newX;
            movedBlock.y = newY;

            final key = _encodeState(newBlocks);
            if (!visited.contains(key)) {
              visited.add(key);
              queue.add(newBlocks);
            }
          }
        }
      }
    }

    return false;
  }

  static bool _canMoveTo(
      List<KlotskiBlock> blocks, KlotskiBlock block, int newX, int newY) {
    if (newX < 0 || newX + block.width > gridWidth) return false;
    if (newY < 0 || newY + block.height > gridHeight) return false;

    for (final other in blocks) {
      if (other.id == block.id) continue;
      if (newX < other.x + other.width &&
          newX + block.width > other.x &&
          newY < other.y + other.height &&
          newY + block.height > other.y) {
        return false;
      }
    }
    return true;
  }

  static String _encodeState(List<KlotskiBlock> blocks) {
    final sorted = blocks.toList()..sort((a, b) => a.id.compareTo(b.id));
    return sorted.map((b) => '${b.id}:${b.x},${b.y}').join('|');
  }
}
