import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/ui/features/games/crown/crown_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';

class CrownScreen extends ConsumerStatefulWidget {
  const CrownScreen({super.key});

  @override
  ConsumerState<CrownScreen> createState() => _CrownScreenState();
}

class _CrownScreenState extends ConsumerState<CrownScreen> {
  final List<Color> _regionColors = [
    const Color(0xFFFEE2E2), // Red 100
    const Color(0xFFDBEAFE), // Blue 100
    const Color(0xFFD1FAE5), // Green 100
    const Color(0xFFFEF3C7), // Orange 100
    const Color(0xFFF3E8FF), // Purple 100
    const Color(0xFFCCFBF1), // Teal 100
    const Color(0xFFFCE7F3), // Pink 100
    const Color(0xFFECFCCB), // Lime 100
    const Color(0xFFE0E7FF), // Indigo 100
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crownNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(crownNotifierProvider);
    final notifier = ref.read(crownNotifierProvider.notifier);

    ref.listen(crownNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: 'CROWN',
      subtitle: 'Place one crown in each row, column, and color region. Crowns cannot be adjacent, even diagonally.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: state.board == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    _buildGrid(state, notifier, constraints.maxHeight * 0.5),
                    const Spacer(flex: 2),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildGrid(CrownState state, CrownNotifier notifier, double maxHeight) {
    final board = state.board!;
    final marked = state.markedCells;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: LayoutBuilder(builder: (context, constraints) {
            final double gridSize = min(constraints.maxWidth, constraints.maxHeight);

            return TangibleContainer(
              color: DesignSystem.ink,
              shadowColor: DesignSystem.inkSlate,
              depth: 4.0,
              radius: DesignSystem.radiusMD,
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: gridSize,
                height: gridSize,
                decoration: BoxDecoration(
                  color: DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: board.size,
                    ),
                    itemCount: board.size * board.size,
                    itemBuilder: (context, index) {
                      int x = index % board.size;
                      int y = index ~/ board.size;
                      int regionId = board.regions[y][x];
                      bool hasCrown = state.crowns.any((p) => p.x == x && p.y == y);
                      bool isMarked = marked.contains(Point(x, y));

                      // Check neighbors to draw thick borders between regions
                      bool borderTop = y > 0 && board.regions[y-1][x] != regionId;
                      bool borderBottom = y < board.size - 1 && board.regions[y+1][x] != regionId;
                      bool borderLeft = x > 0 && board.regions[y][x-1] != regionId;
                      bool borderRight = x < board.size - 1 && board.regions[y][x+1] != regionId;

                      final Color regionColor = _regionColors[regionId % _regionColors.length];

                      return GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.selectionClick();
                          notifier.tapCell(x, y);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: regionColor,
                            border: Border(
                              top: BorderSide(color: DesignSystem.ink, width: borderTop ? 2.5 : 0.5),
                              bottom: BorderSide(color: DesignSystem.ink, width: borderBottom ? 2.5 : 0.5),
                              left: BorderSide(color: DesignSystem.ink, width: borderLeft ? 2.5 : 0.5),
                              right: BorderSide(color: DesignSystem.ink, width: borderRight ? 2.5 : 0.5),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: FittedBox(
                                child: hasCrown
                                    ? const Icon(Icons.workspace_premium_rounded, color: DesignSystem.accentAmber, size: 28)
                                    : isMarked
                                        ? Icon(Icons.close_rounded, color: DesignSystem.ink.withValues(alpha: 0.2), size: 24)
                                        : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crown');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'CROWNED!',
        message: 'All crowns placed successfully with perfect logic.',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(crownNotifierProvider.notifier).initGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
