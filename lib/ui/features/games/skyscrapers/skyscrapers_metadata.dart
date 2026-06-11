import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'skyscrapers_screen.dart';

final skyscrapersMetadata = GameMetadata(
  id: 'skyscrapers',
  category: 'LOGIC',
  icon: Icons.domain_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => SkyscrapersScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.skyscrapersTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.skyscrapersSubtitle;
