import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'nurikabe_provider.dart';

class NurikabeScreen extends ConsumerStatefulWidget {
  const NurikabeScreen({super.key});

  @override
  ConsumerState<NurikabeScreen> createState() => _NurikabeScreenState();
}

class _NurikabeScreenState extends ConsumerState<NurikabeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(nurikabeNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.nurikabeWinTitle,
        message: l10n.nurikabeWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(nurikabeNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(nurikabeNotifierProvider);
    final notifier = ref.read(nurikabeNotifierProvider.notifier);

    ref.listen(nurikabeNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('nurikabe');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.nurikabeTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.nurikabeTitle,
      subtitle: l10n.nurikabeSubtitle,
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
                content: Text(l10n.nurikabeHowToPlay),
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
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.onSurface, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                final size = state.grid.length;
                final cellSize = constraints.maxWidth / size;
                return Column(
                  children: List.generate(size, (r) {
                    return Row(
                      children: List.generate(size, (c) {
                        return _buildCell(state, notifier, r, c, cellSize);
                      }),
                    );
                  }),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCell(NurikabeState state, NurikabeNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final val = state.grid[r][c];
    final isClue = state.initialGrid[r][c] > 0;

    return GestureDetector(
      onTap: () => notifier.toggleCell(r, c),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: val == -1 ? colorScheme.onSurface : colorScheme.surface,
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3), 
            width: 0.5,
          ),
        ),
        child: Center(
          child: isClue
              ? Text(
                  val.toString(),
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
