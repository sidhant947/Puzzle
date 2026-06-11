import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'wisconsin_card_sorting_screen.dart';

final wisconsinCardSortingMetadata = GameMetadata(
  id: 'wisconsin_card_sorting',
  category: 'LOGIC',
  icon: Icons.style_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => WisconsinCardSortingScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.wisconsinCardSortingTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.wisconsinCardSortingSubtitle;
