import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
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
      title: 'NOVICE',
      description: 'EARN 100 XP',
      requiredXp: 100,
      icon: Icons.star_rounded,
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

    return Scaffold(
      backgroundColor: DesignSystem.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: false,
              snap: false,
              backgroundColor: DesignSystem.background,
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
                  const Text(
                    'ACHIEVEMENTS',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.inkSlate,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  ...List.generate(
                    achievements.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: DesignSystem.spaceMD),
                      child: _buildAchievementCard(achievements[index], userData),
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceXL),
                  _buildLegalSection(context),
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
    final progress = (userData.xp - currentLevelXp) / (nextLevelXp - currentLevelXp);

    return TangibleContainer(
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
                    'TOTAL XP: ${userData.xp}',
                    style: TextStyle(
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w800,
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
                '${nextLevelXp - userData.xp} XP TO NEXT LEVEL',
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
    );
  }

  Widget _buildAchievementCard(Achievement achievement, UserData userData) {
    final isUnlocked = userData.xp >= achievement.requiredXp;

    return TangibleContainer(
      color: isUnlocked ? DesignSystem.surface : DesignSystem.background,
      shadowColor: DesignSystem.outlineVariant,
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
                  : DesignSystem.outline.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
            ),
            child: Icon(
              achievement.icon,
              size: 28,
              color: isUnlocked ? DesignSystem.accentAmber : DesignSystem.inkSlate.withValues(alpha: 0.4),
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
                    color: isUnlocked ? DesignSystem.ink : DesignSystem.inkSlate.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: isUnlocked ? DesignSystem.inkSlate : DesignSystem.inkSlate.withValues(alpha: 0.4),
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
                color: DesignSystem.outline.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
              ),
              child: const Text(
                'LOCKED',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                  letterSpacing: 1.0,
                  color: DesignSystem.inkSlate,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SYSTEM & LEGAL',
          style: TextStyle(
            color: DesignSystem.inkSlate,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: DesignSystem.spaceMD),
        _buildLegalItem(
          context,
          'Privacy Policy',
          Icons.privacy_tip_rounded,
          () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        _buildLegalItem(
          context,
          'Terms of Service',
          Icons.description_rounded,
          () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'),
        ),
        const SizedBox(height: DesignSystem.spaceSM),
        _buildLegalItem(
          context,
          'Licenses',
          Icons.code_rounded,
          () => showLicensePage(
            context: context,
            applicationName: 'PUZZLE HUB',
            applicationVersion: '1.0.3+4',
          ),
        ),
      ],
    );
  }

  Widget _buildLegalItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return TangibleButton(
      color: DesignSystem.surface,
      shadowColor: DesignSystem.outlineVariant,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 24, color: DesignSystem.inkSlate),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                letterSpacing: 0.5,
                color: DesignSystem.ink,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 24,
            color: DesignSystem.inkSlate,
          ),
        ],
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