import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'one_letter_shift_screen.dart';

final oneLetterShiftMetadata = GameMetadata(
  id: 'one_letter_shift',
  category: 'WORD',
  icon: Icons.published_with_changes_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => OneLetterShiftScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.oneLetterShiftTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.oneLetterShiftSubtitle;
