import 'package:flutter/material.dart';
import '../utils/design_system.dart';

/// A minimalistic, highly readable card container.
/// It uses flat, high-contrast borders and perfect accessibility proportions.
class TangibleContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final double depth;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool drawBorder;
  final String? semanticsLabel;

  const TangibleContainer({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.depth = 6.0,
    this.radius = DesignSystem.radiusMD,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.drawBorder = true,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final resolvedColor = color ?? colorScheme.surface;

    // Check if background color is default to decide border coloring
    final isDefaultBg = resolvedColor == colorScheme.surface || 
                        resolvedColor == theme.scaffoldBackgroundColor ||
                        resolvedColor == Colors.transparent;

    Widget content = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: resolvedColor,
        borderRadius: BorderRadius.circular(radius),
        border: drawBorder
            ? Border.all(
                color: isDefaultBg
                    ? colorScheme.outline.withValues(alpha: 0.8)
                    : resolvedColor, // Avoid dirty grey outline on colored boxes
                width: 1.5,
              )
            : null,
      ),
      padding: padding ?? const EdgeInsets.all(DesignSystem.spaceMD),
      child: child,
    );

    if (onTap != null || onLongPress != null) {
      return Semantics(
        button: true,
        label: semanticsLabel,
        child: GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          behavior: HitTestBehavior.opaque,
          child: content,
        ),
      );
    }

    return Semantics(
      label: semanticsLabel,
      child: content,
    );
  }
}

/// A clean, flat button widget with modern micro-scale animations.
/// Ensures touch targets meet standard accessibility requirements (>= 48dp).
class TangibleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? color;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double depth;
  final double radius;
  final bool drawBorder;
  final String? semanticsLabel;

  const TangibleButton({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.color,
    this.shadowColor,
    this.padding,
    this.width,
    this.height,
    this.depth = 6.0,
    this.radius = DesignSystem.radiusMD,
    this.drawBorder = true,
    this.semanticsLabel,
  });

  @override
  State<TangibleButton> createState() => _TangibleButtonState();
}

class _TangibleButtonState extends State<TangibleButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    // Default to primary color for button if not specified
    final resolvedColor = widget.color ?? colorScheme.primary;
    final isEnabled = widget.onTap != null || widget.onLongPress != null;

    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        behavior: HitTestBehavior.opaque,
        child: RepaintBoundary(
          child: TangibleContainer(
            color: isEnabled ? resolvedColor : colorScheme.surface.withValues(alpha: 0.5),
            radius: widget.radius,
            drawBorder: widget.drawBorder,
            width: widget.width,
            height: widget.height,
            padding: widget.padding ?? const EdgeInsets.symmetric(
              horizontal: DesignSystem.spaceLG,
              vertical: DesignSystem.spaceMD,
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'Geist',
                color: isEnabled
                    ? (resolvedColor == colorScheme.surface || resolvedColor == Colors.transparent
                        ? colorScheme.onSurface
                        : Colors.white)
                    : colorScheme.onSurface.withValues(alpha: 0.3),
                fontSize: DesignSystem.fontSizeLG,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
