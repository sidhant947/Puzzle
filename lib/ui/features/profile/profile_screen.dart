import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/user_data.dart';
import '../../../../utils/design_system.dart';

class Achievement {
  final String title;
  final String description;
  final int requiredXp;
  final IconData icon;

  Achievement({
    required this.title,
    required this.description,
    required this.requiredXp,
    required this.icon,
  });
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static final List<Achievement> achievements = [
    Achievement(
      title: 'NOVICE',
      description: 'EARN 100 XP',
      requiredXp: 100,
      icon: Icons.star_outline_rounded,
    ),
    Achievement(
      title: 'PUZZLER',
      description: 'EARN 500 XP',
      requiredXp: 500,
      icon: Icons.extension_rounded,
    ),
    Achievement(
      title: 'STRATEGIST',
      description: 'EARN 1000 XP',
      requiredXp: 1000,
      icon: Icons.psychology_rounded,
    ),
    Achievement(
      title: 'MASTER',
      description: 'EARN 2500 XP',
      requiredXp: 2500,
      icon: Icons.workspace_premium_rounded,
    ),
    Achievement(
      title: 'LEGEND',
      description: 'EARN 5000 XP',
      requiredXp: 5000,
      icon: Icons.auto_awesome_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPatternPainter(
                color: theme.colorScheme.primary.withValues(alpha: isDark ? 0.05 : 0.03),
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: false,
                  snap: false,
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      'USER PROFILE',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 140),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildUserStats(context, userData, ref, theme, isDark),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20, left: 4),
                        child: Text(
                          'ACHIEVEMENTS',
                          style: theme.textTheme.labelSmall?.copyWith(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w900,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      ...List.generate(
                        achievements.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildAchievementCard(
                            achievements[index],
                            userData,
                            theme,
                            isDark,
                          ),
                        ),
                      ),
                      _buildLegalSection(context, theme, isDark),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserStats(
    BuildContext context,
    UserData userData,
    WidgetRef ref,
    ThemeData theme,
    bool isDark,
  ) {
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(userData.level);
    final nextLevelXp = notifier.xpForLevel(userData.level + 1);
    final progress = (userData.xp - currentLevelXp) / (nextLevelXp - currentLevelXp);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.2 : 0.4),
        borderRadius: BorderRadius.circular(DesignSystem.radius2XL),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.1 : 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.3) : theme.colorScheme.primary.withValues(alpha: 0.05),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radius2XL - 4),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.2 : 0.1),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LEVEL ${userData.level}',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'TOTAL XP: ${userData.xp}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: DesignSystem.gameAmber.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
                    border: Border.all(
                      color: DesignSystem.gameAmber.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.workspace_premium_rounded,
                    size: 36,
                    color: DesignSystem.gameAmber,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Stack(
              children: [
                Container(
                  height: 12,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: theme.colorScheme.outline.withValues(alpha: 0.1),
                      width: 1,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    height: 12,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withValues(alpha: 0.8),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'XP PROGRESS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  '${nextLevelXp - userData.xp} XP TO NEXT LEVEL',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    letterSpacing: 1.0,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(
    Achievement achievement,
    UserData userData,
    ThemeData theme,
    bool isDark,
  ) {
    final isUnlocked = userData.xp >= achievement.requiredXp;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: isDark ? 0.1 : 0.3),
        borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.05 : 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withValues(alpha: 0.2) : theme.colorScheme.primary.withValues(alpha: 0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL - 4),
          border: Border.all(
            color: isUnlocked
                ? DesignSystem.gameAmber.withValues(alpha: 0.3)
                : theme.colorScheme.outline.withValues(alpha: isDark ? 0.15 : 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isUnlocked
                    ? DesignSystem.gameAmber.withValues(alpha: 0.1)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isUnlocked
                      ? DesignSystem.gameAmber.withValues(alpha: 0.2)
                      : Colors.transparent,
                  width: 1,
                ),
              ),
              child: Icon(
                achievement.icon,
                size: 24,
                color: isUnlocked
                    ? DesignSystem.gameAmber
                    : theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    achievement.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: isUnlocked
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    achievement.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isUnlocked
                          ? theme.colorScheme.onSurface.withValues(alpha: 0.6)
                          : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                    ),
                  ),
                ],
              ),
            ),
            if (isUnlocked)
              Icon(
                Icons.check_circle_rounded,
                size: 24,
                color: DesignSystem.gameAmber,
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: theme.colorScheme.outline.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
                child: Text(
                  'LOCKED',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    letterSpacing: 1.0,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context, ThemeData theme, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12, left: 4),
          child: Text(
            'SYSTEM & LEGAL',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        _buildLegalItem(
          context,
          'Privacy Policy',
          Icons.privacy_tip_rounded,
          theme,
          () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'),
        ),
        const SizedBox(height: 12),
        _buildLegalItem(
          context,
          'Terms of Service',
          Icons.description_rounded,
          theme,
          () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'),
        ),
        const SizedBox(height: 12),
        _buildLegalItem(
          context,
          'Licenses',
          Icons.code_rounded,
          theme,
          () => showLicensePage(
            context: context,
            applicationName: 'PUZZLE HUB',
            applicationVersion: '1.0.2',
          ),
        ),
      ],
    );
  }

  Widget _buildLegalItem(
    BuildContext context,
    String title,
    IconData icon,
    ThemeData theme,
    VoidCallback onTap,
  ) {
    final isDark = theme.brightness == Brightness.dark;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withValues(alpha: 0.1) : theme.colorScheme.primary.withValues(alpha: 0.02),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title.toUpperCase(),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}

class _GridPatternPainter extends CustomPainter {
  final Color color;

  _GridPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const spacing = 40.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}