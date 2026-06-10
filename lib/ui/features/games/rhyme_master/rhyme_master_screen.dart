import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'rhyme_master_provider.dart';

class RhymeMasterScreen extends ConsumerStatefulWidget {
  const RhymeMasterScreen({super.key});

  @override
  ConsumerState<RhymeMasterScreen> createState() => _RhymeMasterScreenState();
}

class _RhymeMasterScreenState extends ConsumerState<RhymeMasterScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rhymeMasterNotifierProvider.notifier).startGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(rhymeMasterNotifierProvider);
    final isVictory = state.foundRhymes.length == state.puzzle?.allRhymes.length;
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.congrats.toUpperCase() : l10n.timeUp.toUpperCase(),
        message: AppLocalizations.of(context)!.rhymeMasterMessage((state.foundRhymes.length).toString(), (state.puzzle?.allRhymes.length).toString()),
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(rhymeMasterNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(rhymeMasterNotifierProvider);
    final notifier = ref.read(rhymeMasterNotifierProvider.notifier);

    ref.listen(rhymeMasterNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.foundRhymes.length == next.puzzle?.allRhymes.length) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('rhyme_master');
        _showCompletionDialog();
      }
      if (next.foundRhymes.length > (previous?.foundRhymes.length ?? 0)) {
        HapticFeedbackUtil.success();
      }
    });

    if (state.puzzle == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return GameScaffold(
      title: 'Rhyme Master',
      subtitle: 'Find all words that rhyme with...',
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
          const SizedBox(height: DesignSystem.spaceLG),
          TangibleContainer(
            color: DesignSystem.gameAmber,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Text(
              state.puzzle!.targetWord,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
            child: Row(
              children: [
                Expanded(
                  child: TangibleContainer(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Type a rhyming word...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onSubmitted: (value) {
                        notifier.submitWord(value);
                        _controller.clear();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                TangibleButton(
                  onTap: () {
                    notifier.submitWord(_controller.text);
                    _controller.clear();
                  },
                  color: DesignSystem.gameAmber,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.send_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLG),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.puzzle!.allRhymes.length,
              itemBuilder: (context, index) {
                final rhyme = state.puzzle!.allRhymes[index];
                final isFound = state.foundRhymes.contains(rhyme);
                return TangibleContainer(
                  color: isFound ? DesignSystem.gameGreen : colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  child: Center(
                    child: Text(
                      isFound ? rhyme : '?',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: isFound ? Colors.white : colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
