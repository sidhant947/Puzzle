import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/go_no_go/go_no_go_engine.dart';

void main() {
  group('GoNoGoEngine', () {
    late GoNoGoEngine engine;

    setUp(() {
      engine = GoNoGoEngine();
    });

    group('generateLevel', () {
      test('returns a GoNoGoLevel', () {
        final level = engine.generateLevel(0);
        expect(level, isA<GoNoGoLevel>());
      });

      test('symbol is either go or noGo', () {
        for (int i = 0; i < 50; i++) {
          final level = engine.generateLevel(0);
          expect(
            level.symbol == GoNoGoSymbol.go || level.symbol == GoNoGoSymbol.noGo,
            isTrue,
          );
        }
      });

      test('duration is within 400-1000ms', () {
        for (int i = 0; i < 50; i++) {
          final level = engine.generateLevel(i);
          expect(level.duration.inMilliseconds, greaterThanOrEqualTo(400));
          expect(level.duration.inMilliseconds, lessThanOrEqualTo(1000));
        }
      });

      test('duration decreases as score increases', () {
        final lowScore = engine.generateLevel(0);
        final highScore = engine.generateLevel(50);
        expect(
          highScore.duration.inMilliseconds,
          lessThanOrEqualTo(lowScore.duration.inMilliseconds),
        );
      });

      test('generates both go and noGo symbols over many trials', () {
        bool hasGo = false;
        bool hasNoGo = false;
        for (int i = 0; i < 100; i++) {
          final level = engine.generateLevel(0);
          if (level.symbol == GoNoGoSymbol.go) hasGo = true;
          if (level.symbol == GoNoGoSymbol.noGo) hasNoGo = true;
        }
        expect(hasGo, isTrue);
        expect(hasNoGo, isTrue);
      });
    });
  });
}
