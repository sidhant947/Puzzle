import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'akari_provider.dart';

class AkariScreen extends ConsumerStatefulWidget {
  const AkariScreen({super.key});

  @override
  ConsumerState<AkariScreen> createState() => _AkariScreenState();
}

class _AkariScreenState extends ConsumerState<AkariScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(akariNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.akariWinTitle,
        message: l10n.akariWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(akariNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(akariNotifierProvider);
    final notifier = ref.read(akariNotifierProvider.notifier);

    ref.listen(akariNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('akari');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.akariTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.akariTitle,
      subtitle: l10n.akariSubtitle,
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
                content: Text(l10n.akariHowToPlay),
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

  Widget _buildCell(AkariState state, AkariNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final val = state.grid[r][c];
    final isBulb = state.bulbs[r][c];
    final isLit = state.lit[r][c];

    if (val >= -1) {
      // Wall
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: colorScheme.onSurface,
          border: Border.all(
            color: colorScheme.onSurface.withValues(alpha: 0.1), 
            width: 0.5,
          ),
        ),
        child: val >= 0
            ? Center(
                child: Text(
                  val.toString(),
                  style: TextStyle(
                    color: colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            : null,
      );
    } else {
      // White cell
      return GestureDetector(
        onTap: () => notifier.toggleBulb(r, c),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isLit 
                ? DesignSystem.accentAmber.withValues(alpha: 0.3) 
                : colorScheme.surface,
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.3), 
              width: 0.5,
            ),
          ),
          child: Center(
            child: isBulb
                ? const Icon(
                    Icons.lightbulb,
                    color: DesignSystem.accentAmber,
                    size: 28,
                  )
                : null,
          ),
        ),
      );
    }
  }
}
