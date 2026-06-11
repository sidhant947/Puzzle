import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'affix_factory_screen.dart';

final affixFactoryMetadata = GameMetadata(
  id: 'affix_factory',
  category: 'WORD',
  icon: Icons.add_box_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => AffixFactoryScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.affixFactoryTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.affixFactorySubtitle;
