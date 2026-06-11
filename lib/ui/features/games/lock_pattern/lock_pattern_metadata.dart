import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'lock_pattern_screen.dart';

final lockPatternMetadata = GameMetadata(
  id: 'lock_pattern',
  category: 'LOGIC',
  icon: Icons.lock_open_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => LockPatternScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.lockPatternTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.lockPatternSubtitle;
