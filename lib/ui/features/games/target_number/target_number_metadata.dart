import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'target_number_screen.dart';

final targetNumberMetadata = GameMetadata(
  id: 'target_number',
  category: 'MATH',
  icon: Icons.track_changes_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => TargetNumberScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.targetNumberTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.targetNumberSubtitle(24);
