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
    return Scaffold(
      backgroundColor: DesignSystem.background,
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
                  style: const TextStyle(
                    color: DesignSystem.inkSlate,
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
            color: DesignSystem.surface,
            shadowColor: DesignSystem.outlineVariant,
            onTap: () => Navigator.of(context).pop(),
            padding: const EdgeInsets.all(12), // Compact padding for app bar
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: DesignSystem.ink,
              size: 18, // Slightly smaller icon
            ),
          ),
          const SizedBox(width: DesignSystem.spaceSM),
          Expanded(
            child: TangibleContainer(
              color: DesignSystem.surface,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              radius: DesignSystem.radiusSM,
              depth: 3.0, // Reduced depth for header
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.ink,
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
                // If it's a TangibleButton, we might want to override its padding here 
                // but since it's passed as a widget we'd need a way to customize it.
                // For now, let's assume the games are passing compact ones or we'll update them.
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
