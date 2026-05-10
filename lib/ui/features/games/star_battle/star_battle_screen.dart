import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../providers/user_providers.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/haptic_feedback.dart';
import 'star_battle_provider.dart';

class StarBattleScreen extends ConsumerStatefulWidget {
  const StarBattleScreen({super.key});

  @override
  ConsumerState<StarBattleScreen> createState() => _StarBattleScreenState();
}

class _StarBattleScreenState extends ConsumerState<StarBattleScreen> {
  final List<Color> _regionColors = [
    DesignSystem.primary.withValues(alpha: 0.1),
    DesignSystem.accentAmber.withValues(alpha: 0.1),
    DesignSystem.success.withValues(alpha: 0.1),
    DesignSystem.error.withValues(alpha: 0.1),
    DesignSystem.accentIndigo.withValues(alpha: 0.1),
    DesignSystem.accentOrange.withValues(alpha: 0.1),
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(starBattleNotifierProvider.notifier).initGame());
  }

  void _showGameOverDialog(bool won) {
    if (won) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('star_battle');
    } else {
      HapticFeedbackUtil.heavyImpact();
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'STELLAR LOGIC!' : 'ORBITAL CLASH',
        message: won ? 'All stars are perfectly aligned.' : 'Try again to master the orbits.',
        onPlayAgain: () {
          ref.read(starBattleNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(starBattleNotifierProvider);
    final notifier = ref.read(starBattleNotifierProvider.notifier);

    ref.listen(starBattleNotifierProvider, (previous, next) {
      if (previous != null && !previous.isGameOver && next.isGameOver) {
        _showGameOverDialog(next.isGameWon);
      }
    });

    return GameScaffold(
      title: 'STAR BATTLE',
      subtitle: 'Place one star in every row, column, and color region! Stars cannot touch each other, even diagonally.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 18,
          ),
        ),
      ],
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxHeight < 600;
                  return Column(
                    children: [
                      const Spacer(),
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: constraints.maxHeight * (isSmall ? 0.6 : 0.55),
                            maxWidth: constraints.maxWidth * 0.95,
                          ),
                          child: _buildGrid(state, notifier, isSmall),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(height: isSmall ? 16 : 40),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget _buildGrid(StarBattleState state, StarBattleNotifier notifier, bool isSmall) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
      child: TangibleContainer(
        color: DesignSystem.ink,
        shadowColor: DesignSystem.inkSlate,
        radius: DesignSystem.radiusSM,
        depth: isSmall ? 3.0 : 6.0,
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: BoxDecoration(
            color: DesignSystem.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 4),
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: List.generate(6, (r) => Expanded(
                  child: Row(
                    children: List.generate(6, (c) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.selectionClick();
                          notifier.onTileTapped(r, c);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _regionColors[state.regions[r][c] % _regionColors.length],
                            border: _getBorder(state.regions, r, c),
                          ),
                          child: Center(
                            child: _getIcon(state.userGrid[r][c], isSmall),
                          ),
                        ),
                      ),
                    )),
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Border _getBorder(List<List<int>> regions, int r, int c) {
    final regionId = regions[r][c];
    const color = DesignSystem.ink;
    const width = 2.0;
    final lightColor = DesignSystem.outline.withValues(alpha: 0.3);
    const lightWidth = 0.5;

    return Border(
      top: r > 0 && regions[r - 1][c] != regionId ? const BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      bottom: r < 5 && regions[r + 1][c] != regionId ? const BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      left: c > 0 && regions[r][c - 1] != regionId ? const BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
      right: c < 5 && regions[r][c + 1] != regionId ? const BorderSide(color: color, width: width) : BorderSide(color: lightColor, width: lightWidth),
    );
  }

  Widget? _getIcon(int type, bool isSmall) {
    if (type == 1) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: Icon(
          Icons.star_rounded, 
          color: DesignSystem.accentAmber, 
          size: isSmall ? 22 : 28
        ),
      );
    }
    if (type == 2) {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: Icon(
          Icons.close_rounded, 
          color: DesignSystem.ink.withValues(alpha: 0.2), 
          size: isSmall ? 16 : 20
        ),
      );
    }
    return null;
  }
}
