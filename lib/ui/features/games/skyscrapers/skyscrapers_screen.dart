import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'skyscrapers_provider.dart';

class SkyscrapersScreen extends ConsumerStatefulWidget {
  const SkyscrapersScreen({super.key});

  @override
  ConsumerState<SkyscrapersScreen> createState() => _SkyscrapersScreenState();
}

class _SkyscrapersScreenState extends ConsumerState<SkyscrapersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(skyscrapersNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.skyscrapersWinTitle,
        message: l10n.skyscrapersWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(skyscrapersNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(skyscrapersNotifierProvider);
    final notifier = ref.read(skyscrapersNotifierProvider.notifier);

    ref.listen(skyscrapersNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('skyscrapers');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.skyscrapersTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.skyscrapersTitle,
      subtitle: l10n.skyscrapersSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          padding: const EdgeInsets.all(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(l10n.howToPlay),
                content: Text(l10n.skyscrapersHowToPlay),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l10n.gotIt),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.help_outline, color: colorScheme.onSurface),
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceLG),
          child: AspectRatio(
            aspectRatio: 1,
            child: LayoutBuilder(builder: (context, constraints) {
              final size = state.grid.length;
              final cellSize = constraints.maxWidth / (size + 2);
              return Column(
                children: [
                  // Top clues
                  Row(
                    children: [
                      SizedBox(width: cellSize),
                      ...List.generate(size, (i) => _buildClue(state.top[i], cellSize)),
                      SizedBox(width: cellSize),
                    ],
                  ),
                  // Middle: Left clues + Grid + Right clues
                  ...List.generate(size, (r) {
                    return Row(
                      children: [
                        _buildClue(state.left[r], cellSize),
                        ...List.generate(size, (c) => _buildCell(state, notifier, r, c, cellSize)),
                        _buildClue(state.right[r], cellSize),
                      ],
                    );
                  }),
                  // Bottom clues
                  Row(
                    children: [
                      SizedBox(width: cellSize),
                      ...List.generate(size, (i) => _buildClue(state.bottom[i], cellSize)),
                      SizedBox(width: cellSize),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildClue(int val, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Text(
          val == 0 ? '' : val.toString(),
          style: TextStyle(
            color: colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildCell(SkyscrapersState state, SkyscrapersNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final val = state.grid[r][c];

    return GestureDetector(
      onTap: () {
        int nextVal = (val + 1) % (state.grid.length + 1);
        notifier.updateCell(r, c, nextVal);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3), 
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            val == 0 ? '' : val.toString(),
            style: TextStyle(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
