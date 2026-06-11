import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'topology_screen.dart';

final topologyMetadata = GameMetadata(
  id: 'topology',
  category: 'SPATIAL',
  icon: Icons.category_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => TopologyScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.topologyTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.topologySubtitle;
