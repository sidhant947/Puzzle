import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'category_fluency_provider.dart';

class CategoryFluencyScreen extends ConsumerStatefulWidget {
  const CategoryFluencyScreen({super.key});

  @override
  ConsumerState<CategoryFluencyScreen> createState() => _CategoryFluencyScreenState();
}

class _CategoryFluencyScreenState extends ConsumerState<CategoryFluencyScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryFluencyNotifierProvider.notifier).initGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'FLUENCY EXPERT!' : 'TIME UP!',
        message: isVictory 
            ? 'You have a vast vocabulary!' 
            : 'You found ${ref.read(categoryFluencyNotifierProvider).enteredWords.length} words.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(categoryFluencyNotifierProvider.notifier).initGame();
          _controller.clear();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryFluencyNotifierProvider);
    final notifier = ref.read(categoryFluencyNotifierProvider.notifier);

    ref.listen(categoryFluencyNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        final isVictory = next.enteredWords.length >= next.targetCount;
        if (isVictory) {
          HapticFeedbackUtil.victory();
          ref.read(gameStreakNotifierProvider.notifier).completeGame('category_fluency');
        } else {
          HapticFeedbackUtil.lightImpact();
        }
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return const GameScaffold(
        title: 'Category Fluency',
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Category Fluency',
      subtitle: 'Enter items belonging to the category',
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceLG),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category:',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: DesignSystem.inkSlate),
                    ),
                    Text(
                      state.currentCategory?.name ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: state.timeLeft <= 10 ? DesignSystem.error.withValues(alpha: 0.1) : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: state.timeLeft <= 10 ? DesignSystem.error : DesignSystem.outline,
                    ),
                  ),
                  child: Text(
                    '${state.timeLeft}s',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: state.timeLeft <= 10 ? DesignSystem.error : DesignSystem.ink,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignSystem.spaceXL),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter an item...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: DesignSystem.outline),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: DesignSystem.success),
                  onPressed: () {
                    if (notifier.addWord(_controller.text)) {
                      HapticFeedbackUtil.lightImpact();
                      _controller.clear();
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (notifier.addWord(value)) {
                  HapticFeedbackUtil.lightImpact();
                  _controller.clear();
                }
              },
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Text(
              '${state.enteredWords.length} / ${state.targetCount} words',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: DesignSystem.spaceLG),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: state.enteredWords.map((word) {
                    return Chip(
                      label: Text(word),
                      backgroundColor: DesignSystem.success.withValues(alpha: 0.1),
                      side: const BorderSide(color: DesignSystem.success),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
