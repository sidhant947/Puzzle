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
    final colorScheme = theme.colorScheme;
    final themeMode = ref.watch(themeNotifierProvider);
    final isTrialModeEnabled = ref.watch(
        userDataNotifierProvider.select((s) => s.isTrialModeEnabled ?? false));
    final userData = ref.watch(userDataNotifierProvider);
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
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    l10n.settings.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface,
                      fontSize: DesignSystem.fontSizeXL, // Reduced from 18 to 16
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
                      _buildSectionTitle(context, 'PROFILE'),
                      const SizedBox(height: DesignSystem.spaceMD),
                      _buildSettingsItem(
                        context,
                        'Name: ${userData.name ?? "Friend"}',
                        Icons.person_rounded,
                        () => _showChangeNameDialog(context, ref, userData.name ?? ''),
                        iconColor: DesignSystem.primary,
                      ),
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
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w900,
        fontSize: DesignSystem.fontSizeSM, // Reduced from 16 to 11 for high-end feel
      ),
    );
  }

  Widget _buildTrialModeToggle(BuildContext context, WidgetRef ref,
      bool isEnabled, AppLocalizations l10n) {
    final colorScheme = Theme.of(context).colorScheme;
    return TangibleContainer(
      color: colorScheme.surface,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
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
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: DesignSystem.fontSizeMD, // Reduced from 14 to 13
                    letterSpacing: 0.5,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  l10n.trialModeDescription.toUpperCase(),
                  style: TextStyle(
                    fontSize: DesignSystem.fontSize2XS, // Reduced from 10 to 9
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
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
    return TangibleContainer(
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5),
      padding: const EdgeInsets.all(DesignSystem.spaceSM),
      child: Row(
        children: [
          _buildThemeOption(context, ref, AppThemeMode.light, l10n.themeLight,
              Icons.light_mode_rounded, currentMode == AppThemeMode.light),
          const SizedBox(width: DesignSystem.spaceSM),
          _buildThemeOption(context, ref, AppThemeMode.dark, l10n.themeDark,
              Icons.dark_mode_rounded, currentMode == AppThemeMode.dark),
          const SizedBox(width: DesignSystem.spaceSM),
          _buildThemeOption(
              context,
              ref,
              AppThemeMode.system,
              l10n.themeSystem,
              Icons.brightness_auto_rounded,
              currentMode == AppThemeMode.system),
        ],
      ),
    );
  }

  Widget _buildThemeOption(BuildContext context, WidgetRef ref,
      AppThemeMode mode, String label, IconData icon, bool isSelected) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = isSelected
        ? DesignSystem.primary
        : colorScheme.onSurface.withValues(alpha: 0.5);

    return Expanded(
      child: TangibleButton(
        onTap: () =>
            ref.read(themeNotifierProvider.notifier).setThemeMode(mode),
        color: isSelected
            ? colorScheme.primary.withValues(alpha: 0.1)
            : colorScheme.surface,
        shadowColor: isSelected
            ? DesignSystem.primaryShadow.withValues(alpha: 0.3)
            : colorScheme.outline.withValues(alpha: 0.2),
        depth: isSelected ? 4.0 : 2.0,
        padding: const EdgeInsets.symmetric(vertical: DesignSystem.spaceMD),
        child: Column(
          children: [
            Icon(icon,
                color: isSelected ? DesignSystem.primary : color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? DesignSystem.primary : color,
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                fontSize: 10,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
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
    final colorScheme = Theme.of(context).colorScheme;
    return TangibleButton(
      color: colorScheme.surface,
      shadowColor: colorScheme.outline.withValues(alpha: 0.5),
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
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: DesignSystem.fontSizeMD, // Reduced from 14 to 13
                letterSpacing: 0.5,
                color: colorScheme.onSurface,
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

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  void _showChangeNameDialog(BuildContext context, WidgetRef ref, String currentName) {
    final TextEditingController controller = TextEditingController(text: currentName);
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: TangibleContainer(
              radius: DesignSystem.radiusLG,
              padding: const EdgeInsets.all(DesignSystem.spaceLG),
              color: colorScheme.surface,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'CHANGE YOUR NAME',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                        fontSize: DesignSystem.fontSizeXL, // Reduced from 18 to 16
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),
                    TangibleContainer(
                      radius: DesignSystem.radiusMD,
                      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                      color: colorScheme.surface,
                      child: TextFormField(
                        controller: controller,
                        textCapitalization: TextCapitalization.words,
                        maxLength: 15,
                        style: TextStyle(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w800,
                          fontSize: DesignSystem.fontSizeLG, // Reduced from 16 to 14
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'ENTER YOUR NAME...',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'PLEASE ENTER A NAME';
                          }
                          if (value.trim().length < 2) {
                            return 'NAME IS TOO SHORT';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                    Row(
                      children: [
                        Expanded(
                          child: TangibleButton(
                            onTap: () => Navigator.pop(context),
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                  fontSize: DesignSystem.fontSizeMD,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: DesignSystem.spaceSM),
                        Expanded(
                          child: TangibleButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                final newName = controller.text.trim();
                                Navigator.pop(context);
                                ref.read(userDataNotifierProvider.notifier).updateName(newName);
                              }
                            },
                            color: DesignSystem.primary,
                            shadowColor: DesignSystem.primaryShadow,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Center(
                              child: Text(
                                'SAVE',
                                style: TextStyle(
                                  fontSize: DesignSystem.fontSizeMD,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
