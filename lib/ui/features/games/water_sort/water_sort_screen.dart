import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'water_sort_provider.dart';
import 'water_sort_engine.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../providers/user_providers.dart';

class WaterSortScreen extends ConsumerWidget {
  const WaterSortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(waterSortNotifierProvider);
    final notifier = ref.read(waterSortNotifierProvider.notifier);

    ref.listen(waterSortNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        ref.read(gameStreakNotifierProvider.notifier).completeGame('water_sort').then((_) {
          if (context.mounted) {
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
                title: 'WELL DONE!',
                message: 'You sorted all the colors perfectly!',
              ),
            );
          }
        });
      }
    });

    return GameScaffold(
      title: 'WATER SORT',
      subtitle: 'Sort the colors so each tube contains only one color.',
      actions: [
        TangibleButton(
          color: DesignSystem.surface,
          shadowColor: DesignSystem.outlineVariant,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.refresh_rounded,
            color: DesignSystem.ink,
            size: 20,
          ),
        ),
      ],
      body: LayoutBuilder(
        builder: (context, constraints) {
          final tubeWidth = constraints.maxWidth * 0.12;
          final tubeHeight = constraints.maxHeight * 0.25;

          return Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
                child: Wrap(
                  spacing: DesignSystem.spaceMD,
                  runSpacing: DesignSystem.spaceXL,
                  alignment: WrapAlignment.center,
                  children: List.generate(state.tubes.length, (index) {
                    final isSelected = state.selectedTubeIndex == index;
                    return GestureDetector(
                      onTap: () {
                        HapticFeedbackUtil.lightImpact();
                        notifier.selectTube(index);
                      },
                      child: _TubeWidget(
                        colors: state.tubes[index],
                        isSelected: isSelected,
                        width: tubeWidth.clamp(30.0, 50.0),
                        height: tubeHeight.clamp(100.0, 160.0),
                      ),
                    );
                  }),
                ),
              ),
              const Spacer(),
              const SizedBox(height: DesignSystem.spaceMD),
            ],
          );
        },
      ),
    );
  }
}

class _TubeWidget extends StatelessWidget {
  final List<Color> colors;
  final bool isSelected;
  final double width;
  final double height;

  const _TubeWidget({
    required this.colors,
    required this.isSelected,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: isSelected ? Matrix4.translationValues(0.0, -12.0, 0.0) : Matrix4.identity(),
      child: TangibleContainer(
        color: DesignSystem.surface,
        radius: DesignSystem.radiusMD,
        depth: isSelected ? 4.0 : 2.0,
        padding: const EdgeInsets.all(3),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(DesignSystem.radiusMD - 4),
          ),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              for (int i = 0; i < WaterSortEngine.tubeCapacity; i++)
                Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    decoration: BoxDecoration(
                      color: i < colors.length ? colors[i] : Colors.transparent,
                      borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
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

