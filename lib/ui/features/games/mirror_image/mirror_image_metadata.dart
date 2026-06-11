import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'mirror_image_screen.dart';

final mirrorImageMetadata = GameMetadata(
  id: 'mirror_image',
  category: 'SPATIAL',
  icon: Icons.flip_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => MirrorImageScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.mirrorImageTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.mirrorImageSubtitle;
