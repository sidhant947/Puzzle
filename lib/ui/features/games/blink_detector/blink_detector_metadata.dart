import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'blink_detector_screen.dart';

final blinkDetectorMetadata = GameMetadata(
  id: 'blink_detector',
  category: 'ATTENTION',
  icon: Icons.remove_red_eye_sharp,
  color: DesignSystem.gameBlue,
  builder: (context) => const BlinkDetectorScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.blinkDetectorTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.blinkDetectorSubtitle;
