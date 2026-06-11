import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'pixel_mimic_screen.dart';

final pixelMimicMetadata = GameMetadata(
  id: 'pixel_mimic',
  category: 'MEMORY',
  icon: Icons.memory_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => PixelMimicScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.pixelMimicTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.pixelMimicSubtitle;
