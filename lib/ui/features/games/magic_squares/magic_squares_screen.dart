import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'magic_squares_provider.dart';

class MagicSquaresScreen extends ConsumerStatefulWidget {
  const MagicSquaresScreen({super.key});

  @override
  ConsumerState<MagicSquaresScreen> createState() => _MagicSquaresScreenState();
}

class _MagicSquaresScreenState extends ConsumerState<MagicSquaresScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(magicSquaresNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog(bool isVictory) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? 'PERFECT!' : 'GAME OVER',
        message: isVictory 
            ? 'The square is balanced!' 
            : 'Something is not adding up.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(magicSquaresNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(magicSquaresNotifierProvider);
    final notifier = ref.read(magicSquaresNotifierProvider.notifier);

    ref.listen(magicSquaresNotifierProvider, (previous, next) async {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.isGameWon) {
          HapticFeedbackUtil.victory();
          await ref.read(gameStreakNotifierProvider.notifier).completeGame('magic_squares');
        } else {
          HapticFeedbackUtil.vibrate();
        }
        if (!context.mounted) return;
        _showCompletionDialog(next.isGameWon);
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.magicSquaresTitle.toUpperCase(),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: 'Magic Square',
      subtitle: l10n.magicSquaresSubtitle(state.targetSum),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              _buildGrid(state, notifier, constraints.maxHeight * 0.5),
              const Spacer(),
              _buildNumpad(notifier),
              const SizedBox(height: DesignSystem.spaceLG),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGrid(MagicSquaresState state, MagicSquaresNotifier notifier, double maxHeight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: List.generate(3, (r) {
              return Expanded(
                child: Row(
                  children: List.generate(3, (c) {
                    final isSelected = state.selectedRow == r && state.selectedCol == c;
                    final isFixed = state.fixed[r][c];
                    final value = state.grid[r][c];
                    
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(DesignSystem.spaceSM),
                        child: TangibleButton(
                          onTap: () {
                            HapticFeedbackUtil.selectionClick();
                            notifier.selectCell(r, c);
                          },
                          color: isSelected 
                              ? DesignSystem.primary.withValues(alpha: 0.1) 
                              : (isFixed ? Theme.of(context).colorScheme.outline.withValues(alpha: 0.1) : Theme.of(context).colorScheme.surface),
                          shadowColor: isSelected 
                              ? DesignSystem.primaryShadow 
                              : Theme.of(context).colorScheme.outline,
                          depth: isSelected ? 2.0 : 4.0,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                value?.toString() ?? '',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  color: isFixed ? Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7) : DesignSystem.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildNumpad(MagicSquaresNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: Column(
        children: [
          Row(
            children: [
              _buildNumButton(1, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(2, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(3, notifier),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton(4, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(5, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(6, notifier),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          Row(
            children: [
              _buildNumButton(7, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(8, notifier),
              const SizedBox(width: DesignSystem.spaceMD),
              _buildNumButton(9, notifier),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceMD),
          TangibleButton(
            onTap: notifier.onClear,
            color: DesignSystem.error,
            shadowColor: const Color(0xFFB91C1C),
            child: const Center(
              child: Text('CLEAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumButton(int val, MagicSquaresNotifier notifier) {
    return Expanded(
      child: TangibleButton(
        onTap: () => notifier.onNumberPressed(val),
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.outline,
        child: Text(
          '$val',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
