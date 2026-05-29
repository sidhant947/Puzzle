import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'memory_palace_provider.dart';

class MemoryPalaceScreen extends ConsumerWidget {
  const MemoryPalaceScreen({super.key});

  void _showGameOverDialog(BuildContext context, WidgetRef ref, bool success) {
    if (success) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('memory_palace');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: success ? 'MEMORY MASTER!' : 'FORGOTTEN...',
        message: success 
          ? 'You remembered all the word locations!' 
          : 'Some words weren\'t quite in the right place.',
        onPlayAgain: () {
          ref.read(memoryPalaceNotifierProvider.notifier).reset();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(memoryPalaceNotifierProvider);
    final notifier = ref.read(memoryPalaceNotifierProvider.notifier);

    ref.listen(memoryPalaceNotifierProvider, (previous, next) {
      if ((next.status == MemoryPalaceStatus.success || next.status == MemoryPalaceStatus.failure) &&
          (previous?.status != MemoryPalaceStatus.success && previous?.status != MemoryPalaceStatus.failure)) {
        _showGameOverDialog(context, ref, next.status == MemoryPalaceStatus.success);
      }
    });

    return GameScaffold(
      title: l10n.memoryPalaceTitle.toUpperCase(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                state.status == MemoryPalaceStatus.memorizing
                    ? l10n.memoryPalaceSubtitle
                    : 'Place the words back in their positions.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: _buildGrid(context, ref, state),
              ),
              const SizedBox(height: 32),
              if (state.status == MemoryPalaceStatus.memorizing)
                SizedBox(
                  width: double.infinity,
                  child: TangibleButton(
                    onTap: () => notifier.startRecalling(),
                    color: DesignSystem.primary,
                    child: const Center(
                      child: Text(
                        'I\'M READY',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              else if (state.status == MemoryPalaceStatus.recalling)
                _buildWordPool(context, ref, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, MemoryPalaceState state) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        final isAssigned = state.assignments.containsKey(index);
        final recalledWord = state.userRecall[index];
        final isSelected = state.selectedPosition == index;
        
        String? displayText;
        if (state.status == MemoryPalaceStatus.memorizing) {
          displayText = state.assignments[index];
        } else {
          displayText = recalledWord;
        }

        return GestureDetector(
          onTap: state.status == MemoryPalaceStatus.recalling
              ? () => ref.read(memoryPalaceNotifierProvider.notifier).selectPosition(index)
              : null,
          child: TangibleContainer(
            depth: isSelected ? 0 : 4,
            color: isSelected ? DesignSystem.primary.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    displayText ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: displayText != null ? DesignSystem.primary : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWordPool(BuildContext context, WidgetRef ref, MemoryPalaceState state) {
    // Filter out words already placed
    final placedWords = state.userRecall.values.toSet();
    // ignore: unused_local_variable
    final remainingWords = state.availableWords.where((w) => !placedWords.contains(w)).toList();

    // Each chip gets at most ~30% of screen width so 3 can sit comfortably per row
    final chipMaxWidth = (MediaQuery.sizeOf(context).width - 48) * 0.30;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('AVAILABLE WORDS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: state.availableWords.map((word) {
            final isPlaced = placedWords.contains(word);
            final isSelected = state.selectedWord == word;

            return GestureDetector(
              onTap: !isPlaced
                  ? () => ref.read(memoryPalaceNotifierProvider.notifier).selectWord(word)
                  : null,
              child: Opacity(
                opacity: isPlaced ? 0.3 : 1.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: chipMaxWidth),
                  child: TangibleContainer(
                    depth: isSelected ? 0 : 2,
                    color: isSelected ? DesignSystem.accentEmerald : Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        word,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
