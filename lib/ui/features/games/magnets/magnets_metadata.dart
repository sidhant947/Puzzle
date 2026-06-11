import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'magnets_screen.dart';

final magnetsMetadata = GameMetadata(
  id: 'magnets',
  category: 'LOGIC',
  icon: Icons.exposure_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MagnetsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.magnetsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.magnetsSubtitle;
