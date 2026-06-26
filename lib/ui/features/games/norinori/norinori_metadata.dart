import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'norinori_screen.dart';

final norinoriMetadata = GameMetadata(
  id: 'norinori',
  category: 'LOGIC',
  icon: Icons.border_all_rounded,
  color: DesignSystem.gamePurple,
  builder: (context) => const NorinoriScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.norinoriTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.norinoriSubtitle;
