import 'package:flutter/material.dart';
import 'package:puzzle/utils/design_system.dart';

class CategoryStyle {
  final IconData icon;
  final Color color;

  const CategoryStyle({required this.icon, required this.color});
}

const Map<String, CategoryStyle> kCategoryStyles = {
  'ALL': CategoryStyle(icon: Icons.apps_rounded, color: DesignSystem.primary),
  'ATTENTION': CategoryStyle(icon: Icons.bolt_rounded, color: DesignSystem.gameOrange),
  'LOGIC': CategoryStyle(icon: Icons.bubble_chart_rounded, color: DesignSystem.gameRose),
  'MATH': CategoryStyle(icon: Icons.tune_rounded, color: DesignSystem.gameAmber),
  'WORD': CategoryStyle(icon: Icons.abc_rounded, color: DesignSystem.gamePurple),
  'MEMORY': CategoryStyle(icon: Icons.filter_none_rounded, color: DesignSystem.gameBlue),
  'SPATIAL': CategoryStyle(icon: Icons.widgets_rounded, color: DesignSystem.gameGreen),
};

CategoryStyle getCategoryStyle(String category) {
  return kCategoryStyles[category.toUpperCase()] ??
      const CategoryStyle(icon: Icons.extension_rounded, color: DesignSystem.primary);
}

class CategoryButton extends StatelessWidget {
  final String label;
  final String value;
  final bool isSelected;
  final CategoryStyle categoryStyle;
  final int solved;
  final int total;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.categoryStyle,
    required this.solved,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (solved / total).clamp(0.0, 1.0);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 68,
                height: 68,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: categoryStyle.color.withValues(alpha: 0.1),
                  color: categoryStyle.color,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isSelected
                      ? categoryStyle.color
                      : theme.colorScheme.surface,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: categoryStyle.color
                        .withValues(alpha: isSelected ? 0.5 : 0.2),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    categoryStyle.icon,
                    size: 24,
                    color: isSelected ? Colors.white : categoryStyle.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.w700,
              color: isSelected
                  ? categoryStyle.color
                  : (theme.brightness == Brightness.dark
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF475569)),
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
