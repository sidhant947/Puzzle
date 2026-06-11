import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sequence_sleuth_screen.dart';

final sequenceSleuthMetadata = GameMetadata(
  id: 'sequence_sleuth',
  category: 'MATH',
  icon: Icons.linear_scale_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => SequenceSleuthScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.sequenceSleuthTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.sequenceSleuthSubtitle;
