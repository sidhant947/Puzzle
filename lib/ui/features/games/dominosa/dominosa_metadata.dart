import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dominosa_screen.dart';

final dominosaMetadata = GameMetadata(
  id: 'dominosa',
  category: 'LOGIC',
  icon: Icons.view_module_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => DominosaScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dominosaTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dominosaSubtitle;
