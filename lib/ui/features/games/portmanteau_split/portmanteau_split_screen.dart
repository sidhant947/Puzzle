import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'portmanteau_split_provider.dart';

class PortmanteauSplitScreen extends ConsumerStatefulWidget {
  const PortmanteauSplitScreen({super.key});

  @override
  ConsumerState<PortmanteauSplitScreen> createState() => _PortmanteauSplitScreenState();
}

class _PortmanteauSplitScreenState extends ConsumerState<PortmanteauSplitScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(portmanteauSplitNotifierProvider.notifier).startGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final score = ref.read(portmanteauSplitNotifierProvider).score;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: AppLocalizations.of(context)!.portmanteauSplitMessage((score).toString()),
        isVictory: score > 5,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(portmanteauSplitNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(portmanteauSplitNotifierProvider);
    final notifier = ref.read(portmanteauSplitNotifierProvider.notifier);

    ref.listen(portmanteauSplitNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('portmanteau_split');
        _showCompletionDialog();
      }
      if (next.isCorrect && !(previous?.isCorrect ?? false)) {
        HapticFeedbackUtil.lightImpact();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'portmanteau_split'),
      subtitle: L10nGameHelpers.getGameTitle(context, 'portmanteau_split'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Score: ${state.score}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 10 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (state.puzzle != null) ...[
            TangibleContainer(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              color: DesignSystem.gameIndigo.withValues(alpha: 0.1),
              width: double.infinity,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    state.puzzle!.portmanteau.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: DesignSystem.gameIndigo,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: DesignSystem.space2XL),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: DesignSystem.spaceMD,
                  mainAxisSpacing: DesignSystem.spaceMD,
                ),
                itemCount: state.puzzle!.options.length,
                itemBuilder: (context, index) {
                  final word = state.puzzle!.options[index];
                  final isSelected = state.selectedWords.contains(word);
                  
                  return TangibleButton(
                    onTap: () => notifier.selectWord(word),
                    color: isSelected ? DesignSystem.gameIndigo : colorScheme.surface,
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          word.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: isSelected ? Colors.white : colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const Spacer(),
        ],
      ),
    );
  }
}
