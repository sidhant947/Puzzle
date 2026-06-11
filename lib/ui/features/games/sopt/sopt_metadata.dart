import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'sopt_screen.dart';

final soptMetadata = GameMetadata(
  id: 'sopt',
  category: 'MEMORY',
  icon: Icons.shuffle_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SoptScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.soptTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.soptSubtitle;
