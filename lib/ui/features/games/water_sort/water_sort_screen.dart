import 'package:puzzle/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
                title: l10n.waterSortTitle.toUpperCase(),
                message: 'You sorted all the colors perfectly!',
              ),
            );
          }
        });
      }
    });

    return GameScaffold(
      title: 'WATER SORT',
      subtitle: l10n.waterSortSubtitle,
      actions: [
        TangibleButton(
          color: Theme.of(context).colorScheme.surface,
          shadowColor: Theme.of(context).colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.reset();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.refresh_rounded,
            color: Theme.of(context).colorScheme.onSurface,
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
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: DesignSystem.spaceSM,
                    mainAxisSpacing: DesignSystem.spaceXL,
                    childAspectRatio: 0.45, 
                  ),
                  itemCount: state.tubes.length,
                  itemBuilder: (context, index) {
                    final isSelected = state.selectedTubeIndex == index;
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedbackUtil.lightImpact();
                          notifier.selectTube(index);
                        },
                        child: _TubeWidget(
                          colors: state.tubes[index],
                          isSelected: isSelected,
                          width: tubeWidth.clamp(35.0, 50.0),
                          height: tubeHeight.clamp(100.0, 150.0),
                        ),
                      ),
                    );
                  },
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
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final tubeRadius = width / 2;
    final outerRadius = BorderRadius.vertical(
      bottom: Radius.circular(tubeRadius),
      top: const Radius.circular(6),
    );

    final depth = isSelected ? 8.0 : 4.0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      transform: isSelected ? Matrix4.translationValues(0.0, -20.0, 0.0) : Matrix4.identity(),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Shadow / Depth Layer
          Positioned(
            top: depth,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: colorScheme.outline,
                borderRadius: outerRadius,
              ),
            ),
          ),
          // Main Tube Body
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: outerRadius,
              border: Border.all(
                color: colorScheme.outline.withValues(alpha: 0.5),
                width: 2.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(tubeRadius - 2),
                top: const Radius.circular(4),
              ),
              child: Stack(
                children: [
                  // Water segments
                  Column(
                    verticalDirection: VerticalDirection.up,
                    children: [
                      for (int i = 0; i < WaterSortEngine.tubeCapacity; i++)
                        Expanded(
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: i < colors.length ? colors[i] : Colors.transparent,
                              border: i < colors.length 
                                ? Border(
                                    top: BorderSide(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      width: 1.5,
                                    ),
                                    bottom: BorderSide(
                                      color: Colors.black.withValues(alpha: 0.1),
                                      width: 1.5,
                                    ),
                                  )
                                : null,
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Glass Gloss/Shine
                  Positioned(
                    left: width * 0.15,
                    top: 10,
                    bottom: 10,
                    width: width * 0.12,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withValues(alpha: 0.3),
                            Colors.white.withValues(alpha: 0.05),
                            Colors.white.withValues(alpha: 0.15),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tube Rim (Top)
          Positioned(
            top: -2,
            child: Container(
              width: width + 8,
              height: 8,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: colorScheme.outline.withValues(alpha: 0.5), width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

