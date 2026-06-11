import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'reflex_tap_screen.dart';

final reflexTapMetadata = GameMetadata(
  id: 'reflex_tap',
  category: 'ATTENTION',
  icon: Icons.ads_click_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => ReflexTapScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.reflexTapTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.reflexTapSubtitle;
