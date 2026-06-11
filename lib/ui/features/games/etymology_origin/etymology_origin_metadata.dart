import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'etymology_origin_screen.dart';

final etymologyOriginMetadata = GameMetadata(
  id: 'etymology_origin',
  category: 'WORD',
  icon: Icons.history_edu_rounded,
  color: DesignSystem.gameGreen,
  builder: (context) => EtymologyOriginScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.etymologyOriginTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.etymologyOriginSubtitle;
