import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'peripheral_focus_screen.dart';

final peripheralFocusMetadata = GameMetadata(
  id: 'peripheral_focus',
  category: 'ATTENTION',
  icon: Icons.filter_center_focus_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const PeripheralFocusScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.peripheralFocusTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.peripheralFocusSubtitle;
