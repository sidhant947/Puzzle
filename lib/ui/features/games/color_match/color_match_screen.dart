import "package:puzzle/l10n/app_localizations.dart";
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'color_match_provider.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class ColorMatchScreen extends ConsumerWidget {
  const ColorMatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(colorMatchNotifierProvider);

    ref.listen(colorMatchNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.victory();
        _showGameOverDialog(context, ref, next);
      }
    });

    return GameScaffold(
      title: l10n.colorMatchTitle.toUpperCase(),
      subtitle: l10n.colorMatchSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            ref.read(colorMatchNotifierProvider.notifier).reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: Theme.of(context).colorScheme.onSurface),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(DesignSystem.spaceLG, DesignSystem.spaceSM, DesignSystem.spaceLG, DesignSystem.spaceSM),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.4),
                    child: Row(
                      children: [
                        _buildColorBox(context, l10n.colorMatchTarget, state.targetColor),
                        SizedBox(width: DesignSystem.spaceMD),
                        _buildColorBox(context, l10n.colorMatchYours, state.currentColor),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceMD),
                child: TangibleContainer(
                  padding: const EdgeInsets.all(DesignSystem.spaceMD),
                  color: Theme.of(context).colorScheme.surface,
                  depth: 4.0,
                  child: Column(
                    children: [
                      _buildSlider(context, l10n.red.toUpperCase(), (state.currentColor.r * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor(v, (state.currentColor.g * 255.0).round().toDouble(), (state.currentColor.b * 255.0).round().toDouble()), DesignSystem.error),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSlider(context, l10n.green.toUpperCase(), (state.currentColor.g * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor((state.currentColor.r * 255.0).round().toDouble(), v, (state.currentColor.b * 255.0).round().toDouble()), DesignSystem.accentEmerald),
                      const SizedBox(height: DesignSystem.spaceSM),
                      _buildSlider(context, l10n.blue.toUpperCase(), (state.currentColor.b * 255.0).round().toDouble(), (v) => ref.read(colorMatchNotifierProvider.notifier).updateColor((state.currentColor.r * 255.0).round().toDouble(), (state.currentColor.g * 255.0).round().toDouble(), v), DesignSystem.primary),
                      const SizedBox(height: DesignSystem.spaceLG),
                      TangibleButton(
                        onTap: () {
                          HapticFeedbackUtil.selectionClick();
                          ref.read(colorMatchNotifierProvider.notifier).submit();
                        },
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(child: Text(l10n.colorMatchCheck, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13))),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceMD),
            ],
          );
        },
      ),
    );
  }

  Widget _buildColorBox(BuildContext context, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label, 
            style: TextStyle(
              fontWeight: FontWeight.w900, 
              letterSpacing: 2,
              fontSize: 10,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: DesignSystem.spaceXS),
          Expanded(
            child: TangibleContainer(
              color: color,
              shadowColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
              depth: 4.0,
              child: const SizedBox.expand(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(BuildContext context, String label, double value, ValueChanged<double> onChanged, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: color, letterSpacing: 1.0)),
            Text(value.toInt().toString(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: color,
            inactiveTrackColor: color.withValues(alpha: 0.1),
            thumbColor: Theme.of(context).colorScheme.surface,
            overlayColor: color.withValues(alpha: 0.2),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8, elevation: 2),
            padding: EdgeInsets.zero,
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  void _showGameOverDialog(BuildContext context, WidgetRef ref, ColorMatchState state) {
    final l10n = AppLocalizations.of(context)!;
    ref.read(gameStreakNotifierProvider.notifier).completeGame('color_match', xpAmount: state.score.toInt());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: 'MATCH RESULT',
        message: 'Your accuracy: ${state.score.toStringAsFixed(1)}%',
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(colorMatchNotifierProvider.notifier).reset();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
