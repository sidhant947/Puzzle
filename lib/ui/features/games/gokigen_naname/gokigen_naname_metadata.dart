import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'gokigen_naname_screen.dart';

final gokigenNanameMetadata = GameMetadata(
  id: 'gokigen_naname',
  category: 'LOGIC',
  icon: Icons.grid_goldenratio_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => const GokigenNanameScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.gokigenNanameTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.gokigenNanameSubtitle;
