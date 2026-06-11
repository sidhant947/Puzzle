import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'slitherlink_screen.dart';

final slitherlinkMetadata = GameMetadata(
  id: 'slitherlink',
  category: 'LOGIC',
  icon: Icons.grain_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => SlitherlinkScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.slitherlinkTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.slitherlinkSubtitle;
