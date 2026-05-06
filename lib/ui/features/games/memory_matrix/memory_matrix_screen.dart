import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import 'memory_matrix_provider.dart';

class MemoryMatrixScreen extends ConsumerWidget {
  const MemoryMatrixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(memoryMatrixNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(memoryMatrixNotifierProvider, (previous, next) {
      if (next.status == MemoryMatrixStatus.completed && 
          previous?.status != MemoryMatrixStatus.completed) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, true);
      } else if (next.status == MemoryMatrixStatus.failure && 
                 previous?.status != MemoryMatrixStatus.failure) {
        HapticFeedbackUtil.error();
        _showGameOverDialog(context, ref, false);
      } else if (next.status == MemoryMatrixStatus.success &&
                 previous?.status != MemoryMatrixStatus.success) {
        HapticFeedbackUtil.success();
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('MEMORY MATRIX'),
        actions: [
          IconButton(
            onPressed: () => ref.read(memoryMatrixNotifierProvider.notifier).reset(),
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
                child: _buildBoard(context, ref, state),
              ),
            ),
            _buildInstruction(context, state),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, MemoryMatrixState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(context, 'LEVEL', '${state.currentLevel}/5', DesignSystem.gameAmber),
          _buildStatCard(context, 'TARGET', '${state.targetPattern.length} TILES', DesignSystem.gameAmber),
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

  Widget _buildBoard(BuildContext context, WidgetRef ref, MemoryMatrixState state) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.boardSize,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: state.boardSize * state.boardSize,
          itemBuilder: (context, index) {
            return _buildTile(context, ref, state, index);
          },
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, WidgetRef ref, MemoryMatrixState state, int index) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final isTarget = state.targetPattern.contains(index);
    final isSelected = state.selectedPattern.contains(index);
    final isMemorizing = state.status == MemoryMatrixStatus.memorizing;
    final isSuccess = state.status == MemoryMatrixStatus.success || state.status == MemoryMatrixStatus.completed;
    final isFailure = state.status == MemoryMatrixStatus.failure;

    Color tileColor;
    if (isMemorizing && isTarget) {
      tileColor = DesignSystem.gameAmber;
    } else if (isSelected) {
      tileColor = DesignSystem.gameAmber;
    } else if (isSuccess && isTarget) {
      tileColor = DesignSystem.gameGreen;
    } else if (isFailure && isTarget) {
      tileColor = DesignSystem.gameAmber.withValues(alpha: 0.5);
    } else {
      tileColor = isDark ? DesignSystem.darkSurfaceElevated : DesignSystem.lightOutlineVariant;
    }

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(memoryMatrixNotifierProvider.notifier).selectTile(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          boxShadow: (isMemorizing && isTarget) || isSelected
              ? [
                  BoxShadow(
                    color: DesignSystem.gameAmber.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
      ),
    );
  }

  Widget _buildInstruction(BuildContext context, MemoryMatrixState state) {
    final theme = Theme.of(context);
    String text;
    Color color = theme.colorScheme.onSurface.withValues(alpha: 0.6);

    switch (state.status) {
      case MemoryMatrixStatus.memorizing:
        text = 'MEMORIZE THE PATTERN';
        color = DesignSystem.gameAmber;
        break;
      case MemoryMatrixStatus.playing:
        text = 'SELECT THE TILES';
        break;
      case MemoryMatrixStatus.success:
      case MemoryMatrixStatus.completed:
        text = 'PERFECT!';
        color = DesignSystem.gameGreen;
        break;
      case MemoryMatrixStatus.failure:
        text = 'WRONG TILE';
        color = DesignSystem.lightError;
        break;
    }

    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: color,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, bool isWon) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: theme.colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusXL)),
        title: Text(
          isWon ? 'GOAL REACHED!' : 'GAME OVER',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            color: isWon ? DesignSystem.gameGreen : DesignSystem.lightError,
          ),
        ),
        content: Text(
          isWon 
            ? 'Impressive! Your working memory is sharp. Daily goal complete!' 
            : 'Focus and try again to improve your memory score.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        actions: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.read(memoryMatrixNotifierProvider.notifier).reset();
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
