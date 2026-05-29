import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'hue_sort_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../l10n/app_localizations.dart';

class HueSortScreen extends ConsumerWidget {
  const HueSortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(hueSortNotifierProvider);

    ref.listen(hueSortNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref, l10n);
      }
    });

    return GameScaffold(
      title: l10n.hueSortTitle,
      subtitle: l10n.hueSortSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(hueSortNotifierProvider.notifier).newGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              Center(
                child: _buildGrid(context, ref, state, constraints.maxHeight * 0.55),
              ),
              const SizedBox(height: DesignSystem.spaceLG),
              _buildStats(context, state),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStats(BuildContext context, HueSortState state) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: TangibleContainer(
        radius: DesignSystem.radiusMD,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSystem.spaceMD,
          vertical: DesignSystem.spaceSM,
        ),
        color: colorScheme.surface,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_on_rounded,
              size: 18,
              color: colorScheme.primary,
            ),
            const SizedBox(width: DesignSystem.spaceSM),
            Text(
              l10n.hueSortWrongTiles(state.wrongTilesCount),
              style: TextStyle(
                fontSize: DesignSystem.fontSizeSM,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, HueSortState state, double maxHeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.level.size,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: state.level.size * state.level.size,
            itemBuilder: (context, index) {
              final isFixed = state.level.fixedIndices.contains(index);
              final isSelected = state.selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  HapticFeedbackUtil.lightImpact();
                  ref.read(hueSortNotifierProvider.notifier).selectTile(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: state.currentColors[index],
                    borderRadius: BorderRadius.circular(isSelected ? DesignSystem.radiusMD : DesignSystem.radiusXS),
                    border: isSelected 
                        ? Border.all(color: Colors.white, width: 4) 
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: isFixed
                    ? Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1.5),
                          ),
                        ),
                      )
                    : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final l10n = AppLocalizations.of(context)!;
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('hue_sort');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.hueSortWinTitle,
        message: l10n.hueSortWinMessage,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(hueSortNotifierProvider.notifier).newGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
