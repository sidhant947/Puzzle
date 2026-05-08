import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import 'nonogram_provider.dart';

class NonogramScreen extends ConsumerStatefulWidget {
  const NonogramScreen({super.key});

  @override
  ConsumerState<NonogramScreen> createState() => _NonogramScreenState();
}

class _NonogramScreenState extends ConsumerState<NonogramScreen> {
  bool _isMarkMode = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nonogramNotifierProvider);
    final theme = Theme.of(context);

    ref.listen(nonogramNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'IMAGE REVEALED!',
            message: 'Excellent logical deduction. The hidden image has been successfully revealed!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              ref.read(nonogramNotifierProvider.notifier).reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('NONOGRAM'),
        actions: [
          IconButton(
            onPressed: () => ref.read(nonogramNotifierProvider.notifier).reset(),
            icon: const Icon(Icons.refresh_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildStatusHeader(state),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: _buildPuzzleArea(state),
              ),
            ),
            _buildControls(theme),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusHeader(NonogramState state) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: DesignSystem.gameRose.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
          border: Border.all(color: DesignSystem.gameRose.withValues(alpha: 0.2), width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.grid_on_rounded, size: 18, color: DesignSystem.gameRose),
            const SizedBox(width: 12),
            Text(
              'REVEAL THE HIDDEN IMAGE',
              style: theme.textTheme.labelSmall?.copyWith(
                color: DesignSystem.gameRose,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPuzzleArea(NonogramState state) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Column Clues
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 60), // Space for row clues
                  for (int c = 0; c < state.size; c++)
                    _buildColClue(state.colClues[c]),
                ],
              ),
              const SizedBox(height: 4),
              // Grid with Row Clues
              for (int r = 0; r < state.size; r++)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildRowClue(state.rowClues[r]),
                    const SizedBox(width: 4),
                    for (int c = 0; c < state.size; c++)
                      _buildCell(state, r, c),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColClue(List<int> clues) {
    final theme = Theme.of(context);
    return Container(
      width: 50,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                clue.toString(),
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRowClue(List<int> clues) {
    final theme = Theme.of(context);
    return Container(
      width: 60,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int clue in clues)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                clue.toString(),
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCell(NonogramState state, int r, int c) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final value = state.grid[r][c];

    return GestureDetector(
      onTap: () {
        HapticFeedbackUtil.lightImpact();
        ref.read(nonogramNotifierProvider.notifier).toggleCell(r, c, _isMarkMode);
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: value == 1
              ? DesignSystem.gameRose
              : (isDark ? DesignSystem.darkSurfaceElevated : Colors.white),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline,
            width: 1,
          ),
        ),
        child: Center(
          child: value == 2
              ? Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildControls(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildModeButton(
            icon: Icons.square_rounded,
            label: 'FILL',
            isActive: !_isMarkMode,
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              setState(() => _isMarkMode = false);
            },
          ),
          const SizedBox(width: 24),
          _buildModeButton(
            icon: Icons.close_rounded,
            label: 'MARK X',
            isActive: _isMarkMode,
            onTap: () {
              HapticFeedbackUtil.selectionClick();
              setState(() => _isMarkMode = true);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModeButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final color = isActive ? DesignSystem.gameRose : theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? DesignSystem.gameRose.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(
            color: isActive ? DesignSystem.gameRose.withValues(alpha: 0.5) : theme.colorScheme.outline.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
