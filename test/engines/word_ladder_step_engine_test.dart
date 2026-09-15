import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/word_ladder_step/word_ladder_step_engine.dart';

void main() {
  group('WordLadderStepEngine', () {
    test('generateQuestion produces valid 1-step transition ladder', () {
      for (int i = 0; i < 50; i++) {
        final q = WordLadderStepEngine.generateQuestion();
        expect(q.startWord.length, equals(q.correctMiddleWord.length));
        expect(q.correctMiddleWord.length, equals(q.endWord.length));

        int startToMidDiffs = 0;
        for (int j = 0; j < q.startWord.length; j++) {
          if (q.startWord[j] != q.correctMiddleWord[j]) startToMidDiffs++;
        }
        expect(startToMidDiffs, equals(1), reason: '${q.startWord} -> ${q.correctMiddleWord} has $startToMidDiffs differences, expected 1');

        int midToEndDiffs = 0;
        for (int j = 0; j < q.correctMiddleWord.length; j++) {
          if (q.correctMiddleWord[j] != q.endWord[j]) midToEndDiffs++;
        }
        expect(midToEndDiffs, equals(1), reason: '${q.correctMiddleWord} -> ${q.endWord} has $midToEndDiffs differences, expected 1');
      }
    });
  });
}
