import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'set_theory_venn_screen.dart';

final setTheoryVennMetadata = GameMetadata(
  id: 'set_theory_venn',
  category: 'MATH',
  icon: Icons.blur_on_rounded,
  color: DesignSystem.gameTeal,
  builder: (context) => const SetTheoryVennScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.setTheoryVennTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.setTheoryVennSubtitle;
