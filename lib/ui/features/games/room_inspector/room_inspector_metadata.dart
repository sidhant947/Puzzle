import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'room_inspector_screen.dart';

final roomInspectorMetadata = GameMetadata(
  id: 'room_inspector',
  category: 'MEMORY',
  icon: Icons.meeting_room_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const RoomInspectorScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.roomInspectorTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.roomInspectorSubtitle;
