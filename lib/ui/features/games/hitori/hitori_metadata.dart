import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'hitori_screen.dart';

final hitoriMetadata = GameMetadata(
  id: 'hitori',
  category: 'LOGIC',
  icon: Icons.grid_off_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => HitoriScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.hitoriTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.hitoriSubtitle;
