import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'akari_screen.dart';

final akariMetadata = GameMetadata(
  id: 'akari',
  category: 'LOGIC',
  icon: Icons.lightbulb_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => AkariScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.akariTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.akariSubtitle;
