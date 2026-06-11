import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'oxymoron_hunt_screen.dart';

final oxymoronHuntMetadata = GameMetadata(
  id: 'oxymoron_hunt',
  category: 'WORD',
  icon: Icons.contrast_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => OxymoronHuntScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.oxymoronHuntTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.oxymoronHuntSubtitle;
