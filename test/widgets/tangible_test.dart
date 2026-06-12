import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/widgets/tangible.dart';

Widget wrapInApp(Widget child) => MaterialApp(
      home: Scaffold(body: child),
    );

void main() {
  group('TangibleContainer', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          child: Text('Hello'),
        ),
      ));
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('renders with default padding', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          child: Text('Content'),
        ),
      ));
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.padding, isNotNull);
    });

    testWidgets('applies custom color', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          color: Colors.red,
          child: Text('Red'),
        ),
      ));
      expect(find.text('Red'), findsOneWidget);
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.red);
    });

    testWidgets('applies custom width and height', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          width: 200,
          height: 100,
          child: Text('Sized'),
        ),
      ));
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxWidth, 200);
      expect(container.constraints?.maxHeight, 100);
    });

    testWidgets('renders border when drawBorder is true', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          drawBorder: true,
          child: Text('Bordered'),
        ),
      ));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNotNull);
    });

    testWidgets('no border when drawBorder is false', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          drawBorder: false,
          child: Text('NoBorder'),
        ),
      ));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNull);
    });

    testWidgets('wraps with GestureDetector when onTap provided', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(wrapInApp(
        TangibleContainer(
          onTap: () => tapped = true,
          child: const Text('Tappable'),
        ),
      ));
      await tester.tap(find.text('Tappable'));
      expect(tapped, isTrue);
    });

    testWidgets('does not wrap with GestureDetector when no callbacks', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          child: Text('Static'),
        ),
      ));
      expect(find.byType(GestureDetector), findsNothing);
    });

    testWidgets('applies semantics label', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleContainer(
          semanticsLabel: 'My container',
          child: Text('Labeled'),
        ),
      ));
      final semanticsFinder = find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == 'My container',
      );
      expect(semanticsFinder, findsOneWidget);
    });

    testWidgets('sets button semantics when onTap is provided', (tester) async {
      await tester.pumpWidget(wrapInApp(
        TangibleContainer(
          onTap: () {},
          semanticsLabel: 'Button',
          child: const Text('ButtonChild'),
        ),
      ));
      final semanticsFinder = find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.button == true,
      );
      expect(semanticsFinder, findsOneWidget);
    });

    testWidgets('handles onLongPress callback', (tester) async {
      bool longPressed = false;
      await tester.pumpWidget(wrapInApp(
        TangibleContainer(
          onLongPress: () => longPressed = true,
          child: const Text('LongPress'),
        ),
      ));
      await tester.longPress(find.text('LongPress'));
      expect(longPressed, isTrue);
    });
  });

  group('TangibleButton', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          child: Text('Press Me'),
        ),
      ));
      expect(find.text('Press Me'), findsOneWidget);
    });

    testWidgets('applies custom color', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          color: Colors.blue,
          child: Text('Blue Button'),
        ),
      ));
      expect(find.text('Blue Button'), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(wrapInApp(
        TangibleButton(
          onTap: () => tapped = true,
          child: const Text('Click'),
        ),
      ));
      await tester.tap(find.text('Click'));
      expect(tapped, isTrue);
    });

    testWidgets('calls onLongPress when long pressed', (tester) async {
      bool longPressed = false;
      await tester.pumpWidget(wrapInApp(
        TangibleButton(
          onLongPress: () => longPressed = true,
          child: const Text('Hold'),
        ),
      ));
      await tester.longPress(find.text('Hold'));
      expect(longPressed, isTrue);
    });

    testWidgets('applies semantics label', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          semanticsLabel: 'Submit button',
          child: Text('Submit'),
        ),
      ));
      final semanticsFinder = find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.label == 'Submit button',
      );
      expect(semanticsFinder, findsOneWidget);
    });

    testWidgets('sets button semantics', (tester) async {
      await tester.pumpWidget(wrapInApp(
        TangibleButton(
          onTap: () {},
          semanticsLabel: 'Action',
          child: const Text('Action'),
        ),
      ));
      final semanticsFinder = find.byWidgetPredicate(
        (widget) => widget is Semantics && widget.properties.button == true,
      );
      expect(semanticsFinder, findsOneWidget);
    });

    testWidgets('applies custom width and height', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          width: 150,
          height: 50,
          child: Text('Sized'),
        ),
      ));
      expect(find.text('Sized'), findsOneWidget);
    });

    testWidgets('applies custom radius', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          radius: 32,
          child: Text('Round'),
        ),
      ));
      expect(find.text('Round'), findsOneWidget);
    });

    testWidgets('drawBorder can be disabled', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          drawBorder: false,
          child: Text('No Border'),
        ),
      ));
      expect(find.text('No Border'), findsOneWidget);
    });

    testWidgets('renders TangibleContainer inside RepaintBoundary', (tester) async {
      await tester.pumpWidget(wrapInApp(
        const TangibleButton(
          child: Text('Inner'),
        ),
      ));
      expect(find.byType(RepaintBoundary), findsWidgets);
      expect(find.byType(TangibleContainer), findsOneWidget);
    });
  });
}
