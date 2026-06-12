import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/utils/design_system.dart';

void main() {
  group('DesignSystem', () {
    group('font size scale', () {
      test('fontSizeHero is 36.0', () {
        expect(DesignSystem.fontSizeHero, 36.0);
      });

      test('fontSize3XL is 28.0', () {
        expect(DesignSystem.fontSize3XL, 28.0);
      });

      test('fontSize2XL is 24.0', () {
        expect(DesignSystem.fontSize2XL, 24.0);
      });

      test('fontSizeXL is 20.0', () {
        expect(DesignSystem.fontSizeXL, 20.0);
      });

      test('fontSizeLG is 18.0', () {
        expect(DesignSystem.fontSizeLG, 18.0);
      });

      test('fontSizeMD is 16.0', () {
        expect(DesignSystem.fontSizeMD, 16.0);
      });

      test('fontSizeSM is 14.0', () {
        expect(DesignSystem.fontSizeSM, 14.0);
      });

      test('fontSizeXS is 13.0', () {
        expect(DesignSystem.fontSizeXS, 13.0);
      });

      test('fontSize2XS is 12.0', () {
        expect(DesignSystem.fontSize2XS, 12.0);
      });

      test('font sizes are in descending order', () {
        expect(DesignSystem.fontSizeHero, greaterThan(DesignSystem.fontSize3XL));
        expect(DesignSystem.fontSize3XL, greaterThan(DesignSystem.fontSize2XL));
        expect(DesignSystem.fontSize2XL, greaterThan(DesignSystem.fontSizeXL));
        expect(DesignSystem.fontSizeXL, greaterThan(DesignSystem.fontSizeLG));
        expect(DesignSystem.fontSizeLG, greaterThan(DesignSystem.fontSizeMD));
        expect(DesignSystem.fontSizeMD, greaterThan(DesignSystem.fontSizeSM));
        expect(DesignSystem.fontSizeSM, greaterThan(DesignSystem.fontSizeXS));
        expect(DesignSystem.fontSizeXS, greaterThan(DesignSystem.fontSize2XS));
      });
    });

    group('spacing', () {
      test('all spacing values are positive', () {
        expect(DesignSystem.spaceXS, greaterThan(0));
        expect(DesignSystem.spaceSM, greaterThan(0));
        expect(DesignSystem.spaceMD, greaterThan(0));
        expect(DesignSystem.spaceLG, greaterThan(0));
        expect(DesignSystem.spaceXL, greaterThan(0));
        expect(DesignSystem.space2XL, greaterThan(0));
        expect(DesignSystem.space3XL, greaterThan(0));
      });

      test('spacing values are in ascending order', () {
        expect(DesignSystem.spaceXS, lessThan(DesignSystem.spaceSM));
        expect(DesignSystem.spaceSM, lessThan(DesignSystem.spaceMD));
        expect(DesignSystem.spaceMD, lessThan(DesignSystem.spaceLG));
        expect(DesignSystem.spaceLG, lessThan(DesignSystem.spaceXL));
        expect(DesignSystem.spaceXL, lessThan(DesignSystem.space2XL));
        expect(DesignSystem.space2XL, lessThan(DesignSystem.space3XL));
      });
    });

    group('radius', () {
      test('all radius values are positive', () {
        expect(DesignSystem.radiusXS, greaterThan(0));
        expect(DesignSystem.radiusSM, greaterThan(0));
        expect(DesignSystem.radiusMD, greaterThan(0));
        expect(DesignSystem.radiusLG, greaterThan(0));
        expect(DesignSystem.radiusXL, greaterThan(0));
        expect(DesignSystem.radius2XL, greaterThan(0));
        expect(DesignSystem.radiusFull, greaterThan(0));
      });

      test('radiusFull is 999', () {
        expect(DesignSystem.radiusFull, 999.0);
      });
    });

    group('colors', () {
      test('primary color is defined', () {
        expect(DesignSystem.primary, isNotNull);
      });

      test('error color is defined', () {
        expect(DesignSystem.error, isNotNull);
      });

      test('success color is defined', () {
        expect(DesignSystem.success, isNotNull);
      });

      test('warning color is defined', () {
        expect(DesignSystem.warning, isNotNull);
      });

      test('light theme colors are defined', () {
        expect(DesignSystem.background, isNotNull);
        expect(DesignSystem.surface, isNotNull);
        expect(DesignSystem.ink, isNotNull);
        expect(DesignSystem.inkSlate, isNotNull);
        expect(DesignSystem.outline, isNotNull);
        expect(DesignSystem.outlineVariant, isNotNull);
      });

      test('dark theme colors are defined', () {
        expect(DesignSystem.darkBackground, isNotNull);
        expect(DesignSystem.darkSurface, isNotNull);
        expect(DesignSystem.darkInk, isNotNull);
        expect(DesignSystem.darkInkSlate, isNotNull);
        expect(DesignSystem.darkOutline, isNotNull);
        expect(DesignSystem.darkOutlineVariant, isNotNull);
      });

      test('game accent colors are defined', () {
        expect(DesignSystem.gameBlue, isNotNull);
        expect(DesignSystem.gameGreen, isNotNull);
        expect(DesignSystem.gamePurple, isNotNull);
        expect(DesignSystem.gameOrange, isNotNull);
        expect(DesignSystem.gamePink, isNotNull);
        expect(DesignSystem.gameTeal, isNotNull);
        expect(DesignSystem.gameIndigo, isNotNull);
        expect(DesignSystem.gameAmber, isNotNull);
        expect(DesignSystem.gameRose, isNotNull);
        expect(DesignSystem.gameViolet, isNotNull);
        expect(DesignSystem.gameCyan, isNotNull);
        expect(DesignSystem.gameEmerald, isNotNull);
      });
    });

    group('responsive breakpoints', () {
      test('mobileMax is 600', () {
        expect(DesignSystem.mobileMax, 600);
      });

      test('tabletMax is 1024', () {
        expect(DesignSystem.tabletMax, 1024);
      });

      test('desktopMax is 1440', () {
        expect(DesignSystem.desktopMax, 1440);
      });

      test('breakpoints are in ascending order', () {
        expect(DesignSystem.mobileMax, lessThan(DesignSystem.tabletMax));
        expect(DesignSystem.tabletMax, lessThan(DesignSystem.desktopMax));
      });
    });

    group('animation durations', () {
      test('durationFast is 150ms', () {
        expect(DesignSystem.durationFast, const Duration(milliseconds: 150));
      });

      test('durationNormal is 250ms', () {
        expect(DesignSystem.durationNormal, const Duration(milliseconds: 250));
      });

      test('durationSlow is 400ms', () {
        expect(DesignSystem.durationSlow, const Duration(milliseconds: 400));
      });

      test('durationVerySlow is 600ms', () {
        expect(DesignSystem.durationVerySlow, const Duration(milliseconds: 600));
      });

      test('durations are in ascending order', () {
        expect(DesignSystem.durationFast, lessThan(DesignSystem.durationNormal));
        expect(DesignSystem.durationNormal, lessThan(DesignSystem.durationSlow));
        expect(DesignSystem.durationSlow, lessThan(DesignSystem.durationVerySlow));
      });
    });

    group('animation curves', () {
      test('all curves are defined', () {
        expect(DesignSystem.curveFast, isNotNull);
        expect(DesignSystem.curveNormal, isNotNull);
        expect(DesignSystem.curveSlow, isNotNull);
        expect(DesignSystem.curveBounce, isNotNull);
      });
    });

    group('touch targets', () {
      test('minTouchTarget is 48', () {
        expect(DesignSystem.minTouchTarget, 48.0);
      });

      test('recommendedTouchTarget is 56', () {
        expect(DesignSystem.recommendedTouchTarget, 56.0);
      });

      test('minTouchTarget meets accessibility minimum', () {
        expect(DesignSystem.minTouchTarget, greaterThanOrEqualTo(44.0));
      });
    });

    group('padding helpers', () {
      test('screenPadding is defined', () {
        expect(DesignSystem.screenPadding, isNotNull);
      });

      test('padding constants are defined', () {
        expect(DesignSystem.paddingXS, isNotNull);
        expect(DesignSystem.paddingSM, isNotNull);
        expect(DesignSystem.paddingMD, isNotNull);
        expect(DesignSystem.paddingLG, isNotNull);
        expect(DesignSystem.paddingXL, isNotNull);
        expect(DesignSystem.padding2XL, isNotNull);
      });
    });

    group('themes', () {
      test('lightTheme is not null', () {
        expect(DesignSystem.lightTheme, isNotNull);
      });

      test('darkTheme is not null', () {
        expect(DesignSystem.darkTheme, isNotNull);
      });

      test('theme alias returns lightTheme', () {
        expect(DesignSystem.theme, equals(DesignSystem.lightTheme));
      });

      test('lightTheme has brightness.light', () {
        expect(DesignSystem.lightTheme.brightness, Brightness.light);
      });

      test('darkTheme has brightness.dark', () {
        expect(DesignSystem.darkTheme.brightness, Brightness.dark);
      });

      test('lightTheme uses Material 3', () {
        expect(DesignSystem.lightTheme.useMaterial3, isTrue);
      });

      test('darkTheme uses Material 3', () {
        expect(DesignSystem.darkTheme.useMaterial3, isTrue);
      });

      test('lightTheme has correct scaffold background', () {
        expect(DesignSystem.lightTheme.scaffoldBackgroundColor, DesignSystem.background);
      });

      test('darkTheme has correct scaffold background', () {
        expect(DesignSystem.darkTheme.scaffoldBackgroundColor, DesignSystem.darkBackground);
      });
    });

    group('semanticLabel', () {
      test('returns text only when no optional params', () {
        final label = DesignSystem.semanticLabel('Hello');
        expect(label, 'Hello');
      });

      test('includes button label when isButton is true', () {
        final label = DesignSystem.semanticLabel('Submit', isButton: true);
        expect(label, 'Submit, button');
      });

      test('includes hint when provided', () {
        final label = DesignSystem.semanticLabel('Close', hint: 'closes dialog');
        expect(label, 'Close, closes dialog');
      });

      test('includes both button and hint', () {
        final label = DesignSystem.semanticLabel('OK', isButton: true, hint: 'confirms');
        expect(label, 'OK, button, confirms');
      });
    });

    group('compatibility aliases', () {
      test('aliases match original colors', () {
        expect(DesignSystem.lightError, DesignSystem.error);
        expect(DesignSystem.lightSurface, DesignSystem.surface);
        expect(DesignSystem.darkSurfaceElevated, DesignSystem.darkSurface);
        expect(DesignSystem.lightSurfaceElevated, DesignSystem.surface);
        expect(DesignSystem.lightOutline, DesignSystem.outline);
        expect(DesignSystem.lightOutlineVariant, DesignSystem.outlineVariant);
        expect(DesignSystem.lightOnSurfaceMuted, DesignSystem.inkSlate);
        expect(DesignSystem.accentIndigo, DesignSystem.primary);
        expect(DesignSystem.accentOrange, DesignSystem.accentAmber);
        expect(DesignSystem.accentGreen, DesignSystem.accentEmerald);
        expect(DesignSystem.accentBlue, DesignSystem.gameBlue);
        expect(DesignSystem.accentPurple, DesignSystem.gamePurple);
        expect(DesignSystem.accentRed, DesignSystem.error);
        expect(DesignSystem.secondary, DesignSystem.accentBerry);
      });
    });
  });
}
