import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'modulo_path_screen.dart';

final moduloPathMetadata = GameMetadata(
  id: 'modulo_path',
  category: 'MATH',
  icon: Icons.alarm_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const ModuloPathScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.moduloPathTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.moduloPathSubtitle;
