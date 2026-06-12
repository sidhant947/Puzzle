import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/face_name_association/face_name_association_engine.dart';

void main() {
  group('FaceNameAssociationEngine', () {
    late FaceNameAssociationEngine engine;

    setUp(() {
      engine = FaceNameAssociationEngine();
    });

    group('generateFaces', () {
      test('returns the requested number of faces', () {
        final faces = engine.generateFaces(4);
        expect(faces.length, 4);
      });

      test('each face has icon, color, and name', () {
        final faces = engine.generateFaces(3);
        for (final face in faces) {
          expect(face.icon, isNotNull);
          expect(face.color, isNotNull);
          expect(face.name.isNotEmpty, isTrue);
        }
      });

      test('faces have unique names within request', () {
        final faces = engine.generateFaces(5);
        final names = faces.map((f) => f.name).toList();
        expect(names.toSet().length, names.length);
      });

      test('generates different faces on multiple calls', () {
        final faces1 = engine.generateFaces(4);
        final faces2 = engine.generateFaces(4);
        final names1 = faces1.map((f) => f.name).toList();
        final names2 = faces2.map((f) => f.name).toList();
        expect(names1, isNot(equals(names2)));
      });
    });

    group('generateOptions', () {
      test('returns requested number of options', () {
        final allNames = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
        final options = engine.generateOptions('Alice', allNames, 4);
        expect(options.length, 4);
      });

      test('correct name is among the options', () {
        final allNames = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
        final options = engine.generateOptions('Alice', allNames, 4);
        expect(options.contains('Alice'), isTrue);
      });

      test('all options are unique', () {
        final allNames = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
        final options = engine.generateOptions('Bob', allNames, 3);
        expect(options.toSet().length, options.length);
      });

      test('no duplicate of correct name in options', () {
        final allNames = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
        final options = engine.generateOptions('Alice', allNames, 3);
        expect(options.where((n) => n == 'Alice').length, 1);
      });
    });
  });
}
