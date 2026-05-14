import "package:puzzle/l10n/app_localizations.dart";
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
    const Color(0xFFF87171), // Red 400
    const Color(0xFF60A5FA), // Blue 400
    const Color(0xFF34D399), // Emerald 400
    const Color(0xFFFBBF24), // Amber 400
    const Color(0xFFC084FC), // Purple 400
    const Color(0xFFFB923C), // Orange 400
    const Color(0xFF2DD4BF), // Teal 400
    const Color(0xFFF472B6), // Pink 400
    const Color(0xFF818CF8), // Indigo 400
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crownNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(crownNotifierProvider);
    final notifier = ref.read(crownNotifierProvider.notifier);

    ref.listen(crownNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.crownTitle.toUpperCase(),
      subtitle: l10n.crownSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
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
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2.0),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 2),
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
                            top: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderTop ? 2.5 : 0.5),
                            bottom: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderBottom ? 2.5 : 0.5),
                            left: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderLeft ? 2.5 : 0.5),
                            right: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderRight ? 2.5 : 0.5),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FittedBox(
                              child: hasCrown
                                  ? Icon(Icons.workspace_premium_rounded, color: DesignSystem.accentAmber, size: 28)
                                  : isMarked
                                      ? Icon(Icons.close_rounded, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2), size: 24)
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
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
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
