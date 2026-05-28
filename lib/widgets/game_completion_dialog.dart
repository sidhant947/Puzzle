import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/design_system.dart';
import '../utils/haptic_feedback.dart';
import 'tangible.dart';

class GameCompletionDialog extends ConsumerStatefulWidget {
  final VoidCallback onHome;
  final VoidCallback onPlayAgain;
  final String title;
  final String message;
  final bool isVictory;

  const GameCompletionDialog({
    super.key,
    required this.onHome,
    required this.onPlayAgain,
    this.title = 'CONGRATS',
    required this.message,
    this.isVictory = true,
  });

  @override
  ConsumerState<GameCompletionDialog> createState() => _GameCompletionDialogState();
}

class _GameCompletionDialogState extends ConsumerState<GameCompletionDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isViewingResult = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _controller.forward();

    // Trigger haptics on appearance
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isVictory) {
        HapticFeedbackUtil.victory();
      } else {
        HapticFeedbackUtil.vibrate();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Semi-transparent background when viewing result to make it more clear
          if (_isViewingResult)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => setState(() => _isViewingResult = false),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            
          if (!_isViewingResult)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 380),
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: TangibleContainer(
                        radius: DesignSystem.radiusLG,
                        padding: const EdgeInsets.all(DesignSystem.spaceLG),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title with bold styling
                            Text(
                              widget.title.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Bebas Neue',
                                color: colorScheme.onSurface,
                                fontSize: 32, // Large elegant display title
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: DesignSystem.spaceSM),
                            
                            // Message
                            Text(
                              widget.message,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withValues(alpha: 0.7),
                                fontWeight: FontWeight.w700,
                                fontSize: 13.5,
                              ),
                            ),
                            const SizedBox(height: DesignSystem.spaceLG),
                            
                            // Actions
                            TangibleButton(
                              onTap: widget.onPlayAgain,
                              color: DesignSystem.primary,
                              shadowColor: DesignSystem.primaryShadow,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              child: Center(
                                child: Text(
                                  l10n.playAgain.toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'Geist',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700, // Premium elegant weight
                                    fontSize: DesignSystem.fontSizeMD, // 16.0
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: DesignSystem.spaceMD),
                            Row(
                              children: [
                                Expanded(
                                  child: TangibleButton(
                                    onTap: widget.onHome,
                                    color: colorScheme.surface,
                                    shadowColor: colorScheme.outline,
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    child: Center(
                                      child: Text(
                                        l10n.home.toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: 'Geist',
                                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w700,
                                          fontSize: DesignSystem.fontSizeSM, // 14.0
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: DesignSystem.spaceSM),
                                Expanded(
                                  child: TangibleButton(
                                    onTap: () => setState(() => _isViewingResult = true),
                                    color: colorScheme.surface,
                                    shadowColor: colorScheme.outline,
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                    child: Center(
                                      child: Text(
                                        l10n.seeCompleted.toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: 'Geist',
                                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w700,
                                          fontSize: DesignSystem.fontSizeSM, // 14.0
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: DesignSystem.spaceMD),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => _launchUrl('https://play.google.com/store/apps/details?id=com.sidhant.puzzle'),
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          size: 16,
                                          color: DesignSystem.accentAmber,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'LEAVE REVIEW',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 12,
                                  color: colorScheme.outline.withValues(alpha: 0.5),
                                ),
                                InkWell(
                                  onTap: () => _launchUrl('https://github.com/sidhant947/Puzzle/issues'),
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.bug_report_rounded,
                                          size: 16,
                                          color: DesignSystem.error,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'REPORT ERROR',
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ],
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
                ),
              ),
            ),
            
          if (_isViewingResult)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: DesignSystem.spaceLG,
                  right: DesignSystem.spaceLG,
                  bottom: DesignSystem.space2XL + 16,
                ),
                child: SizedBox(
                  width: 180,
                  child: TangibleButton(
                    onTap: widget.onHome,
                    color: DesignSystem.success,
                    shadowColor: const Color(0xFF047857),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Text(
                      l10n.finish.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
