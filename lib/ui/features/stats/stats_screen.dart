import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/tangible.dart';
import '../../../data/game_data.dart';

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

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

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
    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: false,
                  snap: false,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  title: Text(
                    'STATS',
                    style: theme.textTheme.displaySmall?.copyWith(
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                    DesignSystem.spaceLG,
                    DesignSystem.spaceMD,
                    DesignSystem.spaceLG,
                    140,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildUserStats(
                        context,
                        userData.level,
                        userData.xp,
                        userData.totalSolved ?? 0,
                        userData.superStreak ?? 0,
                        userData.lastSuperStreakDate,
                        ref,
                      ),
                      const SizedBox(height: DesignSystem.spaceXL),
                      _buildCognitiveProfile(context, streaks),
                      const SizedBox(height: DesignSystem.spaceXL),
                      Text(
                        'ACHIEVEMENTS',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontSize: DesignSystem.fontSizeLG,
                          color: theme.colorScheme.primary,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: DesignSystem.spaceMD),
                      ...List.generate(
                        achievements.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                          child: _buildAchievementCard(
                            context,
                            achievements[index],
                            userData.totalSolved ?? 0,
                            userData.level,
                            userData.xp,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserStats(
    BuildContext context,
    int level,
    int xp,
    int totalSolved,
    int superStreak,
    DateTime? lastDate,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(level);
    final nextLevelXp = notifier.xpForLevel(level + 1);

    final diff = nextLevelXp - currentLevelXp;
    final progress = diff > 0 ? (xp - currentLevelXp) / diff : 1.0;

    return Column(
      children: [
        _buildStreakTracker(context, superStreak, lastDate),
        const SizedBox(height: DesignSystem.spaceMD),
        TangibleContainer(
          color: DesignSystem.primary,
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
                        'LEVEL $level',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontSize: 42,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'MAINTAIN YOUR STREAK!',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Colors.white.withValues(alpha: 0.8),
                          letterSpacing: 0.5,
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
                      size: 36,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(progress * 100).toInt()}% TO LEVEL ${level + 1}',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontFamily: 'Bebas Neue',
                      fontSize: DesignSystem.fontSizeSM,
                      color: Colors.white.withValues(alpha: 0.9),
                      letterSpacing: 1.0,
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
                '$xp',
                Icons.bolt_rounded,
                DesignSystem.accentAmber,
              ),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: _buildSmallStatCard(
                context,
                'SOLVED',
                '$totalSolved',
                Icons.extension_rounded,
                DesignSystem.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStreakTracker(
      BuildContext context, int superStreak, DateTime? lastDate) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final currentWeekday = now.weekday;
    final mondayOfThisWeek = today.subtract(Duration(days: currentWeekday - 1));

    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'WEEKLY ACTIVITY',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: DesignSystem.fontSizeMD,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  letterSpacing: 1.0,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.local_fire_department_rounded,
                      color: DesignSystem.gameOrange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '$superStreak DAY STREAK',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: DesignSystem.fontSizeMD,
                      color: DesignSystem.gameOrange,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: List.generate(7, (index) {
              final dayDate = mondayOfThisWeek.add(Duration(days: index));
              final dayLabel = ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index];
              final isToday = dayDate.isAtSameMomentAs(today);

              bool isSolved = false;
              if (lastDate != null && superStreak > 0) {
                final lastNormalized =
                    DateTime(lastDate.year, lastDate.month, lastDate.day);
                final streakStart =
                    lastNormalized.subtract(Duration(days: superStreak - 1));

                if ((dayDate.isAtSameMomentAs(streakStart) ||
                        dayDate.isAfter(streakStart)) &&
                    (dayDate.isAtSameMomentAs(lastNormalized) ||
                        dayDate.isBefore(lastNormalized))) {
                  isSolved = true;
                }
              }

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == 6 ? 0 : 4.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSolved
                            ? DesignSystem.gameOrange
                            : (isToday
                                ? colorScheme.primary.withValues(alpha: 0.1)
                                : colorScheme.onSurface.withValues(alpha: 0.05)),
                        borderRadius:
                            BorderRadius.circular(DesignSystem.radiusSM),
                        border: isToday && !isSolved
                            ? Border.all(color: colorScheme.primary, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: isSolved
                            ? const Icon(Icons.check_rounded,
                                color: Colors.white, size: 20)
                            : Text(
                                dayLabel,
                                style: TextStyle(
                                  fontFamily: 'Geist',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  color: isToday
                                      ? colorScheme.primary
                                      : colorScheme.onSurface
                                          .withValues(alpha: 0.3),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCognitiveProfile(
      BuildContext context, Map<String, dynamic> streaks) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final allGames = GameData.allGamesList;
    final Map<String, int> totalPerCategory = {};
    final Map<String, int> solvedPerCategory = {};

    for (final game in allGames) {
      final category = game['category'] as String;
      final id = game['id'] as String;

      totalPerCategory[category] = (totalPerCategory[category] ?? 0) + 1;
      if (streaks.containsKey(id)) {
        solvedPerCategory[category] = (solvedPerCategory[category] ?? 0) + 1;
      }
    }

    final categories = totalPerCategory.keys.toList()..sort();

    final categoryColors = {
      'LOGIC': DesignSystem.gameTeal,
      'MATH': DesignSystem.gameAmber,
      'MEMORY': DesignSystem.gameRose,
      'SPATIAL': DesignSystem.gameIndigo,
      'ATTENTION': DesignSystem.gamePurple,
      'WORD': DesignSystem.gameGreen,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COGNITIVE PROFILE',
          style: theme.textTheme.displaySmall?.copyWith(
            fontSize: DesignSystem.fontSizeLG,
            color: colorScheme.primary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        TangibleContainer(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            children: categories.map((cat) {
              final solved = solvedPerCategory[cat] ?? 0;
              final total = totalPerCategory[cat] ?? 1;
              final color = categoryColors[cat] ?? DesignSystem.primary;

              return Padding(
                padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                child:
                    _buildCategoryProgress(context, cat, solved, total, color),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryProgress(BuildContext context, String category,
      int solved, int total, Color color) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final progress = (solved / total).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              '$solved / $total',
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: DesignSystem.fontSizeSM,
                color: color,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 10,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
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
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.displayMedium?.copyWith(
              fontSize: 32,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(BuildContext context, Achievement achievement,
      int totalSolved, int level, int xp) {
    final isUnlocked = xp >= achievement.requiredXp;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isUnlocked
                  ? DesignSystem.accentAmber.withValues(alpha: 0.2)
                  : colorScheme.onSurface.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              border: Border.all(
                color: isUnlocked
                    ? DesignSystem.accentAmber.withValues(alpha: 0.3)
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Icon(
              achievement.icon,
              size: 32,
              color: isUnlocked
                  ? DesignSystem.accentAmber
                  : colorScheme.onSurface.withValues(alpha: 0.1),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: DesignSystem.fontSizeLG,
                    color: isUnlocked
                        ? colorScheme.onSurface
                        : colorScheme.onSurface.withValues(alpha: 0.3),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isUnlocked
                        ? colorScheme.onSurface.withValues(alpha: 0.6)
                        : colorScheme.onSurface.withValues(alpha: 0.2),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          if (isUnlocked)
            const Icon(
              Icons.check_circle_rounded,
              size: 32,
              color: DesignSystem.success,
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
              ),
              child: Text(
                'LOCKED',
                style: TextStyle(
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w900,
                  fontSize: 9,
                  letterSpacing: 1.5,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


