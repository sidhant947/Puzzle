import 'dart:math' as math;

enum VennRegion { onlyA, onlyB, intersection, outside }

class SetVennQuestion {
  final String formula; // e.g. "A ∩ B", "A \ B", "(A ∪ B)'", "B"
  final Set<VennRegion> correctRegions;
  final String setAName;
  final String setBName;

  SetVennQuestion({
    required this.formula,
    required this.correctRegions,
    required this.setAName,
    required this.setBName,
  });
}

class SetTheoryVennEngine {
  static final List<SetVennQuestion> _templates = [
    SetVennQuestion(
      formula: 'A ∩ B (Intersection)',
      correctRegions: {VennRegion.intersection},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'A ∪ B (Union)',
      correctRegions: {VennRegion.onlyA, VennRegion.onlyB, VennRegion.intersection},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'A \\ B (Difference: A minus B)',
      correctRegions: {VennRegion.onlyA},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'B \\ A (Difference: B minus A)',
      correctRegions: {VennRegion.onlyB},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: '(A ∪ B)\' (Complement of Union)',
      correctRegions: {VennRegion.outside},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'A\' (Complement of A)',
      correctRegions: {VennRegion.onlyB, VennRegion.outside},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'B\' (Complement of B)',
      correctRegions: {VennRegion.onlyA, VennRegion.outside},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
    SetVennQuestion(
      formula: 'A Δ B (Symmetric Difference)',
      correctRegions: {VennRegion.onlyA, VennRegion.onlyB},
      setAName: 'SET A',
      setBName: 'SET B',
    ),
  ];

  static SetVennQuestion generateQuestion({math.Random? random}) {
    final rng = random ?? math.Random();
    return _templates[rng.nextInt(_templates.length)];
  }
}
