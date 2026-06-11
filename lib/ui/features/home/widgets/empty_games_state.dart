import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/design_system.dart';

class EmptyGamesState extends StatelessWidget {
  const EmptyGamesState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: colorScheme.onSurface.withValues(alpha: 0.1),
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Text(
            l10n.noGamesMatch.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontSize: DesignSystem.fontSizeLG,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}
