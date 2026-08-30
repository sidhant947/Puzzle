import 'dart:math' as math;

enum ConnectionType { meshed, belt, crossedBelt }
enum GearDirection { clockwise, counterClockwise }

class GearNode {
  final int id;
  final double x; // Relative layout 0.0 - 1.0
  final double y;
  final double radius;

  GearNode({
    required this.id,
    required this.x,
    required this.y,
    required this.radius,
  });
}

class GearConnection {
  final int fromId;
  final int toId;
  final ConnectionType type;

  GearConnection({
    required this.fromId,
    required this.toId,
    required this.type,
  });
}

class GearTrainPuzzle {
  final List<GearNode> gears;
  final List<GearConnection> connections;
  final GearDirection inputDirection;
  final int inputGearId;
  final int targetGearId;
  final GearDirection targetDirection;

  GearTrainPuzzle({
    required this.gears,
    required this.connections,
    required this.inputDirection,
    required this.inputGearId,
    required this.targetGearId,
    required this.targetDirection,
  });
}

class GearTrainDirectionEngine {
  static GearTrainPuzzle generatePuzzle({int numGears = 4, math.Random? random}) {
    final rng = random ?? math.Random();
    
    final gears = <GearNode>[];
    final connections = <GearConnection>[];

    // Build a chain of gears
    final startDir = rng.nextBool() ? GearDirection.clockwise : GearDirection.counterClockwise;
    GearDirection currentDir = startDir;

    for (int i = 0; i < numGears; i++) {
      final t = i / (numGears - 1);
      final x = 0.20 + (t * 0.60);
      final y = 0.35 + ((i % 2 == 0 ? 0.15 : -0.15));
      gears.add(GearNode(id: i, x: x, y: y, radius: 28.0));

      if (i > 0) {
        final typeRoll = rng.nextDouble();
        ConnectionType conn;
        if (typeRoll < 0.60) {
          conn = ConnectionType.meshed;
          currentDir = currentDir == GearDirection.clockwise
              ? GearDirection.counterClockwise
              : GearDirection.clockwise;
        } else if (typeRoll < 0.85) {
          conn = ConnectionType.belt;
          // same direction
        } else {
          conn = ConnectionType.crossedBelt;
          currentDir = currentDir == GearDirection.clockwise
              ? GearDirection.counterClockwise
              : GearDirection.clockwise;
        }

        connections.add(GearConnection(
          fromId: i - 1,
          toId: i,
          type: conn,
        ));
      }
    }

    return GearTrainPuzzle(
      gears: gears,
      connections: connections,
      inputDirection: startDir,
      inputGearId: 0,
      targetGearId: numGears - 1,
      targetDirection: currentDir,
    );
  }
}
