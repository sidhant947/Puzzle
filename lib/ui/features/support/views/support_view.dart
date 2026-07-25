import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/design_system.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 18,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'SUPPORT',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: DesignSystem.accentAmber.withValues(alpha: 0.15),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.local_cafe_rounded,
                                  color: DesignSystem.accentAmber,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'SUPPORT PUZZLE',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'If you enjoy the game, consider supporting its development.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Your support will help me repair my laptop for development.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _sectionHeader(context, 'ONE-TIME SUPPORT'),
                        const SizedBox(height: 12),
                        _supportOption(
                          context,
                          title: 'Buy Me a Coffee',
                          description: 'Quick tip (charges me a 5% cut)',
                          icon: Icons.local_cafe_rounded,
                          color: const Color(0xFFFFDD00),
                          url: 'https://buymeacoffee.com/sidhant947',
                        ),
                        const SizedBox(height: 12),
                        _supportOption(
                          context,
                          title: 'Ko-fi',
                          description: 'Simple support (doesn\'t charge any cut)',
                          icon: Icons.local_cafe_rounded,
                          color: const Color(0xFF29abe0),
                          url: 'https://ko-fi.com/sidhant947',
                        ),
                        const SizedBox(height: 24),
                        _sectionHeader(context, 'RECURRING SUPPORT'),
                        const SizedBox(height: 12),
                        _supportOption(
                          context,
                          title: 'GitHub Sponsors',
                          description: 'Monthly support (100% goes to developer)',
                          icon: Icons.favorite_rounded,
                          color: DesignSystem.accentBerry,
                          url: 'https://github.com/sponsors/sidhant947',
                        ),
                        const SizedBox(height: 12),
                        _supportOption(
                          context,
                          title: 'Liberapay',
                          description: 'Weekly recurring donations',
                          icon: Icons.autorenew_rounded,
                          color: const Color(0xFF369449),
                          url: 'https://liberapay.com/sidhant947',
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _supportOption(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required String url,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
