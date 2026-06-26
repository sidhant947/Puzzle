import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/game_metadata.dart';
import '../data/game_registry.dart';
import '../utils/design_system.dart';
import '../utils/haptic_feedback.dart';
import '../utils/navigation_utils.dart';
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

class _GameCompletionDialogState extends ConsumerState<GameCompletionDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isVictory) {
        HapticFeedbackUtil.victory();
      } else {
        HapticFeedbackUtil.vibrate();
      }
    });
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

    GameMetadata? nextGame;
    bool isSameGame = true;
    if (session.lastGameId != null) {
      final currentIndex = allGamesMetadata.indexWhere((g) => g.id == session.lastGameId);
      if (currentIndex != -1) {
        final nextIndex = (currentIndex + 1) % allGamesMetadata.length;
        nextGame = allGamesMetadata[nextIndex];
        isSameGame = nextGame.id == session.lastGameId;
      }
    }

    final next = nextGame;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: TangibleContainer(
          radius: DesignSystem.radiusLG,
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title.toUpperCase(),
                textAlign: TextAlign.center,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontSize: 32,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceSM),
              Text(
                widget.message.toUpperCase(),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                ),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              if (next != null && !isSameGame)
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TangibleButton(
                        onTap: widget.onPlayAgain,
                        color: colorScheme.surface,
                        padding: const EdgeInsets.all(11),
                        child: Icon(
                          Icons.refresh_rounded,
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceSM),
                    Expanded(
                      flex: 3,
                      child: TangibleButton(
                        onTap: () {
                          ref.read(gameSessionNotifierProvider.notifier).setSession(
                            gameId: next.id,
                            category: session.selectedCategory,
                            query: session.searchQuery,
                          );
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(
                            CustomPageRoute(page: next.builder(context)),
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Center(
                        child: Text(
                          l10n.home.toUpperCase(),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w700,
                            fontSize: DesignSystem.fontSizeSM,
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
                        final navigator = Navigator.of(context);
                        navigator.pop();
                        navigator.push(
                          PageRouteBuilder(
                            opaque: false,
                            barrierColor: Colors.black.withValues(alpha: 0.05),
                            transitionDuration: const Duration(milliseconds: 200),
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
                                            bottom: DesignSystem.spaceXL,
                                          ),
                                          child: Center(
                                            child: Container(
                                              width: double.infinity,
                                              constraints: const BoxConstraints(maxWidth: 320),
                                              child: TangibleButton(
                                                onTap: () {
                                                  final nav = Navigator.of(reviewCtx);
                                                  nav.pop();
                                                  nav.pop();
                                                },
                                                color: DesignSystem.success,
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
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Center(
                        child: Text(
                          l10n.seeCompleted.toUpperCase(),
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w700,
                            fontSize: DesignSystem.fontSizeSM,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignSystem.spaceMD),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4,
                runSpacing: 4,
                children: [
                  InkWell(
                    onTap: () => _launchUrl('https://play.google.com/store/apps/details?id=com.sidhant.puzzle'),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: DesignSystem.accentAmber,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'LEAVE REVIEW',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onSurface.withValues(alpha: 0.6),
                                letterSpacing: 0.5,
                              ),
                              overflow: TextOverflow.ellipsis,
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
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.bug_report_rounded,
                            size: 14,
                            color: DesignSystem.error,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'REPORT ERROR',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                color: colorScheme.onSurface.withValues(alpha: 0.6),
                                letterSpacing: 0.5,
                              ),
                              overflow: TextOverflow.ellipsis,
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
    );
  }
}
