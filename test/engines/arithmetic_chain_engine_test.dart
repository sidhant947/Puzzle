import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/arithmetic_chain/arithmetic_chain_engine.dart';

void main() {
  group('ArithmeticChainEngine', () {
    late ArithmeticChainEngine engine;

    setUp(() {
      engine = ArithmeticChainEngine();
    });

    group('generateChain', () {
      test('returns a map with start, operations, and answer', () {
        final chain = engine.generateChain();
        expect(chain.containsKey('start'), isTrue);
        expect(chain.containsKey('operations'), isTrue);
        expect(chain.containsKey('answer'), isTrue);
      });

      test('start is a positive integer', () {
        final chain = engine.generateChain();
        expect(chain['start'], isA<int>());
        expect(chain['start'], greaterThanOrEqualTo(2));
      });

      test('operations list has correct length', () {
        final chain = engine.generateChain(length: 5);
        final ops = chain['operations'] as List<Map<String, dynamic>>;
        expect(ops.length, 5);
      });

      test('each operation has op and val keys', () {
        final chain = engine.generateChain(length: 3);
        final ops = chain['operations'] as List<Map<String, dynamic>>;
        for (final op in ops) {
          expect(op.containsKey('op'), isTrue);
          expect(op.containsKey('val'), isTrue);
          expect(op['op'], isA<String>());
          expect(op['val'], isA<int>());
        }
      });

      test('operations use valid operators', () {
        final chain = engine.generateChain(length: 10);
        final ops = chain['operations'] as List<Map<String, dynamic>>;
        for (final op in ops) {
          expect(['+', '-', '×', '÷'], contains(op['op']));
        }
      });

      test('answer is a positive integer', () {
        // Run multiple times since random
        for (int i = 0; i < 10; i++) {
          final chain = engine.generateChain();
          expect(chain['answer'], isA<int>());
          expect(chain['answer'], greaterThanOrEqualTo(0));
        }
      });

      test('custom length generates correct number of operations', () {
        final chain = engine.generateChain(length: 8);
        final ops = chain['operations'] as List<Map<String, dynamic>>;
        expect(ops.length, 8);
      });
    });
  });
}
