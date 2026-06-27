import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/user_providers.dart';
import '../../../utils/design_system.dart';
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
  final Map<int, Widget> _screenCache = {};
  Timer? _dayCheckTimer;
  DateTime? _lastCheckedDate;

  Widget _getScreen(int index) {
    return _screenCache.putIfAbsent(index, () {
      switch (index) {
        case 0: return const StatsScreen();
        case 1: return const HomeScreen();
        case 2: return const SettingsScreen();
        default: return const HomeScreen();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(gameStreakNotifierProvider.notifier).refreshStatus();
    _lastCheckedDate = DateTime.now();
    _dayCheckTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      _checkDayChange();
    });
  }

  void _checkDayChange() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (_lastCheckedDate == null || today != _lastCheckedDate) {
      _lastCheckedDate = today;
      ref.read(gameStreakNotifierProvider.notifier).refreshStatus();
    }
  }

  @override
  void dispose() {
    _dayCheckTimer?.cancel();
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
    final isMobile = MediaQuery.sizeOf(context).width <= 600;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (!isMobile) {
            return Row(
              children: [
                _buildSideNav(context),
                Expanded(
                  child: _getScreen(_selectedIndex),
                ),
              ],
            );
          } else {
            return _getScreen(_selectedIndex);
          }
        },
      ),
      bottomNavigationBar: isMobile
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
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          right: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
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
          const SizedBox(height: DesignSystem.spaceXS),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
              letterSpacing: 1.0,
              fontSize: 10,
            ),
          ),
        ],
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
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
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
}


