import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../providers/theme_provider.dart';
import '../../../providers/locale_provider.dart';
import '../../../providers/user_providers.dart';
import '../../../utils/design_system.dart';
import '../../../widgets/tangible.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  // Native names for each supported language code, used as picker labels.
  // Kept language-stable (always rendered in native script) to avoid the
  // picker mutating mid-use when the user changes the app language.
  static const Map<String, String> _nativeNames = {
    'ar': 'العربية',
    'bn': 'বাংলা',
    'de': 'Deutsch',
    'en': 'English',
    'es': 'Español',
    'fa': 'فارسی',
    'fr': 'Français',
    'hi': 'हिन्दी',
    'id': 'Bahasa Indonesia',
    'it': 'Italiano',
    'ja': '日本語',
    'ko': '한국어',
    'mr': 'मराठी',
    'pl': 'Polski',
    'pt': 'Português',
    'ru': 'Русский',
    'ta': 'தமிழ்',
    'te': 'తెలుగు',
    'th': 'ไทย',
    'tr': 'Türkçe',
    'ur': 'اردو',
    'vi': 'Tiếng Việt',
    'zh': '中文',
  };

  // Sentinel for the System Default entry. PopupMenuButton routes `null`
  // returns through onCanceled (not onSelected), so we encode "system" as
  // a non-null value and translate it back to `null` in the notifier.
  static const String _kSystemLocale = '__system__';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeNotifierProvider);
    final selectedLocale = ref.watch(localeNotifierProvider);
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
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        switch (index) {
                          case 0: return _buildSectionTitle(context, l10n.supportUs.toUpperCase());
                          case 1: return const SizedBox(height: DesignSystem.spaceMD);
                          case 2: return _buildSettingsItem(context, l10n.starOnGithub, Icons.star_rounded, () => _launchUrl('https://github.com/sidhant947/Puzzle'), iconColor: Colors.amber);
                          case 3: return const SizedBox(height: DesignSystem.spaceSM);
                          case 4: return _buildSettingsItem(context, l10n.supportUs, Icons.favorite_rounded, () => _launchUrl('https://buymeacoffee.com/sidhant947'), iconColor: Colors.pink);
                          case 5: return const SizedBox(height: DesignSystem.spaceSM);
                          case 6: return _buildSettingsItem(context, l10n.leaveReview, Icons.rate_review_rounded, () => _launchUrl('https://play.google.com/store/apps/details?id=com.sidhant.puzzle'), iconColor: Colors.teal);
                          case 7: return const SizedBox(height: DesignSystem.spaceSM);
                          case 8: return _buildSettingsItem(context, l10n.reportError, Icons.bug_report_rounded, () => _launchUrl('https://github.com/sidhant947/Puzzle/issues'), iconColor: Colors.redAccent);
                          case 9: return const SizedBox(height: DesignSystem.spaceXL);
                          case 10: return _buildSectionTitle(context, l10n.appearance.toUpperCase());
                          case 11: return const SizedBox(height: DesignSystem.spaceMD);
                          case 12: return _buildThemeSelector(context, ref, themeMode, l10n);
                          case 13: return const SizedBox(height: DesignSystem.spaceXL);
                          case 14: return _buildSectionTitle(context, l10n.language.toUpperCase());
                          case 15: return const SizedBox(height: DesignSystem.spaceMD);
                          case 16: return _buildLanguageSelector(context, ref, selectedLocale);
                          case 17: return const SizedBox(height: DesignSystem.spaceXL);
                          case 18: return _buildSectionTitle(context, l10n.gameplay.toUpperCase());
                          case 19: return const SizedBox(height: DesignSystem.spaceMD);
                          case 20: return _buildTrialModeToggle(context, ref, isTrialModeEnabled, l10n);
                          case 21: return const SizedBox(height: DesignSystem.spaceXL);
                          case 22: return _buildSectionTitle(context, l10n.systemLegal.toUpperCase());
                          case 23: return const SizedBox(height: DesignSystem.spaceMD);
                          case 24: return _buildSettingsItem(context, l10n.privacyPolicy, Icons.privacy_tip_rounded, () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'));
                          case 25: return const SizedBox(height: DesignSystem.spaceSM);
                          case 26: return _buildSettingsItem(context, l10n.termsOfService, Icons.description_rounded, () => _launchUrl('https://sites.google.com/view/puzzlebysidhant/home'));
                          case 27: return const SizedBox(height: DesignSystem.spaceSM);
                          case 28: return _buildSettingsItem(context, l10n.licenses, Icons.code_rounded, () => showLicensePage(context: context, applicationName: l10n.appTitle.toUpperCase(), applicationVersion: 'Latest'));
                          default: return null;
                        }
                      },
                      childCount: 29,
                    ),
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

  Widget _buildLanguageSelector(BuildContext context, WidgetRef ref,
      Locale? currentLocale) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final supportedCodes =
        AppLocalizations.supportedLocales.map((l) => l.languageCode).toList();
    final currentCode = currentLocale?.languageCode;
    final currentLabel = currentLocale == null
        ? 'System Default'
        : (_nativeNames[currentLocale.languageCode] ??
            currentLocale.languageCode.toUpperCase());

    // NOTE: PopupMenuButton conflates "menu dismissed" with "item with
    // null value tapped" — both return null to onSelected, which is then
    // routed to onCanceled. So we use a sentinel string for System Default.
    return PopupMenuButton<String>(
      tooltip: '',
      position: PopupMenuPosition.under,
      onSelected: (code) {
        final notifier = ref.read(localeNotifierProvider.notifier);
        notifier.setLocale(code == _kSystemLocale ? null : Locale(code));
      },
      itemBuilder: (context) {
        final isSystem = currentLocale == null;
        return [
          _buildLanguageMenuItem(
            context,
            value: _kSystemLocale,
            label: 'System Default',
            selected: isSystem,
          ),
          const PopupMenuDivider(),
          for (final code in supportedCodes)
            _buildLanguageMenuItem(
              context,
              value: code,
              label: _nativeNames[code] ?? code.toUpperCase(),
              selected: code == currentCode,
            ),
        ];
      },
      child: TangibleButton(
        color: colorScheme.surface,
        onTap: null,
        child: Row(
          children: [
            Icon(
              Icons.translate_rounded,
              size: 24,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            const SizedBox(width: DesignSystem.spaceMD),
            Expanded(
              child: Text(
                currentLabel.toUpperCase(),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: DesignSystem.fontSizeMD,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Icon(
              Icons.expand_more_rounded,
              size: 24,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuEntry<String> _buildLanguageMenuItem(
    BuildContext context, {
    required String value,
    required String label,
    required bool selected,
  }) {
    final theme = Theme.of(context);
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: selected
                ? Icon(
                    Icons.check_rounded,
                    size: 18,
                    color: theme.colorScheme.primary,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Text(label),
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



  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}

