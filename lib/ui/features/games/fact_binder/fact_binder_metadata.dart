import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'fact_binder_screen.dart';

final factBinderMetadata = GameMetadata(
  id: 'fact_binder',
  category: 'MEMORY',
  icon: Icons.folder_shared_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => FactBinderScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.low,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.factBinderTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.factBinderSubtitle;
