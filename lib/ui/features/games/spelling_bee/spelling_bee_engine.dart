class SpellingBeeEngine {
  // Each puzzle has 7 letters, the first one is the required central letter.
  // And a list of all valid words for that set.
  final List<Map<String, dynamic>> _puzzles = [
    {
      'letters': 'AHLNOPY',
      'center': 'A',
      'words': ['ALOHA', 'ALPHA', 'ANOPHELES', 'APPLY', 'HALL', 'HOLA', 'HYALIN', 'LAYUP', 'LOYAL', 'NAPA', 'OPAL', 'PAHALA', 'PALL', 'PLAY', 'POLYA']
    },
    {
      'letters': 'CDEILOT',
      'center': 'C',
      'words': ['CODDLE', 'COED', 'COIL', 'COLD', 'COLECT', 'COLLECT', 'COLT', 'CONCEDE', 'CONCEIT', 'CONDO', 'COOL', 'COOT', 'COTE', 'CYCLE', 'DECOCT', 'DECODE', 'DOCILE', 'OCTET']
    },
    {
      'letters': 'FGILNOR',
      'center': 'G',
      'words': ['FIGURING', 'FILING', 'FLING', 'FLOORING', 'FLYING', 'FOILING', 'FOLLING', 'FRIGID', 'GILL', 'GIRL', 'GLORIFY', 'GLORY', 'GOLF', 'GOLFER', 'GRIN', 'GROG', 'IGLOO', 'LINGO', 'LOGGING', 'LOGIN', 'LONGING', 'OILING', 'ORIGIN', 'RIGGING', 'RINGING', 'ROLLING']
    }
  ];

  Map<String, dynamic> getRandomPuzzle() {
    return _puzzles[(DateTime.now().millisecondsSinceEpoch % _puzzles.length)];
  }

  bool isPangram(String word, String letters) {
    final wordSet = word.toUpperCase().split('').toSet();
    final letterSet = letters.toUpperCase().split('').toSet();
    return letterSet.every((l) => wordSet.contains(l));
  }
}
