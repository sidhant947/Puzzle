import 'dart:math';

enum Direction { north, south, east, west }

class MentalMappingEngine {
  final int gridSize;
  final int steps;

  MentalMappingEngine({required this.gridSize, required this.steps});

  Map<String, dynamic> generateLevel() {
    final random = Random();
    int startRow = random.nextInt(gridSize);
    int startCol = random.nextInt(gridSize);

    int currentRow = startRow;
    int currentCol = startCol;

    List<Direction> sequence = [];

    for (int i = 0; i < steps; i++) {
      List<Direction> possibleDirections = [];
      if (currentRow > 0) possibleDirections.add(Direction.north);
      if (currentRow < gridSize - 1) possibleDirections.add(Direction.south);
      if (currentCol > 0) possibleDirections.add(Direction.west);
      if (currentCol < gridSize - 1) possibleDirections.add(Direction.east);

      // Avoid immediate backtracking for better challenge
      if (sequence.isNotEmpty) {
        Direction last = sequence.last;
        if (last == Direction.north && possibleDirections.contains(Direction.south) && possibleDirections.length > 1) {
          possibleDirections.remove(Direction.south);
        } else if (last == Direction.south && possibleDirections.contains(Direction.north) && possibleDirections.length > 1) {
          possibleDirections.remove(Direction.north);
        } else if (last == Direction.east && possibleDirections.contains(Direction.west) && possibleDirections.length > 1) {
          possibleDirections.remove(Direction.west);
        } else if (last == Direction.west && possibleDirections.contains(Direction.east) && possibleDirections.length > 1) {
          possibleDirections.remove(Direction.east);
        }
      }

      Direction dir = possibleDirections[random.nextInt(possibleDirections.length)];
      sequence.add(dir);

      switch (dir) {
        case Direction.north:
          currentRow--;
          break;
        case Direction.south:
          currentRow++;
          break;
        case Direction.east:
          currentCol++;
          break;
        case Direction.west:
          currentCol--;
          break;
      }
    }

    return {
      'gridSize': gridSize,
      'startRow': startRow,
      'startCol': startCol,
      'sequence': sequence,
      'targetRow': currentRow,
      'targetCol': currentCol,
    };
  }
}
