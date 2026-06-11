import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dnms_screen.dart';

final dnmsMetadata = GameMetadata(
  id: 'dnms',
  category: 'MEMORY',
  icon: Icons.difference_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => DnmsScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dnmsTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dnmsSubtitle;
