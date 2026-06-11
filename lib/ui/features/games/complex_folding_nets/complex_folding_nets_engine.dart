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
    NetSolidPair(type: SolidType.tetrahedron, name: 'Tetrahedron'),
    NetSolidPair(type: SolidType.squarePyramid, name: 'Square Pyramid'),
    NetSolidPair(type: SolidType.triangularPyramid, name: 'Triangular Pyramid'),
  ];

  Map<String, dynamic> generateLevel() {
    final random = Random();
    final correctPair = pairs[random.nextInt(pairs.length)];
    
    final options = <NetSolidPair>[correctPair];
    while (options.length < 4) {
      final pair = pairs[random.nextInt(pairs.length)];
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
