import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import 'schulte_table_provider.dart';

class SchulteTableScreen extends ConsumerWidget {
  const SchulteTableScreen({super.key});

  String _formatDuration(Duration d) {
    String seconds = (d.inMilliseconds / 1000).toStringAsFixed(1);
    return '${seconds}s';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(schulteTableNotifierProvider);
    final notifier = ref.read(schulteTableNotifierProvider.notifier);
    final theme = Theme.of(context);

    ref.listen(schulteTableNotifierProvider, (previous, next) {
      if (next.status == SchulteStatus.completed && 
          previous?.status != SchulteStatus.completed) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref, next.elapsedTime);
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('SCHULTE TABLE'),
        actions: [
          IconButton(
            onPressed: () => notifier.reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            _buildHeader(context, state),
            const SizedBox(height: 48),
            Expanded(
              child: Center(
                child: _buildGrid(context, ref, state, notifier),
              ),
            ),
            _buildFooter(context, state, notifier),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, SchulteTableState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(context, 'TIME', _formatDuration(state.elapsedTime), DesignSystem.gameViolet),
          _buildStatCard(
            context, 
            'BEST', 
            state.bestTime != null ? _formatDuration(state.bestTime!) : '--', 
            DesignSystem.gameViolet
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(color: color, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, SchulteTableState state, SchulteTableNotifier notifier) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            final value = state.grid[index];
            final isTapped = value < state.nextNumber;

            return GestureDetector(
              onTap: () {
                if (state.status == SchulteStatus.playing) {
                  if (value == state.nextNumber) {
                    HapticFeedbackUtil.lightImpact();
                  } else {
                    HapticFeedbackUtil.error();
                  }
                  notifier.tapNumber(value);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isTapped 
                      ? DesignSystem.gameViolet.withValues(alpha: 0.1)
                      : isDark ? DesignSystem.darkSurfaceElevated : Colors.white,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                  border: Border.all(
                    color: isTapped 
                        ? DesignSystem.gameViolet.withValues(alpha: 0.3)
                        : isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    value.toString(),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: isTapped 
                          ? DesignSystem.gameViolet.withValues(alpha: 0.4)
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, SchulteTableState state, SchulteTableNotifier notifier) {
    final theme = Theme.of(context);
    
    if (state.status == SchulteStatus.ready) {
      return ElevatedButton(
        onPressed: () {
          HapticFeedbackUtil.selectionClick();
          notifier.startGame();
        },
        child: const Text('START TEST'),
      );
    }

    return Column(
      children: [
        Text(
          'FIND NUMBER: ${state.nextNumber}',
          style: theme.textTheme.labelLarge?.copyWith(
            color: DesignSystem.gameViolet,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'FOCUS ON THE CENTER',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, Duration time) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusXL)),
        title: Text(
          'GREAT FOCUS!',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: DesignSystem.gameViolet,
          ),
        ),
        content: Text(
          'You completed the table in ${_formatDuration(time)}.\nKeep practicing to expand your peripheral vision!',
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(schulteTableNotifierProvider.notifier).reset();
                  },
                  child: const Text('TRY AGAIN'),
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
