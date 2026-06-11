import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/widgets/tangible.dart';

class GameSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String searchQuery;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const GameSearchBar({
    super.key,
    required this.controller,
    required this.searchQuery,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return TangibleContainer(
      padding: EdgeInsets.zero,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: l10n.searchGames.toUpperCase(),
          hintStyle: TextStyle(
            fontFamily: 'Geist',
            fontSize: DesignSystem.fontSizeSM,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          suffixIcon: searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    size: 20,
                  ),
                  onPressed: onClear,
                )
              : null,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(
          fontFamily: 'Geist',
          fontSize: DesignSystem.fontSizeMD,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
