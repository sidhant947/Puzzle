import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'bridges_screen.dart';

final bridgesMetadata = GameMetadata(
  id: 'bridges',
  category: 'LOGIC',
  icon: Icons.horizontal_rule_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => BridgesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.bridgesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.bridgesSubtitle;
