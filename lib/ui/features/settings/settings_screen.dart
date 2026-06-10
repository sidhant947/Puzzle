import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../providers/theme_provider.dart';
import '../../../providers/user_providers.dart';
import '../../../utils/design_system.dart';
import '../../../widgets/tangible.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeNotifierProvider);
    final isTrialModeEnabled = ref.watch(
        userDataNotifierProvider.select((s) => s.isTrialModeEnabled ?? false));
    final l10n = AppLocalizations.of(context)!;

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
                    l10n.settings.toUpperCase(),
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
                      _buildSupportBanner(context),
                      const SizedBox(height: DesignSystem.spaceXL),
                      _buildSectionTitle(
                          context, l10n.appearance.toUpperCase()),
                      const SizedBox(height: DesignSystem.spaceMD),
                      _buildThemeSelector(context, ref, themeMode, l10n),
                      const SizedBox(height: DesignSystem.spaceXL),
                      _buildSectionTitle(context, l10n.gameplay.toUpperCase()),
                      const SizedBox(height: DesignSystem.spaceMD),
                      _buildTrialModeToggle(
                          context, ref, isTrialModeEnabled, l10n),
                      const SizedBox(height: DesignSystem.spaceXL),
                      _buildSectionTitle(context, l10n.supportUs.toUpperCase()),
                      const SizedBox(height: DesignSystem.spaceMD),
                      _buildSettingsItem(
                        context,
                        l10n.starOnGithub,
                        Icons.star_rounded,
                        () =>
                            _launchUrl('https://github.com/sidhant947/Puzzle'),
                        iconColor: Colors.amber,
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSettingsItem(
                        context,
                        l10n.sponsorOnGithub,
                        Icons.favorite_rounded,
                        () => _launchUrl(
                            'https://github.com/sponsors/sidhant947'),
                        iconColor: Colors.pink,
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSettingsItem(
                        context,
                        'Leave a Review',
                        Icons.rate_review_rounded,
                        () => _launchUrl(
                            'https://play.google.com/store/apps/details?id=com.sidhant.puzzle'),
                        iconColor: Colors.teal,
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSettingsItem(
                        context,
                        'Report an Error',
                        Icons.bug_report_rounded,
                        () => _launchUrl(
                            'https://github.com/sidhant947/Puzzle/issues'),
                        iconColor: Colors.redAccent,
                      ),
                      const SizedBox(height: DesignSystem.spaceXL),
                      _buildSectionTitle(
                          context, l10n.systemLegal.toUpperCase()),
                      const SizedBox(height: DesignSystem.spaceMD),
                      _buildSettingsItem(
                        context,
                        l10n.privacyPolicy,
                        Icons.privacy_tip_rounded,
                        () => _launchUrl(
                            'https://sites.google.com/view/puzzlebysidhant/home'),
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSettingsItem(
                        context,
                        l10n.termsOfService,
                        Icons.description_rounded,
                        () => _launchUrl(
                            'https://sites.google.com/view/puzzlebysidhant/home'),
                      ),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSettingsItem(
                        context,
                        l10n.licenses,
                        Icons.code_rounded,
                        () => showLicensePage(
                          context: context,
                          applicationName: l10n.appTitle.toUpperCase(),
                          applicationVersion: 'Latest',
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Text(
      title,
      style: theme.textTheme.displaySmall?.copyWith(
        fontSize: DesignSystem.fontSizeLG,
        color: colorScheme.primary,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _buildTrialModeToggle(BuildContext context, WidgetRef ref,
      bool isEnabled, AppLocalizations l10n) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TangibleContainer(
      padding: const EdgeInsets.symmetric(
          horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceSM),
      child: Row(
        children: [
          Icon(
            Icons.timer_off_rounded,
            color: isEnabled
                ? DesignSystem.primary
                : colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.trialMode.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: DesignSystem.fontSizeMD,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  l10n.trialModeDescription.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) =>
                ref.read(userDataNotifierProvider.notifier).setTrialMode(value),
            activeThumbColor: DesignSystem.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context, WidgetRef ref,
      AppThemeMode currentMode, AppLocalizations l10n) {
    return Column(
      children: [
        _buildThemeOption(context, ref, AppThemeMode.light, l10n.themeLight,
            Icons.light_mode_rounded, currentMode == AppThemeMode.light),
        const SizedBox(height: DesignSystem.spaceSM),
        _buildThemeOption(context, ref, AppThemeMode.dark, l10n.themeDark,
            Icons.dark_mode_rounded, currentMode == AppThemeMode.dark),
        const SizedBox(height: DesignSystem.spaceSM),
        _buildThemeOption(
            context,
            ref,
            AppThemeMode.system,
            l10n.themeSystem,
            Icons.brightness_auto_rounded,
            currentMode == AppThemeMode.system),
      ],
    );
  }

  Widget _buildThemeOption(BuildContext context, WidgetRef ref,
      AppThemeMode mode, String label, IconData icon, bool isSelected) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TangibleButton(
      color: isSelected ? colorScheme.primary : colorScheme.surface,
      onTap: () => ref.read(themeNotifierProvider.notifier).setThemeMode(mode),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Text(
              label.toUpperCase(),
              style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected ? Colors.white : colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                fontSize: DesignSystem.fontSizeMD,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle_rounded : Icons.radio_button_off_rounded,
            size: 24,
            color: isSelected ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TangibleButton(
      color: colorScheme.surface,
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: iconColor ?? colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: DesignSystem.fontSizeMD,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 24,
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportBanner(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TangibleButton(
      color: colorScheme.secondary,
      onTap: () => _launchUrl('https://github.com/sponsors/sidhant947'),
      child: Row(
        children: [
          const Icon(
            Icons.apple_rounded,
            size: 32,
            color: Colors.white,
          ),
          const SizedBox(width: DesignSystem.spaceMD),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SUPPORT IOS RELEASE',
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.w700,
                    fontSize: DesignSystem.fontSizeLG,
                    letterSpacing: 1.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'HELP US COVER THE APPLE DEVELOPER FEE',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withValues(alpha: 0.8),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.favorite_rounded,
            size: 24,
            color: Colors.white,
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


