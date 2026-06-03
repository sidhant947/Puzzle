import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/user_providers.dart';
import '../../../utils/design_system.dart';
import '../../../widgets/tangible.dart';
import '../home/home_screen.dart';
import '../stats/stats_screen.dart';
import '../settings/settings_screen.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell>
    with WidgetsBindingObserver {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const StatsScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ref.read(gameStreakNotifierProvider.notifier).refreshStatus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: [
                _buildSideNav(context),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _screens,
                  ),
                ),
              ],
            );
          } else {
            return IndexedStack(
              index: _selectedIndex,
              children: _screens,
            );
          }
        },
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width <= 600
          ? Container(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.1),
                    width: 1.5,
                  ),
                ),
              ),
              child: SafeArea(
                child: Container(
                  height: 72,
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.spaceMD,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                        context: context,
                        index: 0,
                        icon: Icons.bar_chart_rounded,
                        label: 'STATS',
                        isSelected: _selectedIndex == 0,
                      ),
                      _buildNavItem(
                        context: context,
                        index: 1,
                        icon: Icons.grid_view_rounded,
                        label: 'GAMES',
                        isSelected: _selectedIndex == 1,
                      ),
                      _buildNavItem(
                        context: context,
                        index: 2,
                        icon: Icons.settings_rounded,
                        label: 'SETTINGS',
                        isSelected: _selectedIndex == 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildSideNav(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.fromLTRB(
        DesignSystem.spaceMD,
        DesignSystem.spaceMD,
        0,
        DesignSystem.spaceMD,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSystem.spaceSM,
        vertical: DesignSystem.spaceLG,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSideNavItem(
            context: context,
            index: 0,
            icon: Icons.bar_chart_rounded,
            label: 'STATS',
            isSelected: _selectedIndex == 0,
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          _buildSideNavItem(
            context: context,
            index: 1,
            icon: Icons.grid_view_rounded,
            label: 'GAMES',
            isSelected: _selectedIndex == 1,
          ),
          const SizedBox(height: DesignSystem.spaceXL),
          _buildSideNavItem(
            context: context,
            index: 2,
            icon: Icons.settings_rounded,
            label: 'SETTINGS',
            isSelected: _selectedIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildSideNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = isSelected
        ? colorScheme.primary
        : colorScheme.onSurface.withValues(alpha: 0.5);

    return GestureDetector(
      onTap: () {
        if (_selectedIndex != index) {
          setState(() => _selectedIndex = index);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              child: Icon(
                icon,
                size: 32,
                color: color,
              ),
            ),
            const SizedBox(height: DesignSystem.spaceSM),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                letterSpacing: 1.0,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color =
        isSelected ? colorScheme.primary : colorScheme.onSurface.withValues(alpha: 0.5);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_selectedIndex != index) {
            setState(() => _selectedIndex = index);
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceSM),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutBack,
                child: Icon(
                  icon,
                  size: 28,
                  color: color,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceXS),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                  letterSpacing: 1.0,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
