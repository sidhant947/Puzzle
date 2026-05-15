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

class _MainShellState extends ConsumerState<MainShell> with WidgetsBindingObserver {
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
      extendBody: true,
      backgroundColor: colorScheme.surface,
      body: RepaintBoundary(
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            DesignSystem.spaceLG,
            0,
            DesignSystem.spaceLG,
            DesignSystem.spaceMD,
          ),
          child: TangibleContainer(
            radius: DesignSystem.radiusLG,
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSystem.spaceMD,
              vertical: DesignSystem.spaceSM,
            ),
            color: colorScheme.surface,
            depth: 4.0, // Less depth for the navigation bar
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
    final color = isSelected ? colorScheme.primary : colorScheme.onSurface.withValues(alpha: 0.5);

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_selectedIndex != index) {
            setState(() => _selectedIndex = index);
          }
        },
        behavior: HitTestBehavior.opaque,
        child: RepaintBoundary(
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
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
