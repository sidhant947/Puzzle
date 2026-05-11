import 'dart:math';

class TMTPoint {
  final int id;
  final String label;
  final double x; // 0.0 to 1.0
  final double y; // 0.0 to 1.0

  TMTPoint({required this.id, required this.label, required this.x, required this.y});
}

class TMTEngine {
  final Random _random = Random();

  List<TMTPoint> generatePoints(int count) {
    List<TMTPoint> points = [];
    for (int i = 0; i < count; i++) {
      double x, y;
      bool overlapping;
      do {
        overlapping = false;
        x = 0.1 + _random.nextDouble() * 0.8;
        y = 0.1 + _random.nextDouble() * 0.8;
        for (var p in points) {
          double dist = sqrt(pow(p.x - x, 2) + pow(p.y - y, 2));
          if (dist < 0.15) {
            overlapping = true;
            break;
          }
        }
      } while (overlapping);
      
      points.add(TMTPoint(
        id: i,
        label: (i + 1).toString(),
        x: x,
        y: y,
      ));
    }
    return points;
  }
}
