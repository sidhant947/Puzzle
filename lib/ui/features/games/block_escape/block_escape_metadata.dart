import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'block_escape_screen.dart';

final blockEscapeMetadata = GameMetadata(
  id: 'block_escape',
  category: 'LOGIC',
  icon: Icons.view_column_rounded,
  color: DesignSystem.gameOrange,
  builder: (context) => BlockEscapeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.blockEscapeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.blockEscapeSubtitle;
