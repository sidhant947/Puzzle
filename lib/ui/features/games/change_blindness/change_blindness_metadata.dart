import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'change_blindness_screen.dart';

final changeBlindnessMetadata = GameMetadata(
  id: 'change_blindness',
  category: 'ATTENTION',
  icon: Icons.flip_camera_android_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => ChangeBlindnessScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.changeBlindnessTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.changeBlindnessSubtitle;
