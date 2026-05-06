import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import 'number_match_engine.dart';
import 'number_match_provider.dart';

class NumberMatchScreen extends ConsumerWidget {
  const NumberMatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(numberMatchNotifierProvider);
    final notifier = ref.read(numberMatchNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(numberMatchNotifierProvider, (previous, next) {
      if (next.isWon && !(previous?.isWon ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      } else if (next.cleared.where((c) => c).length > (previous?.cleared.where((c) => c).length ?? 0)) {
        HapticFeedbackUtil.success();
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('NUMBER MATCH'),
        actions: [
          IconButton(
            onPressed: () {
              HapticFeedbackUtil.lightImpact();
              notifier.reset();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(context, state),
            const SizedBox(height: 24),
            Expanded(
              child: _buildGrid(context, ref, state, notifier),
            ),
            _buildFooter(context, state, notifier),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, NumberMatchState state) {
    final theme = Theme.of(context);
    final remaining = state.cleared.where((c) => !c).length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: DesignSystem.gameCyan.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
          border: Border.all(color: DesignSystem.gameCyan.withValues(alpha: 0.2), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.tag_rounded, size: 20, color: DesignSystem.gameCyan),
                const SizedBox(width: 12),
                Text(
                  'REMAINING',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: DesignSystem.gameCyan,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Text(
              remaining.toString(),
              style: theme.textTheme.titleLarge?.copyWith(
                color: DesignSystem.gameCyan,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, NumberMatchState state, NumberMatchNotifier notifier) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: NumberMatchEngine.columns,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 0.75,
        ),
        itemCount: state.numbers.length,
        itemBuilder: (context, index) {
          final number = state.numbers[index];
          final isCleared = state.cleared[index];
          final isSelected = state.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              if (!isCleared) {
                HapticFeedbackUtil.lightImpact();
                notifier.selectCell(index);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isCleared 
                    ? Colors.transparent
                    : isSelected 
                        ? DesignSystem.gameCyan.withValues(alpha: 0.25)
                        : isDark ? DesignSystem.darkSurfaceElevated : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isCleared
                      ? Colors.transparent
                      : isSelected
                          ? DesignSystem.gameCyan
                          : isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: !isCleared && !isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        )
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  isCleared ? '' : number.toString(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isSelected 
                        ? DesignSystem.gameCyan
                        : isDark ? Colors.white70 : theme.colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter(BuildContext context, NumberMatchState state, NumberMatchNotifier notifier) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        if (state.noMoreMoves && !state.isWon)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'NO MORE MOVES',
              style: theme.textTheme.labelMedium?.copyWith(
                color: DesignSystem.gameOrange,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ElevatedButton.icon(
          onPressed: () {
            HapticFeedbackUtil.selectionClick();
            notifier.addRows();
          },
          icon: const Icon(Icons.add_rounded, size: 20),
          label: const Text('ADD ROWS'),
          style: ElevatedButton.styleFrom(
            backgroundColor: DesignSystem.gameCyan,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
            ),
          ),
        ),
      ],
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusXL)),
        title: Text(
          'BOARD CLEARED!',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: DesignSystem.gameCyan,
          ),
        ),
        content: const Text(
          'Excellent pattern recognition! You successfully matched and cleared all the numbers.',
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(numberMatchNotifierProvider.notifier).reset();
                  },
                  child: const Text('PLAY AGAIN'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Pop dialog
                    Navigator.pop(context); // Pop screen
                  },
                  child: Text(
                    'BACK TO HUB',
                    style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
