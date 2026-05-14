import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
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
      ref.read(changeBlindnessNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(ChangeBlindnessState state) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'GAME OVER',
        message: 'You found ${state.score} changes!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(changeBlindnessNotifierProvider.notifier).initGame();
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
      actions: [
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
                  padding: const EdgeInsets.all(DesignSystem.spaceLG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SCORE: ${state.score}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
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
                                final item = state.showOriginal
                                    ? state.originalItems[index]
                                    : state.changedItems[index];
                                return TangibleButton(
                                  onTap: () {
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
                                  color: colorScheme.surface,
                                  shadowColor: colorScheme.outline,
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    item['icon'],
                                    color: item['color'],
                                    size: 32,
                                  ),
                                );
                              },
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
