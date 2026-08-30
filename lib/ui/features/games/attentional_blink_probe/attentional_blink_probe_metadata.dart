import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'attentional_blink_probe_screen.dart';

final attentionalBlinkProbeMetadata = GameMetadata(
  id: 'attentional_blink_probe',
  category: 'ATTENTION',
  icon: Icons.flash_on_rounded,
  color: DesignSystem.gameRose,
  builder: (context) => const AttentionalBlinkProbeScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.attentionalBlinkProbeTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.attentionalBlinkProbeSubtitle;
