import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/data/game_registry.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/l10n/app_localizations.dart';

Widget _defaultBuilder(BuildContext context) => const SizedBox();
String _defaultTitleGetter(BuildContext context) => 'Title';
String _defaultSubtitleGetter(BuildContext context) => 'Subtitle';

void main() {
  const validCategories = {
    'ATTENTION',
    'LOGIC',
    'MATH',
    'WORD',
    'MEMORY',
    'SPATIAL',
  };

  group('allGamesMetadata', () {
    test('is not empty', () {
      expect(allGamesMetadata, isNotEmpty);
    });

    test('has no duplicate IDs', () {
      final ids = allGamesMetadata.map((g) => g.id).toList();
      final uniqueIds = ids.toSet();
      expect(ids.length, equals(uniqueIds.length),
          reason: 'Duplicate game IDs found: ${ids.where((id) => ids.indexOf(id) != ids.lastIndexOf(id)).toSet()}');
    });

    for (final metadata in allGamesMetadata) {
      group('${metadata.id}', () {
        test('has a non-empty id', () {
          expect(metadata.id, isNotEmpty);
        });

        test('has a valid category', () {
          expect(validCategories.contains(metadata.category), isTrue,
              reason: 'Invalid category "${metadata.category}" for game "${metadata.id}". Valid categories: $validCategories');
        });

        test('has a non-null icon', () {
          expect(metadata.icon, isNotNull);
        });

        test('has a non-null color', () {
          expect(metadata.color, isNotNull);
        });

        test('has a non-null builder', () {
          expect(metadata.builder, isNotNull);
        });

        testWidgets('builder returns a widget', (tester) async {
          await tester.pumpWidget(MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(body: Container()),
          ));
          final context = tester.element(find.byType(Container));
          final widget = metadata.builder(context);
          expect(widget, isA<Widget>());
        });

        testWidgets('titleGetter returns a non-empty string', (tester) async {
          await tester.pumpWidget(MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(body: Container()),
          ));
          final context = tester.element(find.byType(Container));
          final title = metadata.titleGetter(context);
          expect(title, isA<String>());
          expect(title, isNotEmpty);
        });

        testWidgets('subtitleGetter returns a non-empty string', (tester) async {
          await tester.pumpWidget(MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(body: Container()),
          ));
          final context = tester.element(find.byType(Container));
          final subtitle = metadata.subtitleGetter(context);
          expect(subtitle, isA<String>());
          expect(subtitle, isNotEmpty);
        });

        test('has a valid popularity', () {
          expect(metadata.popularity, isNotNull);
          expect(
            metadata.popularity == Popularity.high ||
                metadata.popularity == Popularity.default_ ||
                metadata.popularity == Popularity.low,
            isTrue,
          );
        });
      });
    }
  });

  group('GameMetadata', () {
    test('toMap returns all fields', () {
      const metadata = GameMetadata(
        id: 'test_game',
        category: 'LOGIC',
        icon: Icons.abc,
        color: Colors.blue,
        builder: _defaultBuilder,
        titleGetter: _defaultTitleGetter,
        subtitleGetter: _defaultSubtitleGetter,
        popularity: Popularity.high,
      );

      final map = metadata.toMap();
      expect(map['id'], 'test_game');
      expect(map['category'], 'LOGIC');
      expect(map['icon'], Icons.abc);
      expect(map['color'], Colors.blue);
      expect(map['popularity'], Popularity.high);
    });
  });
}
