import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'temporal_order_judgment_screen.dart';

final temporalOrderJudgmentMetadata = GameMetadata(
  id: 'temporal_order_judgment',
  category: 'ATTENTION',
  icon: Icons.timer_outlined,
  color: DesignSystem.gameRose,
  builder: (context) => const TemporalOrderJudgmentScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.temporalOrderJudgmentTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.temporalOrderJudgmentSubtitle;
