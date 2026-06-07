import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import 'lighthouses_provider.dart';

class LighthousesScreen extends ConsumerStatefulWidget {
  const LighthousesScreen({super.key});

  @override
  ConsumerState<LighthousesScreen> createState() => _LighthousesScreenState();
}

class _LighthousesScreenState extends ConsumerState<LighthousesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(lighthousesNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.lighthousesWinTitle,
        message: l10n.lighthousesWinMessage,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(lighthousesNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(lighthousesNotifierProvider);
    final notifier = ref.read(lighthousesNotifierProvider.notifier);

    ref.listen(lighthousesNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('lighthouses');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.lighthousesTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return GameScaffold(
      title: l10n.lighthousesTitle,
      subtitle: l10n.lighthousesSubtitle,
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
                content: Text(l10n.lighthousesHowToPlay),
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
                final size = state.ships.length;
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

  Widget _buildCell(LighthousesState state, LighthousesNotifier notifier, int r, int c, double size) {
    final colorScheme = Theme.of(context).colorScheme;
    final isShip = state.ships[r][c];
    final clue = state.clues[r][c];

    return GestureDetector(
      onTap: () => notifier.toggleShip(r, c),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: clue != null ? colorScheme.onSurface : colorScheme.surface,
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.1), 
            width: 0.5,
          ),
        ),
        child: Center(
          child: clue != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.house_rounded, size: size * 0.4, color: colorScheme.surface),
                    Text(
                      clue.toString(),
                      style: TextStyle(
                        color: colorScheme.surface,
                        fontWeight: FontWeight.bold,
                        fontSize: size * 0.3,
                      ),
                    ),
                  ],
                )
              : (isShip 
                  ? Icon(Icons.directions_boat_rounded, size: size * 0.6, color: colorScheme.primary)
                  : null),
        ),
      ),
    );
  }
}
