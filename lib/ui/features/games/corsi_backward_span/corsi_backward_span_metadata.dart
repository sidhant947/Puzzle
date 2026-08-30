import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'corsi_backward_span_screen.dart';

final corsiBackwardSpanMetadata = GameMetadata(
  id: 'corsi_backward_span',
  category: 'MEMORY',
  icon: Icons.undo_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => const CorsiBackwardSpanScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.corsiBackwardSpanTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.corsiBackwardSpanSubtitle;
