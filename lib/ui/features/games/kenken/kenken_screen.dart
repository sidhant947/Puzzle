import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../l10n/app_localizations.dart';
import 'kenken_provider.dart';

class KenKenScreen extends ConsumerStatefulWidget {
  const KenKenScreen({super.key});

  @override
  ConsumerState<KenKenScreen> createState() => _KenKenScreenState();
}

class _KenKenScreenState extends ConsumerState<KenKenScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(kenKenNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory, AppLocalizations l10n) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.kenkenWinTitle : l10n.kenkenLoseTitle,
        message: isVictory 
            ? l10n.kenkenWinMessage 
            : l10n.kenkenLoseMessage,
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(kenKenNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(kenKenNotifierProvider);
    final notifier = ref.read(kenKenNotifierProvider.notifier);

    ref.listen(kenKenNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('kenken');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(next.isGameWon, l10n);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.kenkenTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.kenkenTitle,
      subtitle: l10n.kenkenSubtitle(state.size),
      body: Column(
        children: [
          const SizedBox(height: DesignSystem.spaceLG),
          
          // Grid
          Expanded(
            child: _buildGrid(state, notifier),
          ),
          
          // Numpad
          _buildNumpad(state, notifier),
          
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildGrid(KenKenState state, KenKenNotifier notifier) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceMD),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            // Cells
            Column(
              children: List.generate(state.size, (r) {
                return Expanded(
                  child: Row(
                    children: List.generate(state.size, (c) {
                      final isSelected = state.selectedCell?.x == c && state.selectedCell?.y == r;
                      final value = state.grid[r][c];
                      final cageId = state.cages[r][c];
                      final cage = state.cageData[cageId];
                      
                      // Check if this cell is the "label" cell for the cage
                      final isLabelCell = (cage['cells'] as List<Point<int>>)[0].x == c && 
                                          (cage['cells'] as List<Point<int>>)[0].y == r;

                      return Expanded(
                        child: GestureDetector(
                          onTap: () => notifier.selectCell(r, c),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected ? DesignSystem.primary.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface,
                              border: _getBorder(context, state, r, c),
                            ),
                            child: Stack(
                              children: [
                                if (isLabelCell)
                                  Positioned(
                                    top: 2,
                                    left: 4,
                                    child: Text(
                                      '${cage['target']}${cage['op']}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w900,
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ),
                                Center(
                                  child: Text(
                                    value?.toString() ?? '',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: isSelected ? DesignSystem.primary : Theme.of(context).colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Border _getBorder(BuildContext context, KenKenState state, int r, int c) {
    final defaultSide = BorderSide(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5), width: 0.5);
    final cageSide = BorderSide(color: Theme.of(context).colorScheme.onSurface, width: 2.0);

    final cageId = state.cages[r][c];

    return Border(
      top: (r == 0 || state.cages[r - 1][c] != cageId) ? cageSide : defaultSide,
      bottom: (r == state.size - 1 || state.cages[r + 1][c] != cageId) ? cageSide : defaultSide,
      left: (c == 0 || state.cages[r][c - 1] != cageId) ? cageSide : defaultSide,
      right: (c == state.size - 1 || state.cages[r][c + 1] != cageId) ? cageSide : defaultSide,
    );
  }

  Widget _buildNumpad(KenKenState state, KenKenNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(state.size, (i) => _buildNumButton(i + 1, notifier)),
          _buildControlButton(Icons.backspace_rounded, notifier.onClear, DesignSystem.error),
        ],
      ),
    );
  }

  Widget _buildNumButton(int val, KenKenNotifier notifier) {
    return TangibleButton(
      onTap: () => notifier.onNumberPressed(val),
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      padding: const EdgeInsets.all(20),
      child: Text(
        '$val',
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 20, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap, Color color) {
    return TangibleButton(
      onTap: onTap,
      color: Theme.of(context).colorScheme.surface,
      shadowColor: Theme.of(context).colorScheme.outline,
      padding: const EdgeInsets.all(20),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
