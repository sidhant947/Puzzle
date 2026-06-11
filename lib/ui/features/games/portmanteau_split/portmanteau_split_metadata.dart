import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'portmanteau_split_screen.dart';

final portmanteauSplitMetadata = GameMetadata(
  id: 'portmanteau_split',
  category: 'WORD',
  icon: Icons.call_split_rounded,
  color: DesignSystem.gameIndigo,
  builder: (context) => PortmanteauSplitScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_,
);

String _title(BuildContext context) => AppLocalizations.of(context)!.portmanteauSplitTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.portmanteauSplitSubtitle;
