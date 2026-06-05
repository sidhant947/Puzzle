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
    final colorScheme = theme.colorScheme;

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
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    'STATS',
                    style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                      fontSize: DesignSystem.fontSize2XL,
                    ),
                  ),
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
                        style: TextStyle(
                          fontFamily: 'Bebas Neue',
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.primary,
                          fontSize: DesignSystem.fontSizeLG,
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
                        'LEVEL $level',
                        style: const TextStyle(
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'MAINTAIN YOUR STREAK!',
                        style: TextStyle(
                          fontFamily: 'Geist',
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                          fontSize: DesignSystem.fontSizeXS,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'XP PROGRESS',
                    style: TextStyle(
                      fontFamily: 'Geist',
                      fontWeight: FontWeight.w600,
                      fontSize: DesignSystem.fontSizeXS,
                      letterSpacing: 0.5,
                      color: Colors.white.withValues(alpha: 0.7),
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
      color: colorScheme.surface,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'WEEKLY ACTIVITY',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                  fontSize: DesignSystem.fontSizeMD,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.local_fire_department_rounded,
                      color: DesignSystem.gameOrange, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '$superStreak DAY STREAK',
                    style: const TextStyle(
                      fontFamily: 'Bebas Neue',
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                      color: DesignSystem.gameOrange,
                      fontSize: DesignSystem.fontSizeMD,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              return Column(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isSolved
                          ? DesignSystem.gameOrange
                          : (isToday
                              ? colorScheme.primary.withValues(alpha: 0.1)
                              : colorScheme.outline.withValues(alpha: 0.1)),
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
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                                color: isToday
                                    ? colorScheme.primary
                                    : colorScheme.onSurface
                                        .withValues(alpha: 0.3),
                              ),
                            ),
                    ),
                  ),
                ],
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
          style: TextStyle(
            fontFamily: 'Bebas Neue',
            letterSpacing: 1.2,
            fontWeight: FontWeight.w700,
            color: colorScheme.primary,
            fontSize: DesignSystem.fontSizeLG,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        TangibleContainer(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline.withValues(alpha: 0.5),
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
              style: TextStyle(
                fontFamily: 'Geist',
                fontWeight: FontWeight.w700,
                fontSize: DesignSystem.fontSizeXS,
                letterSpacing: 0.5,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            Text(
              '$solved / $total',
              style: TextStyle(
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.w700,
                fontSize: DesignSystem.fontSizeSM,
                letterSpacing: 0.5,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
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
                  fontFamily: 'Geist',
                  fontWeight: FontWeight.w600,
                  fontSize: DesignSystem.fontSizeXS,
                  letterSpacing: 0.5,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Bebas Neue',
              fontWeight: FontWeight.w700,
              fontSize: 28,
              letterSpacing: 0.5,
              color: colorScheme.onSurface,
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
      color: isUnlocked ? colorScheme.surface : theme.scaffoldBackgroundColor,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
      depth: isUnlocked ? 6.0 : 2.0,
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
              color: isUnlocked
                  ? DesignSystem.accentAmber
                  : colorScheme.onSurface.withValues(alpha: 0.2),
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
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    fontSize: DesignSystem.fontSizeLG,
                    color: isUnlocked
                        ? colorScheme.onSurface
                        : colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: TextStyle(
                    fontFamily: 'Geist',
                    fontWeight: FontWeight.w500,
                    fontSize: DesignSystem.fontSizeSM,
                    color: isUnlocked
                        ? colorScheme.onSurface.withValues(alpha: 0.6)
                        : colorScheme.onSurface.withValues(alpha: 0.3),
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
