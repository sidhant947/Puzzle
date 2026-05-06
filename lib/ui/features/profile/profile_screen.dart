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
          'PROFILE',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          _buildThemeToggle(context, themeNotifier, currentThemeMode, isDark),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserStats(context, userData, ref, theme, isDark),
              const SizedBox(height: 12),
              _buildDailyProgress(context, streaks, theme, isDark),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
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
      onTap: () {
        switch (currentMode) {
          case AppThemeMode.light:
            themeNotifier.setThemeMode(AppThemeMode.dark);
            break;
          case AppThemeMode.dark:
            themeNotifier.setThemeMode(AppThemeMode.system);
            break;
          case AppThemeMode.system:
            themeNotifier.setThemeMode(AppThemeMode.light);
            break;
        }
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(
          isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
          size: 18,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
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
        borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
        border: Border.all(
          color: isDark ? theme.colorScheme.outline.withValues(alpha: 0.3) : theme.colorScheme.outline,
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
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'TOTAL XP: ${userData.xp}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [const Color(0xFF3B82F6), const Color(0xFF8B5CF6)]
                        : [const Color(0xFF2563EB), const Color(0xFF7C3AED)],
                  ),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                ),
                child: const Icon(
                  Icons.shield_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.08),
              valueColor: AlwaysStoppedAnimation(
                isDark ? const Color(0xFF3B82F6) : const Color(0xFF2563EB),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${nextLevelXp - userData.xp} XP TO LEVEL ${userData.level + 1}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
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
    final totalGames = 6;
    final progress = totalGames > 0 ? solvedCount / totalGames : 0.0;
    final isComplete = solvedCount == totalGames;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
        border: Border.all(
          color: isDark ? theme.colorScheme.outline.withValues(alpha: 0.3) : theme.colorScheme.outline,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isComplete
                  ? DesignSystem.gameGreen.withValues(alpha: isDark ? 0.2 : 0.1)
                  : theme.colorScheme.onSurface.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isComplete
                    ? DesignSystem.gameGreen.withValues(alpha: 0.3)
                    : theme.colorScheme.outline.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Icon(
              isComplete ? Icons.check_rounded : Icons.timer_outlined,
              size: 24,
              color: isComplete
                  ? DesignSystem.gameGreen
                  : theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DAILY PROGRESS',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.08),
                    valueColor: AlwaysStoppedAnimation(
                      isComplete
                          ? DesignSystem.gameGreen
                          : isDark
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFF2563EB),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$solvedCount OF $totalGames COMPLETED',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
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
        color: isUnlocked
            ? theme.colorScheme.surface
            : theme.colorScheme.surface.withValues(alpha: isDark ? 0.5 : 0.7),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(
          color: isUnlocked
              ? isDark
                  ? theme.colorScheme.outline.withValues(alpha: 0.4)
                  : theme.colorScheme.outline
              : theme.colorScheme.outline.withValues(alpha: 0.2),
          width: isUnlocked ? 1 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? DesignSystem.gamePurple.withValues(alpha: isDark ? 0.2 : 0.1)
                  : theme.colorScheme.onSurface.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
            ),
            child: Icon(
              achievement.icon,
              size: 22,
              color: isUnlocked
                  ? DesignSystem.gamePurple
                  : theme.colorScheme.onSurface.withValues(alpha: 0.15),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.5,
                    color: isUnlocked
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurface.withValues(alpha: 0.25),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  achievement.description,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isUnlocked
                        ? theme.colorScheme.onSurface.withValues(alpha: 0.5)
                        : theme.colorScheme.onSurface.withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
          if (isUnlocked)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: DesignSystem.gameGreen.withValues(alpha: isDark ? 0.2 : 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 14,
                color: DesignSystem.gameGreen,
              ),
            )
          else
            Text(
              '${xpLeft} LEFT',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
            ),
        ],
      ),
    );
  }
}