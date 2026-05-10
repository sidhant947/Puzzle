import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lights_out_provider.dart';
import 'lights_out_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';

class LightsOutScreen extends ConsumerWidget {
  const LightsOutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grid = ref.watch(lightsOutNotifierProvider);
    final notifier = ref.read(lightsOutNotifierProvider.notifier);
    final engine = LightsOutEngine();
    final isSolved = engine.isSolved(grid);

    ref.listen(lightsOutNotifierProvider, (previous, next) {
      if (engine.isSolved(next)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: 'PUZZLE SOLVED!',
            message: 'You successfully turned off all the lights!',
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    return GameScaffold(
      title: 'LIGHTS OUT',
      subtitle: 'Tapping a tile toggles it and its adjacent neighbors. Turn off all lights to solve.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(Icons.refresh_rounded, size: 20, color: DesignSystem.ink),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.5),
                  child: TangibleContainer(
                    color: DesignSystem.ink,
                    shadowColor: DesignSystem.inkSlate,
                    depth: 4.0,
                    radius: DesignSystem.radiusMD,
                    padding: const EdgeInsets.all(DesignSystem.spaceSM),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: LightsOutEngine.size,
                          crossAxisSpacing: DesignSystem.spaceXS,
                          mainAxisSpacing: DesignSystem.spaceXS,
                        ),
                        itemCount: LightsOutEngine.size * LightsOutEngine.size,
                        itemBuilder: (context, index) {
                          final r = index ~/ LightsOutEngine.size;
                          final c = index % LightsOutEngine.size;
                          final isOn = grid[r][c];

                          return GestureDetector(
                            onTap: isSolved
                                ? null
                                : () {
                                    HapticFeedbackUtil.lightImpact();
                                    notifier.toggle(r, c);
                                  },
                            child: TangibleContainer(
                              depth: isOn ? 0.0 : 2.0,
                              color: isOn ? DesignSystem.accentAmber : DesignSystem.surface,
                              shadowColor: isOn ? const Color(0xFFB45309) : DesignSystem.outlineVariant,
                              radius: DesignSystem.radiusSM,
                              child: isOn 
                                ? const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        child: Icon(Icons.lightbulb_rounded, color: Colors.white),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
