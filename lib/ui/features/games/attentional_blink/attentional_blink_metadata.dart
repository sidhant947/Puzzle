import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'attentional_blink_screen.dart';

final attentionalBlinkMetadata = GameMetadata(
  id: 'attentional_blink',
  category: 'ATTENTION',
  icon: Icons.visibility_off_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => AttentionalBlinkScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.attentionalBlinkTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.attentionalBlinkSubtitle;
