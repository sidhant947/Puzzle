import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'modulo_clock_screen.dart';

final moduloClockMetadata = GameMetadata(
  id: 'modulo_clock',
  category: 'MATH',
  icon: Icons.watch_later_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => ModuloClockScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.moduloClockTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.moduloClockSubtitle;
