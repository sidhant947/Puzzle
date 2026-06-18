import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'shikaku_screen.dart';

final shikakuMetadata = GameMetadata(
  id: 'shikaku',
  category: 'LOGIC',
  icon: Icons.grid_on_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => const ShikakuScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.shikakuTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.shikakuSubtitle;
