import 'dart:math';

enum Quantifier {
  all('All'),
  no('No'),
  some('Some'),
  someNot('Some...not');

  final String label;
  const Quantifier(this.label);
}

class SyllogismPattern {
  final Quantifier q1;
  final Quantifier q2;
  final Quantifier qConclusion;
  final bool isValid;
  final bool reverseConclusion;

  SyllogismPattern(this.q1, this.q2, this.qConclusion, this.isValid, {this.reverseConclusion = false});
}

class LogicalSyllogismsEngine {
  final Random _random = Random();

  final List<String> _subjects = [
    'Cats', 'Dogs', 'Birds', 'Mammals', 'Fish', 'Reptiles', 
    'Trees', 'Flowers', 'Fruits', 'Vegetables', 'Insects',
    'Spiders', 'Lions', 'Tigers', 'Bears', 'Wolves', 'Sharks',
    'Whales', 'Dolphins', 'Eagles', 'Hawks', 'Snakes', 'Lizards'
  ];

  final List<String> _middleTerms = [
    'Carnivores', 'Herbivores', 'Predators', 'Prey', 'Pets',
    'Wild animals', 'Living things', 'Organisms', 'Creatures',
    'Vertebrates', 'Invertebrates', 'Land-dwellers', 'Water-dwellers'
  ];

  final List<String> _attributes = [
    'Friendly', 'Loud', 'Fast', 'Green', 'Alive', 'Growing', 
    'Breathing', 'Moving', 'Hungry', 'Sleepy', 'Dangerous',
    'Small', 'Large', 'Colorful', 'Strong', 'Weak', 'Active'
  ];

  late final List<SyllogismPattern> _patterns = [
    // VALID PATTERNS
    SyllogismPattern(Quantifier.all, Quantifier.all, Quantifier.all, true),      // All A are B. All B are C. -> All A are C.
    SyllogismPattern(Quantifier.some, Quantifier.all, Quantifier.some, true),    // Some A are B. All B are C. -> Some A are C.
    SyllogismPattern(Quantifier.all, Quantifier.no, Quantifier.no, true),       // All A are B. No B are C. -> No A are C.
    SyllogismPattern(Quantifier.all, Quantifier.no, Quantifier.someNot, true),  // All A are B. No B are C. -> Some A are not C.
    SyllogismPattern(Quantifier.some, Quantifier.no, Quantifier.someNot, true), // Some A are B. No B are C. -> Some A are not C.
    SyllogismPattern(Quantifier.no, Quantifier.all, Quantifier.someNot, true, reverseConclusion: true), // No A are B. All B are C. -> Some C are not A.
    SyllogismPattern(Quantifier.no, Quantifier.some, Quantifier.someNot, true, reverseConclusion: true), // No A are B. Some B are C. -> Some C are not A.
    SyllogismPattern(Quantifier.all, Quantifier.all, Quantifier.some, true),     // All A are B. All B are C. -> Some A are C.
    
    // INVALID PATTERNS (Logical Fallacies)
    SyllogismPattern(Quantifier.some, Quantifier.all, Quantifier.all, false),    // Some A are B. All B are C. -> All A are C.
    SyllogismPattern(Quantifier.all, Quantifier.some, Quantifier.all, false),    // All A are B. Some B are C. -> All A are C.
    SyllogismPattern(Quantifier.some, Quantifier.some, Quantifier.some, false),  // Some A are B. Some B are C. -> Some A are C. (Some-Some)
    SyllogismPattern(Quantifier.some, Quantifier.some, Quantifier.all, false),   // Some A are B. Some B are C. -> All A are C. (Some-Some)
    SyllogismPattern(Quantifier.no, Quantifier.no, Quantifier.no, false),        // No A are B. No B are C. -> No A are C. (None-None)
    SyllogismPattern(Quantifier.no, Quantifier.no, Quantifier.some, false),      // No A are B. No B are C. -> Some A are C. (None-None)
    SyllogismPattern(Quantifier.no, Quantifier.all, Quantifier.no, false),       // No A are B. All B are C. -> No A are C. (None-All)
    SyllogismPattern(Quantifier.no, Quantifier.all, Quantifier.all, false),      // No A are B. All B are C. -> All A are C. (None-All)
    SyllogismPattern(Quantifier.some, Quantifier.no, Quantifier.no, false),      // Some A are B. No B are C. -> No A are C. (Some-None)
    SyllogismPattern(Quantifier.no, Quantifier.some, Quantifier.no, false),      // No A are B. Some B are C. -> No A are C. (None-Some)
    SyllogismPattern(Quantifier.all, Quantifier.all, Quantifier.no, false),      // All A are B. All B are C. -> No A are C.
    SyllogismPattern(Quantifier.all, Quantifier.no, Quantifier.all, false),      // All A are B. No B are C. -> All A are C.
    SyllogismPattern(Quantifier.no, Quantifier.some, Quantifier.some, false),    // No A are B. Some B are C. -> Some A are C.
    SyllogismPattern(Quantifier.all, Quantifier.some, Quantifier.some, false),   // All A are B. Some B are C. -> Some A are C. (Undistributed middle)
  ];

  LogicalSyllogismPuzzle generatePuzzle() {
    final pattern = _patterns[_random.nextInt(_patterns.length)];
    
    final s1 = _subjects[_random.nextInt(_subjects.length)];
    final s2 = _middleTerms[_random.nextInt(_middleTerms.length)];
    final s3 = _attributes[_random.nextInt(_attributes.length)];

    final premise1 = _formatStatement(pattern.q1, s1, s2);
    final premise2 = _formatStatement(pattern.q2, s2, s3);
    
    String conclusion;
    if (pattern.reverseConclusion) {
      conclusion = 'Therefore, ${_formatStatement(pattern.qConclusion, s3, s1, lowercase: true)}.';
    } else {
      conclusion = 'Therefore, ${_formatStatement(pattern.qConclusion, s1, s3, lowercase: true)}.';
    }

    return LogicalSyllogismPuzzle(
      premise1: premise1,
      premise2: premise2,
      conclusion: conclusion,
      isValid: pattern.isValid,
    );
  }

  String _formatStatement(Quantifier q, String sub, String obj, {bool lowercase = false}) {
    String statement;
    switch (q) {
      case Quantifier.all:
        statement = 'All $sub are $obj';
        break;
      case Quantifier.no:
        statement = 'No $sub are $obj';
        break;
      case Quantifier.some:
        statement = 'Some $sub are $obj';
        break;
      case Quantifier.someNot:
        statement = 'Some $sub are not $obj';
        break;
    }
    
    if (lowercase) {
      return '${statement.substring(0, 1).toLowerCase()}${statement.substring(1)}';
    }
    return '$statement.';
  }
}

class LogicalSyllogismPuzzle {
  final String premise1;
  final String premise2;
  final String conclusion;
  final bool isValid;

  LogicalSyllogismPuzzle({
    required this.premise1,
    required this.premise2,
    required this.conclusion,
    required this.isValid,
  });
}
