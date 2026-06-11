import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'target_10_screen.dart';

final target_10Metadata = GameMetadata(
  id: 'target_10',
  category: 'MATH',
  icon: Icons.exposure_zero_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => Target10Screen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.target10Title;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.target10Subtitle;
