import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'focus_tunnel_screen.dart';

final focusTunnelMetadata = GameMetadata(
  id: 'focus_tunnel',
  category: 'ATTENTION',
  icon: Icons.camera_roll_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const FocusTunnelScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.focusTunnelTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.focusTunnelSubtitle;
