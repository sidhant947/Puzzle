import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'tapa_screen.dart';

final tapaMetadata = GameMetadata(
  id: 'tapa',
  category: 'LOGIC',
  icon: Icons.border_all_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => const TapaScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tapaTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tapaSubtitle;
