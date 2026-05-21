import 'dart:math';

enum PitchType { low, mid, high }
enum CardShape { circle, square, triangle, star }
enum CardColor { amber, teal, berry, indigo }

class DualCodingStimulus {
  final PitchType pitch;
  final CardShape shape;
  final CardColor color;

  DualCodingStimulus({
    required this.pitch,
    required this.shape,
    required this.color,
  });

  bool matchesCard(DualCodingStimulus other) {
    return shape == other.shape && color == other.color;
  }

  bool matchesPitch(DualCodingStimulus other) {
    return pitch == other.pitch;
  }
}

class DualCodingEngine {
  final Random _random = Random();

  DualCodingStimulus generateNext(List<DualCodingStimulus> history, int n) {
    if (history.length < n) {
      return DualCodingStimulus(
        pitch: PitchType.values[_random.nextInt(PitchType.values.length)],
        shape: CardShape.values[_random.nextInt(CardShape.values.length)],
        color: CardColor.values[_random.nextInt(CardColor.values.length)],
      );
    }

    final double r = _random.nextDouble();
    PitchType nextPitch;
    CardShape nextShape;
    CardColor nextColor;

    final target = history[history.length - n];

    if (r < 0.3) {
      // Pitch match
      nextPitch = target.pitch;
      nextShape = CardShape.values[_random.nextInt(CardShape.values.length)];
      nextColor = CardColor.values[_random.nextInt(CardColor.values.length)];
    } else if (r < 0.6) {
      // Card match
      nextPitch = PitchType.values[_random.nextInt(PitchType.values.length)];
      nextShape = target.shape;
      nextColor = target.color;
    } else if (r < 0.8) {
      // Both match
      nextPitch = target.pitch;
      nextShape = target.shape;
      nextColor = target.color;
    } else {
      // Purely random
      nextPitch = PitchType.values[_random.nextInt(PitchType.values.length)];
      nextShape = CardShape.values[_random.nextInt(CardShape.values.length)];
      nextColor = CardColor.values[_random.nextInt(CardColor.values.length)];
    }

    return DualCodingStimulus(
      pitch: nextPitch,
      shape: nextShape,
      color: nextColor,
    );
  }
}
