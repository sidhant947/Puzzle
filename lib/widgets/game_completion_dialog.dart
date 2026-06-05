import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/design_system.dart';
import '../utils/haptic_feedback.dart';
import '../utils/navigation_utils.dart';
import '../providers/game_providers.dart';
import '../providers/game_session_provider.dart';
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

    final session = ref.watch(gameSessionNotifierProvider);
    final filteredGamesList = ref.watch(filteredGamesProvider(
      searchQuery: session.searchQuery,
      selectedCategory: session.selectedCategory,
    ));

    Map<String, dynamic>? nextGame;
    bool isSameGame = true;
    if (session.lastGameId != null && filteredGamesList.isNotEmpty) {
      final currentIndex = filteredGamesList.indexWhere((g) => g['id'] == session.lastGameId);
      if (currentIndex != -1) {
        final nextIndex = (currentIndex + 1) % filteredGamesList.length;
        nextGame = filteredGamesList[nextIndex];
        isSameGame = nextGame['id'] == session.lastGameId;
      }
    }

    return Dialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
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
                  if (nextGame != null && !isSameGame)
                    Row(
                      children: [
                        TangibleButton(
                          onTap: widget.onPlayAgain,
                          color: colorScheme.surface,
                          shadowColor: colorScheme.outline,
                          padding: const EdgeInsets.all(11),
                          child: Icon(
                            Icons.refresh_rounded,
                            color: colorScheme.onSurface.withValues(alpha: 0.7),
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: DesignSystem.spaceSM),
                        Expanded(
                          child: TangibleButton(
                            onTap: () {
                              ref.read(gameSessionNotifierProvider.notifier).setSession(
                                gameId: nextGame!['id'],
                                category: session.selectedCategory,
                                query: session.searchQuery,
                              );
                              Navigator.of(context).pop(); // Dialog
                              Navigator.of(context).pop(); // Current Game
                              Navigator.push(
                                context,
                                CustomPageRoute(page: (nextGame['builder'] as WidgetBuilder)(context)),
                              );
                            },
                            color: DesignSystem.primary,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            child: Center(
                              child: Text(
                                l10n.playNext.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: 'Geist',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: DesignSystem.fontSizeMD,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    TangibleButton(
                      onTap: widget.onPlayAgain,
                      color: DesignSystem.primary,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: Center(
                        child: Text(
                          l10n.playAgain.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Geist',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: DesignSystem.fontSizeMD,
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
                          onTap: () {
                            // Capture navigator before popping context
                            final navigator = Navigator.of(context);
                            navigator.pop(); // Close completion dialog!
                            
                            // Show dynamic transparent overlay route for reviewing board!
                            navigator.push(
                              PageRouteBuilder(
                                opaque: false,
                                barrierColor: Colors.black.withValues(alpha: 0.05), // Extremely subtle dark barrier for premium overlay feel
                                transitionDuration: const Duration(milliseconds: 200),
                                reverseTransitionDuration: const Duration(milliseconds: 200),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(opacity: animation, child: child);
                                },
                                pageBuilder: (reviewCtx, _, __) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: SafeArea(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: DesignSystem.spaceLG,
                                                right: DesignSystem.spaceLG,
                                                bottom: DesignSystem.spaceXL, // Padded bottom margin above hardware bar
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(maxWidth: 320),
                                                  child: TangibleButton(
                                                    onTap: () {
                                                      // Return to Home by popping BOTH the review overlay and the game screen!
                                                      final nav = Navigator.of(reviewCtx);
                                                      nav.pop(); // Pop the Review overlay
                                                      nav.pop(); // Pop the Game Screen
                                                    },
                                                    color: DesignSystem.success,
                                                    shadowColor: const Color(0xFF047857),
                                                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                                                    child: Text(
                                                      l10n.finish.toUpperCase(),
                                                      textAlign: TextAlign.center,
                                                      style: const TextStyle(
                                                        fontFamily: 'Geist',
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 16,
                                                        letterSpacing: 1.2,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
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
    );
  }
}
