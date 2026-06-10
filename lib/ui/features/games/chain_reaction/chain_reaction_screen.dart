import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'chain_reaction_provider.dart';

class ChainReactionScreen extends ConsumerStatefulWidget {
  const ChainReactionScreen({super.key});

  @override
  ConsumerState<ChainReactionScreen> createState() => _ChainReactionScreenState();
}

class _ChainReactionScreenState extends ConsumerState<ChainReactionScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chainReactionNotifierProvider.notifier).startGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(chainReactionNotifierProvider);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.timeUp.toUpperCase(),
        message: AppLocalizations.of(context)!.chainReactionMessage((state.score).toString(), (state.chain.length).toString()),
        isVictory: state.score > 0,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(chainReactionNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(chainReactionNotifierProvider);
    final notifier = ref.read(chainReactionNotifierProvider.notifier);

    ref.listen(chainReactionNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('chain_reaction');
        _showCompletionDialog();
      }
      if (next.chain.length > (previous?.chain.length ?? 0)) {
        HapticFeedbackUtil.success();
      }
      if (next.error != null && next.error != previous?.error) {
        HapticFeedbackUtil.vibrate();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), duration: const Duration(seconds: 1)),
        );
        notifier.clearError();
      }
    });

    return GameScaffold(
      title: 'Chain Reaction',
      subtitle: 'Last 2 letters of word must be first 2 letters of next',
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
                      color: state.timeLeft < 15 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
              itemCount: state.chain.length,
              itemBuilder: (context, index) {
                final word = state.chain[index];
                final isLast = index == state.chain.length - 1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: isLast ? DesignSystem.gameGreen : DesignSystem.gameBlue,
                        child: Text(AppLocalizations.of(context)!.chainReactionText((index + 1).toString()), style: const TextStyle(fontSize: 10, color: Colors.white)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TangibleContainer(
                          color: isLast ? DesignSystem.gameGreen.withValues(alpha: 0.1) : null,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: colorScheme.onSurface,
                              ),
                              children: [
                                TextSpan(text: word.substring(0, word.length - 2)),
                                TextSpan(
                                  text: word.substring(word.length - 2),
                                  style: const TextStyle(color: DesignSystem.gameAmber),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              children: [
                Expanded(
                  child: TangibleContainer(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter next word...',
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
                  color: DesignSystem.gameGreen,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.add_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
