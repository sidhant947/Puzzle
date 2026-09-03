import 'package:puzzle/utils/l10n_game_helpers.dart';
import "package:puzzle/l10n/app_localizations.dart";

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import 'change_blindness_provider.dart';

class ChangeBlindnessScreen extends ConsumerStatefulWidget {
  const ChangeBlindnessScreen({super.key});

  @override
  ConsumerState<ChangeBlindnessScreen> createState() => _ChangeBlindnessScreenState();
}

class _ChangeBlindnessScreenState extends ConsumerState<ChangeBlindnessScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isTrialMode = ref.read(userDataNotifierProvider.select((u) => u.isTrialModeEnabled ?? false));
      ref.read(changeBlindnessNotifierProvider.notifier).initGame(isTrialMode: isTrialMode);
    });
  }

  void _showCompletionDialog(ChangeBlindnessState state) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: L10nGameHelpers.getGameTitle(context, 'change_blindness'),
        message: AppLocalizations.of(context)!.changeBlindnessMessage((state.score).toString()),
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          final isTrialMode = ref.read(userDataNotifierProvider.select((u) => u.isTrialModeEnabled ?? false));
          ref.read(changeBlindnessNotifierProvider.notifier).initGame(isTrialMode: isTrialMode);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(changeBlindnessNotifierProvider);

    ref.listen(changeBlindnessNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showCompletionDialog(next);
      }
    });

    return GameScaffold(
      title: l10n.changeBlindnessTitle,
      subtitle: l10n.changeBlindnessSubtitle,
      onHowToPlay: () async {
        ref.read(changeBlindnessNotifierProvider.notifier).pauseGame();
        await showDialog(
          context: context,
          builder: (dialogCtx) => Dialog(
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
                    Row(
                      children: [
                        Icon(Icons.info_outline_rounded, color: colorScheme.primary, size: 28),
                        const SizedBox(width: DesignSystem.spaceSM),
                        Expanded(
                          child: Text(
                            "HOW TO PLAY",
                            style: TextStyle(
                              fontFamily: 'Bebas Neue',
                              fontSize: DesignSystem.fontSize2XL,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w700,
                              color: colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),
                    Text(
                      l10n.changeBlindnessTitle.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceMD),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(DesignSystem.spaceMD),
                      decoration: BoxDecoration(
                        color: colorScheme.onSurface.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RULES & CONDITIONS:",
                            style: TextStyle(
                              fontSize: DesignSystem.fontSizeSM,
                              fontWeight: FontWeight.w900,
                              color: colorScheme.primary,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(height: DesignSystem.spaceSM),
                          ...[
                            "Goal: Spot the single tile that changes color or shape between alternating flickers.",
                            "Flicker Rule: The board briefly flickers every second. Watch closely to detect what changes.",
                            "Time Limit: You have 60 seconds. Each correct spot earns +1 point and advances to the next trial.",
                            "Penalty: Tapping an incorrect tile reduces remaining time by 2 seconds.",
                          ].map((rule) => Padding(
                            padding: const EdgeInsets.only(bottom: DesignSystem.spaceXS),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "• ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    rule,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurface.withValues(alpha: 0.8),
                                      fontSize: 13.0,
                                      height: 1.35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: DesignSystem.spaceLG),
                    TangibleButton(
                      color: colorScheme.primary,
                      width: double.infinity,
                      onTap: () => Navigator.of(dialogCtx).pop(),
                      child: Center(
                        child: Text(
                          "GOT IT",
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        ref.read(changeBlindnessNotifierProvider.notifier).resumeGame();
      },
      actions: [
        if (!state.isTrialMode)
          TangibleContainer(
            color: colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            radius: DesignSystem.radiusSM,
            depth: 2,
            child: Text(
              '${state.timeLeft}S',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: DesignSystem.primary,
                fontFamily: 'JetBrainsMono',
              ),
            ),
          ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: DesignSystem.spaceLG,
                    left: DesignSystem.spaceLG,
                    right: DesignSystem.spaceLG,
                    bottom: DesignSystem.spaceSM,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!state.isTrialMode) ...[
                            TangibleContainer(
                              color: colorScheme.surface,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              radius: DesignSystem.radiusMD,
                              depth: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20,
                                    color: state.timeLeft <= 10 ? DesignSystem.error : DesignSystem.primary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${state.timeLeft}S',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: state.timeLeft <= 10 ? DesignSystem.error : DesignSystem.primary,
                                      fontFamily: 'JetBrainsMono',
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ] else ...[
                            TangibleContainer(
                              color: colorScheme.surface,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              radius: DesignSystem.radiusMD,
                              depth: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.flag_rounded,
                                    size: 20,
                                    color: DesignSystem.accentAmber,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${state.score}/20',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: DesignSystem.accentAmber,
                                      fontFamily: 'JetBrainsMono',
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (state.multiplier > 1) ...[
                            const SizedBox(width: DesignSystem.spaceMD),
                            TangibleContainer(
                              color: DesignSystem.gameOrange.withValues(alpha: 0.2),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              radius: DesignSystem.radiusMD,
                              depth: 2,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.local_fire_department_rounded,
                                    size: 20,
                                    color: DesignSystem.gameOrange,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${state.multiplier}X',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: DesignSystem.gameOrange,
                                      fontFamily: 'JetBrainsMono',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: DesignSystem.spaceMD),
                      Text(
                        'SCORE: ${state.score}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(DesignSystem.spaceLG),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: state.gridSize,
                                crossAxisSpacing: DesignSystem.spaceMD,
                                mainAxisSpacing: DesignSystem.spaceMD,
                              ),
                              itemCount: state.originalItems.length,
                              itemBuilder: (context, index) {
                                final isTarget = index == state.changeIndex;
                                final isTapped = state.lastTappedIndex == index;
                                final item = state.showOriginal
                                    ? state.originalItems[index]
                                    : state.changedItems[index];

                                final bool isVisible = item['visible'] ?? true;
                                final double rotation = item['rotation'] ?? 0.0;
                                final double scale = item['scale'] ?? 1.0;

                                Color buttonColor = colorScheme.surface;
                                Color shadowColor = colorScheme.outline;

                                if (state.isGameOver && isTarget) {
                                  buttonColor = DesignSystem.accentAmber.withValues(alpha: 0.25);
                                  shadowColor = DesignSystem.accentAmber;
                                } else if (isTapped && state.lastTapSuccess != null) {
                                  if (state.lastTapSuccess == true) {
                                    buttonColor = DesignSystem.success.withValues(alpha: 0.3);
                                    shadowColor = DesignSystem.success;
                                  } else {
                                    buttonColor = DesignSystem.error.withValues(alpha: 0.3);
                                    shadowColor = DesignSystem.error;
                                  }
                                }

                                return TangibleButton(
                                  onTap: () {
                                    if (state.isGameOver) return;
                                    if (index == state.changeIndex) {
                                      HapticFeedbackUtil.success();
                                    } else {
                                      HapticFeedbackUtil.error();
                                    }
                                    ref
                                        .read(changeBlindnessNotifierProvider
                                            .notifier)
                                        .tap(index);
                                  },
                                  color: buttonColor,
                                  shadowColor: shadowColor,
                                  padding: EdgeInsets.zero,
                                  child: isVisible
                                      ? Transform.rotate(
                                          angle: rotation,
                                          child: Transform.scale(
                                            scale: scale,
                                            child: Icon(
                                              item['icon'],
                                              color: item['color'],
                                              size: 32,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                );
                              },
                            ),
                            if (state.isFlickerActive)
                              Positioned.fill(
                                child: IgnorePointer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorScheme.surface.withValues(alpha: 0.85),
                                      borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
