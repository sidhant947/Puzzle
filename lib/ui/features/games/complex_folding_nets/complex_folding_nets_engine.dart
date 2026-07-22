import 'dart:math';

enum SolidType {
  triangularPrism,
  hexagonalPyramid,
  pentagonalPrism,
  octahedron,
  tetrahedron,
  squarePyramid,
  triangularPyramid,
}

class NetSolidPair {
  final SolidType type;
  final String name;
  // We can represent the net as a list of points/shapes or just use the type to draw it.
  
  NetSolidPair({required this.type, required this.name});
}

class ComplexFoldingNetsEngine {
  final List<NetSolidPair> pairs = [
    NetSolidPair(type: SolidType.triangularPrism, name: 'Triangular Prism'),
    NetSolidPair(type: SolidType.hexagonalPyramid, name: 'Hexagonal Pyramid'),
    NetSolidPair(type: SolidType.pentagonalPrism, name: 'Pentagonal Prism'),
    NetSolidPair(type: SolidType.octahedron, name: 'Octahedron'),
    NetSolidPair(type: SolidType.squarePyramid, name: 'Square Pyramid'),
    NetSolidPair(type: SolidType.squarePyramid, name: 'Tetrahedron'),
    NetSolidPair(type: SolidType.triangularPyramid, name: 'Triangular Pyramid'),
  ];

  Map<String, dynamic> generateLevel() {
    final random = Random();
    final correctPair = pairs[random.nextInt(pairs.length)];
    
    // Remove all pairs of the same type to prevent options having multiple correct answers
    final availablePairs = pairs.where((p) => p.type != correctPair.type).toList();
    
    final options = <NetSolidPair>[correctPair];
    while (options.length < 4) {
      final pair = availablePairs[random.nextInt(availablePairs.length)];
      if (!options.contains(pair)) {
        options.add(pair);
      }
    }
    options.shuffle();

    return {
      'correctPair': correctPair,
      'options': options,
    };
  }
}
