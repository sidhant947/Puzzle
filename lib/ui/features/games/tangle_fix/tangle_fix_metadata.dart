import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'tangle_fix_screen.dart';

final tangleFixMetadata = GameMetadata(
  id: 'tangle_fix',
  category: 'LOGIC',
  icon: Icons.gesture_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => TangleFixScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.tangleFixTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.tangleFixSubtitle;
