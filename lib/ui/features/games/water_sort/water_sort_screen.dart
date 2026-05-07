import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'water_sort_provider.dart';
import 'water_sort_engine.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';

class WaterSortScreen extends ConsumerWidget {
  const WaterSortScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(waterSortNotifierProvider);
    final notifier = ref.read(waterSortNotifierProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('WATER SORT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => notifier.reset(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: DesignSystem.paddingLG,
            child: Text(
              'Sort the colors so each tube contains only one color.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: DesignSystem.lightOnSurfaceMuted,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: DesignSystem.paddingMD,
                child: Wrap(
                  spacing: DesignSystem.spaceLG,
                  runSpacing: DesignSystem.space2XL,
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
                        isDark: isDark,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          if (state.isSolved) ...[
            Padding(
              padding: DesignSystem.paddingXL,
              child: Column(
                children: [
                  Text(
                    'PUZZLE SOLVED!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: DesignSystem.gameGreen,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.2,
                        ),
                  ),
                  const SizedBox(height: DesignSystem.spaceLG),
                  ElevatedButton(
                    onPressed: () => notifier.reset(),
                    child: const Text('NEW GAME'),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TubeWidget extends StatelessWidget {
  final List<Color> colors;
  final bool isSelected;
  final bool isDark;

  const _TubeWidget({
    required this.colors,
    required this.isSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: isSelected ? Matrix4.translationValues(0.0, -20.0, 0.0) : Matrix4.identity(),
      width: 50,
      height: 150,
      decoration: BoxDecoration(
        color: isDark ? DesignSystem.darkSurfaceElevated : Colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(DesignSystem.radius2XL),
          top: Radius.circular(DesignSystem.radiusSM),
        ),
        border: Border.all(
          color: isSelected
              ? DesignSystem.gameBlue
              : (isDark ? DesignSystem.darkOutline : DesignSystem.lightOutline),
          width: isSelected ? 3 : 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: DesignSystem.gameBlue.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ]
            : [],
      ),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          for (int i = 0; i < WaterSortEngine.tubeCapacity; i++)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: i < colors.length ? colors[i] : Colors.transparent,
                  borderRadius: i == 0
                      ? const BorderRadius.vertical(
                          bottom: Radius.circular(DesignSystem.radiusXL),
                        )
                      : BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
