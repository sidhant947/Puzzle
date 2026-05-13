import 'package:flutter/material.dart';
import '../../../utils/design_system.dart';
import '../../../widgets/tangible.dart';

class GameScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final String? subtitle;

  const GameScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceXS),
                child: Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                    fontSize: 11, // Reduced from 14
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            Expanded(child: body),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(
        DesignSystem.spaceMD,
        DesignSystem.spaceSM, // Reduced top padding
        DesignSystem.spaceMD,
        DesignSystem.spaceXS, // Reduced bottom padding
      ),
      child: Row(
        children: [
          TangibleButton(
            color: colorScheme.surface,
            shadowColor: colorScheme.outline,
            onTap: () => Navigator.of(context).pop(),
            padding: const EdgeInsets.all(12), // Compact padding for app bar
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: colorScheme.onSurface,
              size: 18, // Slightly smaller icon
            ),
          ),
          const SizedBox(width: DesignSystem.spaceSM),
          Expanded(
            child: TangibleContainer(
              color: colorScheme.surface,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              radius: DesignSystem.radiusSM,
              depth: 3.0, // Reduced depth for header
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (actions != null) ...[
            const SizedBox(width: DesignSystem.spaceSM),
            ...actions!.map((action) {
              if (action is TangibleButton) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: action,
                );
              }
              return action;
            }),
          ] else
            // Spacer to balance back button width if no actions
            const SizedBox(width: 44 + DesignSystem.spaceSM), 
        ],
      ),
    );
  }
}
