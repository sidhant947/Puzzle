import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'oneline_provider.dart';
import '../../../../../providers/user_providers.dart';

class OnelineScreen extends ConsumerStatefulWidget {
  const OnelineScreen({super.key});

  @override
  ConsumerState<OnelineScreen> createState() => _OnelineScreenState();
}

class _OnelineScreenState extends ConsumerState<OnelineScreen> with TickerProviderStateMixin {
  late AnimationController _gridController;
  late Animation<double> _gridFadeAnimation;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _gridFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gridController, curve: Curves.easeOutCubic),
    );

    _gridController.forward();
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onelineNotifierProvider);
    final notifier = ref.read(onelineNotifierProvider.notifier);

    ref.listen(onelineNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    const textPrimary = Color(0xFF2D3748);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: textPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.arrow_back_rounded, color: textPrimary, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Oneline',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => notifier.reset(),
            icon: const Icon(Icons.refresh_rounded, color: textPrimary),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F9FA),
              Color(0xFFEEF1F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Connect all dots with a single line without crossing!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: textPrimary.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _gridController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _gridFadeAnimation.value,
                    child: Transform.scale(
                      scale: 0.9 + (0.1 * _gridFadeAnimation.value),
                      child: child,
                    ),
                  );
                },
                child: _buildGrid(state, notifier),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(OnelineState state, OnelineNotifier notifier) {
    const primary = Color(0xFF5B7DB1);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.08),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double dotSize = 16.0;
            final double spacing = (constraints.maxWidth - (4 * dotSize)) / 3;

            return GestureDetector(
              onPanUpdate: (details) {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final offset = box.globalToLocal(details.globalPosition);
                _handlePointer(offset, constraints, dotSize, spacing, notifier);
              },
              onPanDown: (details) {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final offset = box.globalToLocal(details.globalPosition);
                _handlePointer(offset, constraints, dotSize, spacing, notifier);
              },
              child: Stack(
                children: [
                  // Draw lines
                  CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: PathPainter(
                      path: state.currentPath,
                      dotSize: dotSize,
                      spacing: spacing,
                      color: primary,
                    ),
                  ),
                  // Draw dots
                  ...state.allDots.map((dot) {
                    final isVisited = state.currentPath.contains(dot);
                    final isLast = state.currentPath.isNotEmpty && state.currentPath.last == dot;
                    
                    return Positioned(
                      left: dot.x * (dotSize + spacing),
                      top: dot.y * (dotSize + spacing),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: dotSize,
                        height: dotSize,
                        decoration: BoxDecoration(
                          color: isLast ? primary : (isVisited ? primary.withValues(alpha: 0.4) : const Color(0xFFEEF1F5)),
                          shape: BoxShape.circle,
                          boxShadow: isLast ? [
                            BoxShadow(color: primary.withValues(alpha: 0.3), blurRadius: 10, spreadRadius: 2)
                          ] : null,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _handlePointer(Offset offset, BoxConstraints constraints, double dotSize, double spacing, OnelineNotifier notifier) {
    // Determine which dot is hit
    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 4; x++) {
        final dotX = x * (dotSize + spacing);
        final dotY = y * (dotSize + spacing);
        
        final rect = Rect.fromLTWH(dotX - 10, dotY - 10, dotSize + 20, dotSize + 20);
        if (rect.contains(offset)) {
          final dot = Point(x, y);
          notifier.addDot(dot);
          return;
        }
      }
    }
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final solvedToday = await ref.read(gameStreakNotifierProvider.notifier).completeGame('oneline', xpAmount: 25);

    if (!context.mounted) return;

    HapticFeedback.heavyImpact();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF81B29A).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: Color(0xFF81B29A), size: 48),
              ),
              const SizedBox(height: 24),
              const Text(
                'Brilliant!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You completed the path!',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF2D3748).withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 24),
              if (solvedToday) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF81B29A).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+25 XP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF81B29A),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  final List<Point<int>> path;
  final double dotSize;
  final double spacing;
  final Color color;

  PathPainter({
    required this.path,
    required this.dotSize,
    required this.spacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (path.length < 2) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final drawPath = Path();
    
    for (int i = 0; i < path.length; i++) {
      final x = path[i].x * (dotSize + spacing) + dotSize / 2;
      final y = path[i].y * (dotSize + spacing) + dotSize / 2;
      
      if (i == 0) {
        drawPath.moveTo(x, y);
      } else {
        drawPath.lineTo(x, y);
      }
    }

    canvas.drawPath(drawPath, paint);
  }

  @override
  bool shouldRepaint(covariant PathPainter oldDelegate) {
    return oldDelegate.path != path;
  }
}
