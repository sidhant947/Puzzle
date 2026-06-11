import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'verbal_analogies_screen.dart';

final verbalAnalogiesMetadata = GameMetadata(
  id: 'verbal_analogies',
  category: 'WORD',
  icon: Icons.compare_arrows_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => VerbalAnalogiesScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.verbalAnalogiesTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.verbalAnalogiesSubtitle;
