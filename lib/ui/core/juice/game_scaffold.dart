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
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: DesignSystem.inkSlate,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
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
        DesignSystem.spaceMD,
        DesignSystem.spaceMD,
        DesignSystem.spaceSM,
      ),
      child: Row(
        children: [
          TangibleButton(
            color: DesignSystem.surface,
            shadowColor: DesignSystem.outlineVariant,
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: DesignSystem.ink,
              size: 20,
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: TangibleContainer(
              color: DesignSystem.surface,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              radius: DesignSystem.radiusSM,
              depth: 4.0,
              child: Center(
                child: Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                    color: DesignSystem.ink,
                  ),
                ),
              ),
            ),
          ),
          if (actions != null) ...[
            const SizedBox(width: DesignSystem.spaceMD),
            ...actions!.map((action) => action),
          ] else
            // Spacer to balance back button width if no actions
            const SizedBox(width: 52 + DesignSystem.spaceMD), 
        ],
      ),
    );
  }
}
