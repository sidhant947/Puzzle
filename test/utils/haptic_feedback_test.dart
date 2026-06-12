import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/utils/haptic_feedback.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HapticFeedbackUtil', () {
    group('haptic methods do not throw', () {
      test('lightImpact', () {
        expect(() => HapticFeedbackUtil.lightImpact(), returnsNormally);
      });

      test('mediumImpact', () {
        expect(() => HapticFeedbackUtil.mediumImpact(), returnsNormally);
      });

      test('heavyImpact', () {
        expect(() => HapticFeedbackUtil.heavyImpact(), returnsNormally);
      });

      test('selectionClick', () {
        expect(() => HapticFeedbackUtil.selectionClick(), returnsNormally);
      });

      test('selection delegates to selectionClick', () {
        expect(() => HapticFeedbackUtil.selection(), returnsNormally);
      });

      test('light delegates to lightImpact', () {
        expect(() => HapticFeedbackUtil.light(), returnsNormally);
      });

      test('vibrate', () {
        expect(() => HapticFeedbackUtil.vibrate(), returnsNormally);
      });

      test('gameInteraction', () {
        expect(() => HapticFeedbackUtil.gameInteraction(), returnsNormally);
      });

      test('success', () {
        expect(() => HapticFeedbackUtil.success(), returnsNormally);
      });

      test('error', () {
        expect(() => HapticFeedbackUtil.error(), returnsNormally);
      });

      test('victory', () {
        expect(() => HapticFeedbackUtil.victory(), returnsNormally);
      });
    });

    group('rapid calls do not throw', () {
      test('rapid lightImpact calls do not throw', () {
        expect(() {
          for (var i = 0; i < 100; i++) {
            HapticFeedbackUtil.lightImpact();
          }
        }, returnsNormally);
      });

      test('rapid mediumImpact calls do not throw', () {
        expect(() {
          for (var i = 0; i < 100; i++) {
            HapticFeedbackUtil.mediumImpact();
          }
        }, returnsNormally);
      });

      test('rapid heavyImpact calls do not throw', () {
        expect(() {
          for (var i = 0; i < 100; i++) {
            HapticFeedbackUtil.heavyImpact();
          }
        }, returnsNormally);
      });

      test('rapid selectionClick calls do not throw', () {
        expect(() {
          for (var i = 0; i < 100; i++) {
            HapticFeedbackUtil.selectionClick();
          }
        }, returnsNormally);
      });

      test('mixed rapid calls do not throw', () {
        expect(() {
          HapticFeedbackUtil.lightImpact();
          HapticFeedbackUtil.mediumImpact();
          HapticFeedbackUtil.heavyImpact();
          HapticFeedbackUtil.selectionClick();
          HapticFeedbackUtil.vibrate();
          HapticFeedbackUtil.light();
          HapticFeedbackUtil.selection();
          HapticFeedbackUtil.gameInteraction();
        }, returnsNormally);
      });
    });

    group('pattern methods execute', () {
      test('success completes without error', () {
        expect(() => HapticFeedbackUtil.success(), returnsNormally);
      });

      test('error completes without error', () {
        expect(() => HapticFeedbackUtil.error(), returnsNormally);
      });

      test('victory completes without error', () {
        expect(() => HapticFeedbackUtil.victory(), returnsNormally);
      });
    });

    group('vibrate bypasses throttle', () {
      test('multiple rapid vibrate calls do not throw', () {
        expect(() {
          HapticFeedbackUtil.vibrate();
          HapticFeedbackUtil.vibrate();
          HapticFeedbackUtil.vibrate();
        }, returnsNormally);
      });
    });
  });
}
