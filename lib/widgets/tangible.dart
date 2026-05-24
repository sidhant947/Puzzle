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

    Widget content = CustomPaint(
      painter: _TangiblePainter(
        color: resolvedColor,
        shadowColor: resolvedShadowColor,
        depth: depth,
        radius: radius,
        borderColor: colorScheme.outline,
      ),
      child: Padding(
        padding: (padding ?? EdgeInsets.zero).add(EdgeInsets.only(bottom: depth)),
        child: child,
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }

    return content;
  }
}

class _TangiblePainter extends CustomPainter {
  final Color color;
  final Color shadowColor;
  final double depth;
  final double radius;
  final Color borderColor;

  _TangiblePainter({
    required this.color,
    required this.shadowColor,
    required this.depth,
    required this.radius,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect outerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    // 1. Draw Shadow/Bottom Part
    final Paint shadowPaint = Paint()..color = shadowColor;
    canvas.drawRRect(outerRRect, shadowPaint);

    // 2. Draw Top Surface
    final Paint surfacePaint = Paint()..color = color;
    final RRect surfaceRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - depth),
      Radius.circular(radius),
    );
    canvas.drawRRect(surfaceRRect, surfacePaint);

    // 3. Draw Border (on top surface only)
    final Paint borderPaint = Paint()
      ..color = borderColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawRRect(surfaceRRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _TangiblePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.depth != depth ||
        oldDelegate.radius != radius;
  }
}


/// A tactile button widget.
class TangibleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? color;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final double depth;
  final double radius;

  const TangibleButton({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
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

    final isEnabled = widget.onTap != null || widget.onLongPress != null;

    return GestureDetector(
      onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: isEnabled ? (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      } : null,
      onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
      onLongPress: widget.onLongPress != null ? () {
        setState(() => _isPressed = false);
        widget.onLongPress?.call();
      } : null,
      child: RepaintBoundary(
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
              horizontal: DesignSystem.spaceMD,
              vertical: DesignSystem.spaceSM,
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                color: resolvedColor == colorScheme.surface ? colorScheme.onSurface : Colors.white,
                fontSize: DesignSystem.fontSizeLG, // Reduced from 18 to 14.0 for dynamic premium look
                fontWeight: FontWeight.w900,
                letterSpacing: 1.2,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );

  }
}

