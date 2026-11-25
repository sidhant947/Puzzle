import 'dart:math' as math;
import 'package:material_ui/material_ui.dart';

class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({super.key});

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_ConfettiParticle> _particles;

  static const List<Color> _colors = [
    Color(0xFF6366F1),
    Color(0xFFEC4899),
    Color(0xFF10B981),
    Color(0xFFF59E0B),
    Color(0xFF3B82F6),
    Color(0xFFA855F7),
    Color(0xFFF97316),
    Color(0xFF14B8A6),
    Color(0xFFEF4444),
    Color(0xFFFFD700),
  ];

  @override
  void initState() {
    super.initState();
    final random = math.Random();
    _particles = List.generate(100, (index) {
      final isLeft = index.isEven;
      final speed = 650 + random.nextDouble() * 450;
      final angleDeg = 45 + random.nextDouble() * 30;
      final angleRad = angleDeg * math.pi / 180.0;

      return _ConfettiParticle(
        isLeft: isLeft,
        delay: random.nextDouble(),
        vx: isLeft
            ? math.cos(angleRad) * speed
            : -math.cos(angleRad) * speed,
        vy: -math.sin(angleRad) * speed,
        width: 8 + random.nextDouble() * 6,
        height: 5 + random.nextDouble() * 5,
        color: _colors[random.nextInt(_colors.length)],
        rotationSpeed: 4 + random.nextDouble() * 8,
        swaySpeed: 3 + random.nextDouble() * 4,
        swayDistance: 12 + random.nextDouble() * 24,
        isCircle: random.nextDouble() < 0.25,
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: _ConfettiPainter(
            particles: _particles,
            progress: _controller.value,
          ),
        );
      },
    );
  }
}

class _ConfettiParticle {
  final bool isLeft;
  final double delay;
  final double vx;
  final double vy;
  final double width;
  final double height;
  final Color color;
  final double rotationSpeed;
  final double swaySpeed;
  final double swayDistance;
  final bool isCircle;

  _ConfettiParticle({
    required this.isLeft,
    required this.delay,
    required this.vx,
    required this.vy,
    required this.width,
    required this.height,
    required this.color,
    required this.rotationSpeed,
    required this.swaySpeed,
    required this.swayDistance,
    required this.isCircle,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({
    required this.particles,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    const durationSec = 2.8;
    const gravity = 650.0;

    for (final p in particles) {
      final tNorm = ((progress - p.delay) % 1.0 + 1.0) % 1.0;
      final t = tNorm * durationSec;

      final startX = p.isLeft ? 0.0 : size.width;
      final startY = size.height * 0.85;

      final x = startX + p.vx * t + math.sin(t * p.swaySpeed) * p.swayDistance;
      final y = startY + p.vy * t + 0.5 * gravity * t * t;

      if (y > size.height + 20) continue;

      final rotation = t * p.rotationSpeed;
      final flipScale = math.cos(rotation);
      final fade = tNorm > 0.8 ? (1.0 - tNorm) / 0.2 : 1.0;

      paint.color = p.color.withValues(alpha: fade.clamp(0.0, 1.0));

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(rotation);
      canvas.scale(1.0, flipScale);

      if (p.isCircle) {
        canvas.drawCircle(Offset.zero, p.width / 2, paint);
      } else {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset.zero,
              width: p.width,
              height: p.height,
            ),
            const Radius.circular(2),
          ),
          paint,
        );
      }
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
