import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mandala_recall_screen.dart';

final mandalaRecallMetadata = GameMetadata(
  id: 'mandala_recall',
  category: 'MEMORY',
  icon: Icons.pattern_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => MandalaRecallScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mandalaRecallTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mandalaRecallSubtitle;
