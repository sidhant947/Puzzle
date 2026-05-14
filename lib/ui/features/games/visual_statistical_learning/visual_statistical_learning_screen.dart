import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import 'visual_statistical_learning_provider.dart';

class VisualStatisticalLearningScreen extends ConsumerStatefulWidget {
  const VisualStatisticalLearningScreen({super.key});

  @override
  ConsumerState<VisualStatisticalLearningScreen> createState() => _VisualStatisticalLearningScreenState();
}

class _VisualStatisticalLearningScreenState extends ConsumerState<VisualStatisticalLearningScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(visualStatisticalLearningNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(VSLState state) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.visualStatisticalLearningTitle.toUpperCase(),
        message: 'You scored ${state.score} correct patterns!',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(visualStatisticalLearningNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(visualStatisticalLearningNotifierProvider);

    ref.listen(visualStatisticalLearningNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        _showCompletionDialog(next);
      }
    });

    return GameScaffold(
      title: 'Statistical Learning',
      subtitle: state.phase == VSLPhase.learning
          ? 'WATCH THE SEQUENCE CAREFULLY'
          : 'WHICH PATTERN DID YOU SEE?',
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
                    child: state.phase == VSLPhase.learning
                        ? _buildLearningPhase(state)
                        : _buildTestPhase(state),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLearningPhase(VSLState state) {
    final icon = state.learningSequence[state.currentSequenceIndex];
    return TangibleContainer(
      padding: const EdgeInsets.all(DesignSystem.space2XL),
      radius: DesignSystem.radiusXL,
      child: Icon(
        icon,
        size: 120,
        color: DesignSystem.primary,
      ),
    );
  }

  Widget _buildTestPhase(VSLState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        children: [
          Expanded(
            child: _buildTestOption(
              icons: state.testLeft,
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                ref.read(visualStatisticalLearningNotifierProvider.notifier).choose(true);
              },
            ),
          ),
          const SizedBox(width: DesignSystem.spaceLG),
          Expanded(
            child: _buildTestOption(
              icons: state.testRight,
              onTap: () {
                HapticFeedbackUtil.selectionClick();
                ref.read(visualStatisticalLearningNotifierProvider.notifier).choose(false);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestOption({required List<IconData> icons, required VoidCallback onTap}) {
    return TangibleButton(
      onTap: onTap,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: icons
            .map((icon) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Icon(icon, size: 48, color: Theme.of(context).colorScheme.onSurface),
                ))
            .toList(),
      ),
    );
  }
}
