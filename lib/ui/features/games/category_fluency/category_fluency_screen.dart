import "package:puzzle/l10n/app_localizations.dart";
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
    final l10n = AppLocalizations.of(context)!;
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
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
      return GameScaffold(
        title: l10n.categoryFluencyTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.categoryFluencyTitle,
      subtitle: l10n.categoryFluencySubtitle,
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
                      l10n.categoryFluencyCategoryLabel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.7)),
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
                    color: state.timeLeft <= 10 ? DesignSystem.error.withValues(alpha: 0.1) : colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: state.timeLeft <= 10 ? DesignSystem.error : colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Text(
                    '${state.timeLeft}s',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: state.timeLeft <= 10 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: DesignSystem.spaceXL),
            TextField(
              controller: _controller,
              style: TextStyle(color: colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: l10n.categoryFluencyEnterItem,
                filled: true,
                fillColor: colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.outline.withValues(alpha: 0.5)),
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
