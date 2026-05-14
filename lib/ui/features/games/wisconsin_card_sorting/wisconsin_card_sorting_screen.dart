import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import 'wisconsin_card_sorting_provider.dart';
import 'wisconsin_card_sorting_engine.dart';

class WisconsinCardSortingScreen extends ConsumerStatefulWidget {
  const WisconsinCardSortingScreen({super.key});

  @override
  ConsumerState<WisconsinCardSortingScreen> createState() => _WisconsinCardSortingScreenState();
}

class _WisconsinCardSortingScreenState extends ConsumerState<WisconsinCardSortingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(wisconsinCardSortingNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(WCSState state) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.wisconsinCardSortingTitle.toUpperCase(),
        message: 'You correctly sorted ${state.score} cards!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(wisconsinCardSortingNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(wisconsinCardSortingNotifierProvider);

    ref.listen(wisconsinCardSortingNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showCompletionDialog(next);
      }
    });

    return GameScaffold(
      title: 'Card Sorting',
      subtitle: l10n.wisconsinCardSortingSubtitle,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SCORE: ${state.score}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      if (state.lastFeedback.isNotEmpty)
                        Text(
                          state.lastFeedback,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: state.lastFeedback == 'CORRECT' ? DesignSystem.success : DesignSystem.error,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: TangibleButton(
                            onTap: () {
                              HapticFeedbackUtil.selectionClick();
                              ref.read(wisconsinCardSortingNotifierProvider.notifier).sort(index);
                            },
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            padding: const EdgeInsets.all(DesignSystem.spaceXS),
                            child: _CardWidget(card: state.stimulusCards[index]),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Spacer(),
                if (state.currentCard != null)
                  Center(
                    child: TangibleContainer(
                      padding: const EdgeInsets.all(DesignSystem.spaceLG),
                      child: _CardWidget(card: state.currentCard!, size: 120),
                    ),
                  ),
                const Spacer(),
              ],
            ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  final WCSCard card;
  final double size;

  const _CardWidget({required this.card, this.size = 60});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    Color color;
    switch (card.color) {
      case 'red': color = Colors.red; break;
      case 'blue': color = Colors.blue; break;
      case 'green': color = Colors.green; break;
      case 'yellow': color = Colors.yellow; break;
      default: color = Colors.black;
    }

    IconData iconData;
    switch (card.shape) {
      case 'circle': iconData = Icons.circle; break;
      case 'triangle': iconData = Icons.change_history; break;
      case 'star': iconData = Icons.star; break;
      case 'cross': iconData = Icons.add; break;
      default: iconData = Icons.help;
    }

    return SizedBox(
      height: size,
      width: size,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) {
          if (index < card.number) {
            return Icon(iconData, color: color, size: size / 3);
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
