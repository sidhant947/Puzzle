import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'perspective_shift_view_screen.dart';

final perspectiveShiftViewMetadata = GameMetadata(
  id: 'perspective_shift_view',
  category: 'SPATIAL',
  icon: Icons.rotate_90_degrees_ccw_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => const PerspectiveShiftViewScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.perspectiveShiftViewTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.perspectiveShiftViewSubtitle;
