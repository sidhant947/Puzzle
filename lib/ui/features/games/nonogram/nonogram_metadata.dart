import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'nonogram_screen.dart';

final nonogramMetadata = GameMetadata(
  id: 'nonogram',
  category: 'LOGIC',
  icon: Icons.grid_view_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => NonogramScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.nonogramTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.nonogramSubtitle;
