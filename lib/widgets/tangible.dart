import 'package:flutter/material.dart';
import '../utils/design_system.dart';

/// A base container that implements the "Universal Tangible" (Phygital) aesthetic.
/// It uses "Bottom-Sinking" geometry to look like a physical tile.
class TangibleContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final double depth;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const TangibleContainer({
    super.key,
    required this.child,
    this.color,
    this.shadowColor,
    this.depth = 6.0,
    this.radius = DesignSystem.radiusLG,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final resolvedColor = color ?? colorScheme.surface;
    final resolvedShadowColor = shadowColor ?? colorScheme.outline;

    Widget content = Container(
      decoration: BoxDecoration(
        color: resolvedColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.5),
          width: 1.5,
        ),
      ),
      padding: padding,
      child: child,
    );

    Widget tangible = Container(
      decoration: BoxDecoration(
        color: resolvedShadowColor,
        borderRadius: BorderRadius.circular(radius + 1),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: depth),
        child: content,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: tangible,
      );
    }

    return tangible;
  }
}

/// A tactile button widget.
class TangibleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final double depth;
  final double radius;

  const TangibleButton({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.shadowColor,
    this.padding,
    this.depth = 6.0,
    this.radius = DesignSystem.radiusLG,
  });

  @override
  State<TangibleButton> createState() => _TangibleButtonState();
}

class _TangibleButtonState extends State<TangibleButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedColor = widget.color ?? colorScheme.primary;
    final resolvedShadowColor = widget.shadowColor ?? (widget.color == null ? colorScheme.primary.withValues(alpha: 0.8) : resolvedColor.withValues(alpha: 0.8));

    final isEnabled = widget.onTap != null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      } : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isPressed ? (widget.depth * 0.6) : 0.0, 0),
        child: TangibleContainer(
          depth: _isPressed ? 0.0 : widget.depth,
          color: resolvedColor,
          shadowColor: resolvedShadowColor,
          radius: widget.radius,
          padding: widget.padding ?? const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: resolvedColor == colorScheme.surface ? colorScheme.onSurface : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.0,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

