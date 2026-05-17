import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import 'perspective_taking_provider.dart';
import 'perspective_taking_engine.dart';

class PerspectiveTakingScreen extends ConsumerStatefulWidget {
  const PerspectiveTakingScreen({super.key});

  @override
  ConsumerState<PerspectiveTakingScreen> createState() => _PerspectiveTakingScreenState();
}

class _PerspectiveTakingScreenState extends ConsumerState<PerspectiveTakingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(perspectiveTakingNotifierProvider.notifier).initGame();
    });
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.perspectiveTakingTitle.toUpperCase(),
        message: l10n.perspectiveTakingCongrats,
        isVictory: true,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(perspectiveTakingNotifierProvider.notifier).initGame();
        },
      ),
    );
  }

  String _getDirectionName(AppLocalizations l10n, ViewDirection dir) {
    switch (dir) {
      case ViewDirection.north:
        return l10n.north.toUpperCase();
      case ViewDirection.south:
        return l10n.south.toUpperCase();
      case ViewDirection.east:
        return l10n.east.toUpperCase();
      case ViewDirection.west:
        return l10n.west.toUpperCase();
      case ViewDirection.top:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(perspectiveTakingNotifierProvider);
    final notifier = ref.read(perspectiveTakingNotifierProvider.notifier);

    ref.listen(perspectiveTakingNotifierProvider, (previous, next) {
      if (next.isVictory && !(previous?.isVictory ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('perspective_taking');
        _showCompletionDialog();
      }
    });

    if (state.isLoading) {
      return GameScaffold(
        title: l10n.perspectiveTakingTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final targetDirName = _getDirectionName(l10n, state.targetDirection);

    return GameScaffold(
      title: l10n.perspectiveTakingTitle,
      subtitle: l10n.perspectiveTakingSubtitle(targetDirName),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: Column(
          children: [
            const SizedBox(height: DesignSystem.spaceMD),
            Text(
              l10n.perspectiveTakingTopDownView,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: _buildTopDownView(state.topView, colorScheme, l10n),
            ),
            const Spacer(),
            Text(
              l10n.perspectiveTakingChoosePerspective,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 12,
                letterSpacing: 1.2,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: DesignSystem.spaceMD),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: DesignSystem.spaceMD,
                mainAxisSpacing: DesignSystem.spaceMD,
                childAspectRatio: 1.1,
              ),
              itemCount: state.options.length,
              itemBuilder: (context, index) {
                return _buildOption(state, notifier, index, colorScheme);
              },
            ),
            const SizedBox(height: DesignSystem.space2XL),
          ],
        ),
      ),
    );
  }

  Widget _buildTopDownView(List<List<Color?>> view, ColorScheme colorScheme, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceSM),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildGridView(view, 44, colorScheme),
          ),
          Positioned(top: 4, child: Text(l10n.north.toUpperCase(), style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: colorScheme.onSurface.withValues(alpha: 0.7)))),
          Positioned(bottom: 4, child: Text(l10n.south.toUpperCase(), style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: colorScheme.onSurface.withValues(alpha: 0.7)))),
          Positioned(left: 4, child: RotatedBox(quarterTurns: 3, child: Text(l10n.west.toUpperCase(), style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: colorScheme.onSurface.withValues(alpha: 0.7))))),
          Positioned(right: 4, child: RotatedBox(quarterTurns: 1, child: Text(l10n.east.toUpperCase(), style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900, color: colorScheme.onSurface.withValues(alpha: 0.7))))),
        ],
      ),
    );
  }

  Widget _buildGridView(List<List<Color?>> view, double cellSize, ColorScheme colorScheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(view.length, (r) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(view[r].length, (c) {
            final color = view[r][c];
            return Container(
              width: cellSize,
              height: cellSize,
              margin: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                color: color ?? colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: color != null ? colorScheme.onSurface.withValues(alpha: 0.1) : Colors.transparent,
                  width: 1,
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  Widget _buildOption(PerspectiveTakingState state, PerspectiveTakingNotifier notifier, int index, ColorScheme colorScheme) {
    final isSelected = state.selectedOptionIndex == index;
    final isCorrect = state.correctOptionIndex == index;
    final showResult = state.selectedOptionIndex != null;

    Color borderColor = colorScheme.outline.withValues(alpha: 0.5);
    if (showResult) {
      if (isCorrect) {
        borderColor = DesignSystem.success;
      } else if (isSelected) {
        borderColor = DesignSystem.error;
      }
    } else if (isSelected) {
      borderColor = DesignSystem.primary;
    }

    return GestureDetector(
      onTap: () => notifier.selectOption(index),
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceXS),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSurface.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: _buildGridView(state.options[index], 28, colorScheme),
            ),
            if (showResult && isCorrect)
              const Positioned(
                top: 4, right: 4,
                child: Icon(Icons.check_circle, color: DesignSystem.success, size: 20),
              ),
            if (showResult && isSelected && !isCorrect)
              const Positioned(
                top: 4, right: 4,
                child: Icon(Icons.cancel, color: DesignSystem.error, size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
