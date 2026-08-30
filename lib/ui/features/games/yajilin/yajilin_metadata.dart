import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'yajilin_screen.dart';

final yajilinMetadata = GameMetadata(
  id: 'yajilin',
  category: 'LOGIC',
  icon: Icons.repeat_rounded,
  color: DesignSystem.gameAmber,
  builder: (context) => const YajilinScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.yajilinTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.yajilinSubtitle;
