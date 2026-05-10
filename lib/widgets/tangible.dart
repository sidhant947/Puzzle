import 'package:flutter/material.dart';
import '../utils/design_system.dart';

/// A base container that implements the "Universal Tangible" (Phygital) aesthetic.
/// It uses "Bottom-Sinking" geometry to look like a physical tile.
class TangibleContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color shadowColor;
  final double depth;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const TangibleContainer({
    super.key,
    required this.child,
    this.color = DesignSystem.surface,
    this.shadowColor = DesignSystem.outlineVariant,
    this.depth = 6.0,
    this.radius = DesignSystem.radiusLG,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: DesignSystem.outline,
          width: 1.5,
        ),
      ),
      padding: padding,
      child: child,
    );

    Widget tangible = Container(
      decoration: BoxDecoration(
        color: shadowColor,
        borderRadius: BorderRadius.circular(radius + 1), // Slightly larger to match border
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: depth),
        child: content,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        // In a full implementation, we'd add tap down/up animation here
        // to reduce the depth and move the content down, simulating a physical press.
        child: tangible,
      );
    }

    return tangible;
  }
}

/// A tactile button widget.
class TangibleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color color;
  final Color shadowColor;
  final EdgeInsetsGeometry? padding;

  const TangibleButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color = DesignSystem.primary,
    this.shadowColor = DesignSystem.primaryShadow,
    this.padding,
  });

  @override
  State<TangibleButton> createState() => _TangibleButtonState();
}

class _TangibleButtonState extends State<TangibleButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isPressed ? 4.0 : 0.0, 0),
        child: TangibleContainer(
          depth: _isPressed ? 0.0 : 6.0,
          color: widget.color,
          shadowColor: widget.shadowColor,
          padding: widget.padding ?? const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
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
