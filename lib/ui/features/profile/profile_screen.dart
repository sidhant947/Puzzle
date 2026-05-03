import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/user_data.dart';
import '../../../../data/models/game_streak.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserStats(context, userData, ref, theme),
              _buildDailyProgress(context, streaks, theme),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
                child: Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              _buildAchievements(userData, theme),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserStats(BuildContext context, UserData userData, WidgetRef ref, ThemeData theme) {
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(userData.level);
    final nextLevelXp = notifier.xpForLevel(userData.level + 1);
    final progress = (userData.xp - currentLevelXp) / (nextLevelXp - currentLevelXp);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
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
                      style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'TOTAL XP: ${userData.xp}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.shield_rounded, size: 48, color: theme.colorScheme.primary),
              ],
            ),
            const SizedBox(height: 24),
            ClipRRect(
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 12,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${nextLevelXp - userData.xp} XP TO NEXT LEVEL',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyProgress(BuildContext context, Map<String, GameStreak> streaks, ThemeData theme) {
    final solvedCount = streaks.values.where((s) => s.solvedToday).length;
    final totalGames = 6; // We have 6 games
    final progress = totalGames > 0 ? solvedCount / totalGames : 0.0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.onSurface, width: 1),
              ),
              child: Icon(
                solvedCount == totalGames ? Icons.check_circle_outline : Icons.timer_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DAILY PROGRESS',
                    style: theme.textTheme.titleSmall?.copyWith(letterSpacing: 1.0),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 8),
                  Text(
                    '$solvedCount OF $totalGames COMPLETED',
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievements(UserData userData, ThemeData theme) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        final isUnlocked = userData.xp >= achievement.requiredXp;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isUnlocked ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withValues(alpha: 0.1),
              width: isUnlocked ? 2 : 1,
            ),
            color: isUnlocked ? theme.colorScheme.onSurface.withValues(alpha: 0.05) : Colors.transparent,
          ),
          child: Row(
            children: [
              Icon(
                achievement.icon,
                color: isUnlocked ? theme.colorScheme.primary : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                size: 32,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      achievement.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        letterSpacing: 1.0,
                        color: isUnlocked ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withValues(alpha: 0.3),
                      ),
                    ),
                    Text(
                      achievement.description,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: isUnlocked ? theme.colorScheme.onSurface.withValues(alpha: 0.6) : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
              ),
              if (isUnlocked)
                const Icon(Icons.check, size: 20)
              else
                Text(
                  '${(achievement.requiredXp - userData.xp).clamp(0, achievement.requiredXp)} XP LEFT',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w900,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
