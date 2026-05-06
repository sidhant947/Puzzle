import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../providers/theme_provider.dart';
import '../../../../data/models/user_data.dart';
import '../../../../data/models/game_streak.dart';
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
    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);
    final themeNotifier = ref.watch(themeNotifierProvider.notifier);
    final currentThemeMode = ref.watch(themeNotifierProvider);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'USER PROFILE',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.primary,
            letterSpacing: 4.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          _buildThemeToggle(context, themeNotifier, currentThemeMode, isDark),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserStats(context, userData, ref, theme, isDark),
              const SizedBox(height: 16),
              _buildDailyProgress(context, streaks, theme, isDark),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20, left: 4),
                child: Text(
                  'ACHIEVEMENTS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w900,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
              ...List.generate(
                achievements.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildAchievementCard(
                    achievements[index],
                    userData,
                    theme,
                    isDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggle(
    BuildContext context,
    ThemeNotifier themeNotifier,
    AppThemeMode currentMode,
    bool isDark,
  ) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => themeNotifier.toggleTheme(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(
          themeNotifier.themeIcon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radius2XL),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.15 : 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
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
                      letterSpacing: -1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'TOTAL XP GATHERED: ${userData.xp}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.shield_rounded,
                  size: 32,
                  color: theme.colorScheme.primary,
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
                        theme.colorScheme.primary.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(6),
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
                'PROGRESS',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 9,
                ),
              ),
              Text(
                '${nextLevelXp - userData.xp} XP UNTIL LEVEL ${userData.level + 1}',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 9,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDailyProgress(
    BuildContext context,
    Map<String, GameStreak> streaks,
    ThemeData theme,
    bool isDark,
  ) {
    final solvedCount = streaks.values.where((s) => s.solvedToday).length;
    const totalGames = 6;
    final progress = totalGames > 0 ? solvedCount / totalGames : 0.0;
    final isComplete = solvedCount == totalGames;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radius2XL),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: isDark ? 0.15 : 0.08),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: isComplete
                  ? DesignSystem.gameGreen.withValues(alpha: 0.1)
                  : theme.colorScheme.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              isComplete ? Icons.check_circle_rounded : Icons.radar_rounded,
              size: 26,
              color: isComplete ? DesignSystem.gameGreen : theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DAILY STATUS',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 6,
                          backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                          valueColor: AlwaysStoppedAnimation(
                            isComplete ? DesignSystem.gameGreen : theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '$solvedCount/$totalGames',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
    final xpLeft = (achievement.requiredXp - userData.xp).clamp(0, achievement.requiredXp);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
        border: Border.all(
          color: isUnlocked
              ? theme.colorScheme.primary.withValues(alpha: 0.2)
              : theme.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? theme.colorScheme.primary.withValues(alpha: 0.1)
                  : theme.colorScheme.onSurface.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              achievement.icon,
              size: 24,
              color: isUnlocked
                  ? theme.colorScheme.primary
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
                        : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  achievement.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isUnlocked
                        ? theme.colorScheme.onSurface.withValues(alpha: 0.5)
                        : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  ),
                ),
              ],
            ),
          ),
          if (isUnlocked)
            Icon(
              Icons.stars_rounded,
              size: 24,
              color: DesignSystem.gameOrange.withValues(alpha: 0.8),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$xpLeft XP',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 9,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}