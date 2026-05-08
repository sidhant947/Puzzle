import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'lights_out_provider.dart';
import 'lights_out_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

class LightsOutScreen extends ConsumerWidget {
  const LightsOutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grid = ref.watch(lightsOutNotifierProvider);
    final notifier = ref.read(lightsOutNotifierProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final engine = LightsOutEngine();
    final isSolved = engine.isSolved(grid);

    ref.listen(lightsOutNotifierProvider, (previous, next) {
      if (engine.isSolved(next)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
            title: 'PUZZLE SOLVED!',
            message: 'You turned off all the lights!',
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('LIGHTS OUT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => notifier.reset(),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: DesignSystem.paddingLG,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Turn off all the lights to solve the puzzle.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: DesignSystem.lightOnSurfaceMuted,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignSystem.space2XL),
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.lightSurfaceElevated,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
                  border: Border.all(
                    color: (isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline)
                        .withValues(alpha: 0.5),
                  ),
                ),
                padding: DesignSystem.paddingMD,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: LightsOutEngine.size,
                      crossAxisSpacing: DesignSystem.spaceSM,
                      mainAxisSpacing: DesignSystem.spaceSM,
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
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: isOn
                                ? DesignSystem.gameAmber
                                : (isDark
                                    ? DesignSystem.darkSurfaceElevated
                                    : DesignSystem.lightSurface),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                            boxShadow: isOn
                                ? [
                                    BoxShadow(
                                      color: DesignSystem.gameAmber.withValues(alpha: 0.4),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    )
                                  ]
                                : [],
                            border: Border.all(
                              color: isOn
                                  ? DesignSystem.gameAmber
                                  : (isDark
                                      ? DesignSystem.darkOutline
                                      : DesignSystem.lightOutline),
                              width: 1.5,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
