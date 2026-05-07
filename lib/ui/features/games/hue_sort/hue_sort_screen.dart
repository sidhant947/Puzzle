import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hue_sort_provider.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

class HueSortScreen extends ConsumerWidget {
  const HueSortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hueSortNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(hueSortNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'HUE SORT',
          style: theme.textTheme.titleMedium?.copyWith(
            letterSpacing: 4,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              HapticFeedbackUtil.mediumImpact();
              ref.read(hueSortNotifierProvider.notifier).newGame();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceLG),
            _buildInstructions(theme),
            const Spacer(),
            Center(
              child: _buildGrid(context, ref, state),
            ),
            const Spacer(),
            const SizedBox(height: DesignSystem.spaceXL),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructions(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
      child: Column(
        children: [
          Text(
            'COLOR GRADIENT',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSM),
          Text(
            'Swap tiles to create a smooth transition between corner colors. Dots indicate fixed tiles.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, HueSortState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boardSize = constraints.maxWidth * 0.95;

        return Container(
          width: boardSize,
          height: boardSize,
          padding: const EdgeInsets.all(DesignSystem.spaceXS),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.level.size,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: state.level.size * state.level.size,
            itemBuilder: (context, index) {
              final isFixed = state.level.fixedIndices.contains(index);
              final isSelected = state.selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(hueSortNotifierProvider.notifier).selectTile(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: state.currentColors[index],
                    borderRadius: BorderRadius.circular(isSelected ? DesignSystem.radiusMD : 2),
                    border: isSelected 
                        ? Border.all(color: Colors.white, width: 3) 
                        : null,
                  ),
                  child: isFixed
                      ? Center(
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.black26,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('hue_sort');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('EYE FOR COLOR!'),
        content: const Text('You perfectly sorted the gradient.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text('HOME'),
          ),
        ],
      ),
    );
  }
}
