import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'simon_sequence_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class SimonSequenceScreen extends ConsumerStatefulWidget {
  const SimonSequenceScreen({super.key});

  @override
  ConsumerState<SimonSequenceScreen> createState() => _SimonSequenceScreenState();
}

class _SimonSequenceScreenState extends ConsumerState<SimonSequenceScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(simonSequenceNotifierProvider.notifier).startSequence());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(simonSequenceNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(simonSequenceNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.heavyImpact();
        _showGameOverDialog(context, ref, next, theme, false);
      }
      if (next.isGameWon && !(previous?.isGameWon ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next, theme, true);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('SEQUENCE')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.isShowingSequence ? 'WATCH...' : 'YOUR TURN!', 
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 16),
          Text('${state.userSequence.length} / ${state.sequence.length}', 
            style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
          const SizedBox(height: 32),
          Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    final isHighlighted = state.highlightedTile == index;
                    return GestureDetector(
                      onTap: () {
                        if (!state.isShowingSequence) {
                          HapticFeedbackUtil.selectionClick();
                          ref.read(simonSequenceNotifierProvider.notifier).tapTile(index);
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: isHighlighted ? theme.colorScheme.primary : theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
                          boxShadow: isHighlighted ? [
                            BoxShadow(color: theme.colorScheme.primary.withOpacity(0.5), blurRadius: 10)
                          ] : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: state.isShowingSequence ? null : () => ref.read(simonSequenceNotifierProvider.notifier).reset(),
            child: const Text('RESTART'),
          ),
        ],
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, SimonSequenceState state, ThemeData theme, bool won) {
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('simon_sequence', xpAmount: 50);
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(won ? 'PERFECT!' : 'WRONG SEQUENCE'),
        content: Text(won ? 'You memorized all 10 tiles!' : 'Try again to master the sequence.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (won) Navigator.pop(context);
              else ref.read(simonSequenceNotifierProvider.notifier).reset();
            },
            child: const Text('CONTINUE'),
          )
        ],
      ),
    );
  }
}
