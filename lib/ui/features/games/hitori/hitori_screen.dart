import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'hitori_provider.dart';

class HitoriScreen extends ConsumerStatefulWidget {
  const HitoriScreen({super.key});

  @override
  ConsumerState<HitoriScreen> createState() => _HitoriScreenState();
}

class _HitoriScreenState extends ConsumerState<HitoriScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(hitoriNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.hitoriWinTitle,
        message: l10n.hitoriWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(hitoriNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(hitoriNotifierProvider);
    final notifier = ref.read(hitoriNotifierProvider.notifier);

    ref.listen(hitoriNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('hitori');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.hitoriTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.hitoriTitle,
      subtitle: l10n.hitoriSubtitle,
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
                content: Text(l10n.hitoriHowToPlay),
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
                final cellSize = constraints.maxWidth / state.grid.length;
                return Column(
                  children: List.generate(state.grid.length, (r) {
                    return Row(
                      children: List.generate(state.grid.length, (c) {
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

  Widget _buildCell(HitoriState state, HitoriNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final val = state.grid[r][c];
    final isShaded = state.shaded[r][c];

    return GestureDetector(
      onTap: () => notifier.toggleShade(r, c),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isShaded ? colorScheme.onSurface : colorScheme.surface,
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.3), 
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            val.toString(),
            style: TextStyle(
              color: isShaded ? colorScheme.surface : colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
