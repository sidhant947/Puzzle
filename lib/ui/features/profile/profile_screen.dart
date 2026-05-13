import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/user_data.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';

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
      title: 'SEEKER',
      description: 'EARN 100 XP',
      requiredXp: 100,
      icon: Icons.search_rounded,
    ),
    Achievement(
      title: 'APPRENTICE',
      description: 'EARN 1,000 XP',
      requiredXp: 1000,
      icon: Icons.school_rounded,
    ),
    Achievement(
      title: 'STRATEGIST',
      description: 'EARN 5,000 XP',
      requiredXp: 5000,
      icon: Icons.psychology_rounded,
    ),
    Achievement(
      title: 'ELITE',
      description: 'EARN 10,000 XP',
      requiredXp: 10000,
      icon: Icons.military_tech_rounded,
    ),
    Achievement(
      title: 'VETERAN',
      description: 'EARN 25,000 XP',
      requiredXp: 25000,
      icon: Icons.shield_rounded,
    ),
    Achievement(
      title: 'MASTER',
      description: 'EARN 50,000 XP',
      requiredXp: 50000,
      icon: Icons.workspace_premium_rounded,
    ),
    Achievement(
      title: 'GRANDMASTER',
      description: 'EARN 100,000 XP',
      requiredXp: 100000,
      icon: Icons.diamond_rounded,
    ),
    Achievement(
      title: 'LEGEND',
      description: 'EARN 250,000 XP',
      requiredXp: 250000,
      icon: Icons.auto_awesome_rounded,
    ),
    Achievement(
      title: 'MYTHIC',
      description: 'EARN 500,000 XP',
      requiredXp: 500000,
      icon: Icons.vignette_rounded,
    ),
    Achievement(
      title: 'ETERNAL',
      description: 'EARN 1,000,000 XP',
      requiredXp: 1000000,
      icon: Icons.all_inclusive_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataNotifierProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: false,
              snap: false,
              backgroundColor: theme.scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                DesignSystem.spaceLG,
                DesignSystem.spaceMD,
                DesignSystem.spaceLG,
                140, // Space for bottom nav
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildUserStats(context, userData, ref),
                  const SizedBox(height: DesignSystem.spaceXL),
                  Text(
                    'ACHIEVEMENTS',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  ...List.generate(
                    achievements.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                      child: _buildAchievementCard(context, achievements[index], userData),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(BuildContext context, UserData userData, WidgetRef ref) {
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(userData.level);
    final nextLevelXp = notifier.xpForLevel(userData.level + 1);
    
    final diff = nextLevelXp - currentLevelXp;
    final progress = diff > 0 ? (userData.xp - currentLevelXp) / diff : 1.0;
    final theme = Theme.of(context);

    return Column(
      children: [
        TangibleContainer(
          color: DesignSystem.primary,
          shadowColor: DesignSystem.primaryShadow,
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'MAINTAIN YOUR STREAK!',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                    ),
                    child: const Icon(
                      Icons.workspace_premium_rounded,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignSystem.spaceXL),
              Stack(
                children: [
                  Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: DesignSystem.accentAmber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'XP PROGRESS',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                      letterSpacing: 1.0,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}% TO LEVEL ${userData.level + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        Row(
          children: [
            Expanded(
              child: _buildSmallStatCard(
                context,
                'TOTAL XP',
                '${userData.xp}',
                Icons.bolt_rounded,
                DesignSystem.accentAmber,
              ),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: _buildSmallStatCard(
                context,
                'SOLVED',
                '${userData.totalSolved ?? 0}',
                Icons.extension_rounded,
                DesignSystem.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallStatCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TangibleContainer(
      color: colorScheme.surface,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
                  letterSpacing: 1.0,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(BuildContext context, Achievement achievement, UserData userData) {
    final isUnlocked = userData.xp >= achievement.requiredXp;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TangibleContainer(
      color: isUnlocked ? colorScheme.surface : theme.scaffoldBackgroundColor,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
      depth: isUnlocked ? 6.0 : 2.0, // Less depth for locked
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isUnlocked 
                  ? DesignSystem.accentAmber.withValues(alpha: 0.2) 
                  : colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            ),
            child: Icon(
              achievement.icon,
              size: 28,
              color: isUnlocked ? DesignSystem.accentAmber : colorScheme.onSurface.withValues(alpha: 0.2),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                    fontSize: 16,
                    color: isUnlocked ? colorScheme.onSurface : colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: isUnlocked ? colorScheme.onSurface.withValues(alpha: 0.7) : colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ],
            ),
          ),
          if (isUnlocked)
            const Icon(
              Icons.check_circle_rounded,
              size: 28,
              color: DesignSystem.success,
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.outline.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
              ),
              child: Text(
                'LOCKED',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  letterSpacing: 1.0,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}