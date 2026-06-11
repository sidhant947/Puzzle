import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'etymon_oddball_screen.dart';

final etymonOddballMetadata = GameMetadata(
  id: 'etymon_oddball',
  category: 'WORD',
  icon: Icons.psychology_alt_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => EtymonOddballScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.etymonOddballTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.etymonOddballSubtitle;
