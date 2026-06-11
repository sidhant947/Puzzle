import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'klotski_screen.dart';

final klotskiMetadata = GameMetadata(
  id: 'klotski',
  category: 'SPATIAL',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => KlotskiScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.klotskiTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.klotskiSubtitle;
