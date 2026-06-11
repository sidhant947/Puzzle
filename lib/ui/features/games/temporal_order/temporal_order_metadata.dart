import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'temporal_order_screen.dart';

final temporalOrderMetadata = GameMetadata(
  id: 'temporal_order',
  category: 'MEMORY',
  icon: Icons.history_toggle_off_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => TemporalOrderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.temporalOrderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.temporalOrderSubtitle;
