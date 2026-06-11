import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'rhyme_master_screen.dart';

final rhymeMasterMetadata = GameMetadata(
  id: 'rhyme_master',
  category: 'WORD',
  icon: Icons.music_note_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => RhymeMasterScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.rhymeMasterTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.rhymeMasterSubtitle;
