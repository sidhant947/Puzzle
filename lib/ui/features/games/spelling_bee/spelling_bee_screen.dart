import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'spelling_bee_provider.dart';
import 'spelling_bee_engine.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';

class SpellingBeeScreen extends ConsumerWidget {
  const SpellingBeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(spellingBeeNotifierProvider);
    final notifier = ref.read(spellingBeeNotifierProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'SPELLING BEE',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              notifier.reset();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildScoreBoard(state, theme),
            Expanded(
              child: _buildFoundWords(state, theme),
            ),
            if (state.errorMessage != null)
              Text(state.errorMessage!, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildCurrentWord(state, theme),
            const SizedBox(height: 24),
            _buildHoneycomb(state, notifier, theme),
            const SizedBox(height: 24),
            _buildControls(notifier, theme),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBoard(SpellingBeeState state, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('WORDS FOUND', style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey)),
              Text('${state.foundWords.length} / ${state.validWords.length}', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.emoji_events_rounded, size: 16),
            label: Text('${state.foundWords.length * 10} XP'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.withValues(alpha: 0.1),
              foregroundColor: Colors.amber[800],
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoundWords(SpellingBeeState state, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: state.foundWords.map((word) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
            ),
            child: Text(word, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildCurrentWord(SpellingBeeState state, ThemeData theme) {
    return Text(
      state.currentWord.isEmpty ? 'Type or tap letters' : state.currentWord,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
        color: state.currentWord.isEmpty ? Colors.grey[400] : theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildHoneycomb(SpellingBeeState state, SpellingBeeNotifier notifier, ThemeData theme) {
    final letters = state.letters.split('');
    final center = state.centerLetter;
    final outer = letters.where((l) => l != center).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHexButton(outer[0], false, notifier, theme),
            const SizedBox(width: 8),
            _buildHexButton(outer[1], false, notifier, theme),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHexButton(outer[2], false, notifier, theme),
            const SizedBox(width: 8),
            _buildHexButton(center, true, notifier, theme),
            const SizedBox(width: 8),
            _buildHexButton(outer[3], false, notifier, theme),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHexButton(outer[4], false, notifier, theme),
            const SizedBox(width: 8),
            _buildHexButton(outer[5], false, notifier, theme),
          ],
        ),
      ],
    );
  }

  Widget _buildHexButton(String letter, bool isCenter, SpellingBeeNotifier notifier, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.selectionClick();
        notifier.addLetter(letter);
      },
      child: Container(
        width: 70,
        height: 80,
        decoration: BoxDecoration(
          color: isCenter ? Colors.amber : theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(12), // Placeholder for real hex shape
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: isCenter ? Colors.black : theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  Widget _buildControls(SpellingBeeNotifier notifier, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.removeLetter();
          },
          child: const Text('DELETE'),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.submitWord();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          child: const Text('ENTER'),
        ),
      ],
    );
  }
}
