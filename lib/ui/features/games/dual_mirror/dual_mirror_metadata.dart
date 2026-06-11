import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'dual_mirror_screen.dart';

final dualMirrorMetadata = GameMetadata(
  id: 'dual_mirror',
  category: 'ATTENTION',
  icon: Icons.compare_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => DualMirrorScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.dualMirrorTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.dualMirrorSubtitle;
