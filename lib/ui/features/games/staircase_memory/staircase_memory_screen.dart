import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'staircase_memory_provider.dart';
import 'staircase_memory_engine.dart';

class StaircaseMemoryScreen extends ConsumerStatefulWidget {
  const StaircaseMemoryScreen({super.key});

  @override
  ConsumerState<StaircaseMemoryScreen> createState() => _StaircaseMemoryScreenState();
}

class _StaircaseMemoryScreenState extends ConsumerState<StaircaseMemoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(staircaseMemoryNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'LEVEL UP!' : 'GAME OVER',
        message: isVictory 
            ? 'Your working memory is expanding!' 
            : 'You got ${ref.read(staircaseMemoryNotifierProvider).correctCount} out of ${ref.read(staircaseMemoryNotifierProvider).totalTests} correct.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(staircaseMemoryNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(staircaseMemoryNotifierProvider);
    final notifier = ref.read(staircaseMemoryNotifierProvider.notifier);
    final engine = StaircaseMemoryEngine();

    ref.listen(staircaseMemoryNotifierProvider, (previous, next) async {
      if (next.phase == StaircasePhase.result && previous?.phase != StaircasePhase.result) {
        final isVictory = next.correctCount >= (next.totalTests * 0.8);
        if (isVictory) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('staircase_memory');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(isVictory);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.staircaseMemoryTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Staircase Memory',
      subtitle: state.phase == StaircasePhase.sequence 
          ? 'Memorize the icons' 
          : 'What was shown ${state.n} steps ago?',
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceXL),
          
          // Current Item Display
          Expanded(
            flex: 2,
            child: Center(
              child: _buildCurrentItem(state),
            ),
          ),
          
          // Answer Options
          if (state.phase == StaircasePhase.testing)
            Expanded(
              flex: 3,
              child: _buildOptions(state, notifier, engine),
            )
          else
            const Spacer(flex: 3),
            
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildCurrentItem(StaircaseState state) {
    final icon = state.sequence[state.currentIndex];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'CURRENT ITEM',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7).withValues(alpha: 0.5),
          ),
        ),
        SizedBox(height: DesignSystem.spaceMD),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey(state.currentIndex),
            padding: const EdgeInsets.all(DesignSystem.spaceXL),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).colorScheme.outline, width: 4),
            ),
            child: Icon(icon, size: 80, color: DesignSystem.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildOptions(StaircaseState state, StaircaseMemoryNotifier notifier, StaircaseMemoryEngine engine) {
    final allIcons = engine.allIcons;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: DesignSystem.spaceSM,
          mainAxisSpacing: DesignSystem.spaceSM,
        ),
        itemCount: allIcons.length,
        itemBuilder: (context, index) {
          final icon = allIcons[index];
          return TangibleButton(
            onTap: () => notifier.onOptionSelected(icon),
            color: Theme.of(context).colorScheme.surface,
            shadowColor: Theme.of(context).colorScheme.outline,
            padding: EdgeInsets.zero,
            child: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
          );
        },
      ),
    );
  }
}
