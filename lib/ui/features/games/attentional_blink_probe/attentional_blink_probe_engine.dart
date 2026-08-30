import 'dart:math' as math;

class RSVPItem {
  final String text;
  final bool isT1;
  final bool isT2;

  RSVPItem(this.text, {this.isT1 = false, this.isT2 = false});
}

class RSVPStreamTrial {
  final List<RSVPItem> stream;
  final String t1Letter; // White letter among black distractor numbers
  final String? t2Letter; // Black letter 'X' appearing lag 2 to 5 after T1
  final bool t2Present;

  RSVPStreamTrial({
    required this.stream,
    required this.t1Letter,
    required this.t2Letter,
    required this.t2Present,
  });
}

class AttentionalBlinkProbeEngine {
  static const List<String> letterPool = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K'];

  static RSVPStreamTrial generateTrial({math.Random? random}) {
    final rng = random ?? math.Random();
    final stream = <RSVPItem>[];

    // 15 items in RSVP stream (mostly random 2-digit numbers)
    final t1Index = 4 + rng.nextInt(3); // position 4-6
    final lag = 2 + rng.nextInt(4); // lag 2-5 (attentional blink window)
    final t2Index = t1Index + lag;
    final t2Present = rng.nextBool();

    final t1Char = letterPool[rng.nextInt(letterPool.length)];
    final t2Char = t2Present ? 'X' : null;

    for (int i = 0; i < 15; i++) {
      if (i == t1Index) {
        stream.add(RSVPItem(t1Char, isT1: true));
      } else if (i == t2Index && t2Present) {
        stream.add(RSVPItem('X', isT2: true));
      } else {
        final numVal = rng.nextInt(90) + 10;
        stream.add(RSVPItem('$numVal'));
      }
    }

    return RSVPStreamTrial(
      stream: stream,
      t1Letter: t1Char,
      t2Letter: t2Char,
      t2Present: t2Present,
    );
  }
}
