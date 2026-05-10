import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_providers.dart';
import '../utils/design_system.dart';
import '../utils/haptic_feedback.dart';
import 'tangible.dart';

class GameCompletionDialog extends ConsumerStatefulWidget {
  final VoidCallback onHome;
  final VoidCallback onPlayAgain;
  final String title;
  final String message;
  final bool isVictory;

  const GameCompletionDialog({
    super.key,
    required this.onHome,
    required this.onPlayAgain,
    this.title = 'CONGRATS',
    required this.message,
    this.isVictory = true,
  });

  @override
  ConsumerState<GameCompletionDialog> createState() => _GameCompletionDialogState();
}

class _GameCompletionDialogState extends ConsumerState<GameCompletionDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _controller.forward();

    // Trigger haptics on appearance
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isVictory) {
        HapticFeedbackUtil.victory();
      } else {
        HapticFeedbackUtil.vibrate();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.isVictory ? DesignSystem.success : DesignSystem.error;
    final icon = widget.isVictory ? Icons.auto_awesome_rounded : Icons.sentiment_very_dissatisfied_rounded;
    
    final userData = ref.watch(userDataNotifierProvider);
    final superStreak = userData.superStreak ?? 0;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: TangibleContainer(
            radius: DesignSystem.radiusXL,
            padding: const EdgeInsets.all(DesignSystem.spaceXL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated Icon Header
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(DesignSystem.spaceLG),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: color.withValues(alpha: 0.2),
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              icon,
                              color: color,
                              size: 64,
                            ),
                          ),
                          if (widget.isVictory && superStreak > 0)
                            Positioned(
                              right: -10,
                              bottom: -5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: DesignSystem.accentAmber,
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                                  border: Border.all(color: Colors.white, width: 3.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.local_fire_department_rounded,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '$superStreak',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: DesignSystem.spaceXL),
                
                // Title with bold styling
                Text(
                  widget.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: DesignSystem.ink,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceMD),
                
                // Message
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: DesignSystem.inkSlate.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: DesignSystem.space2XL),
                
                // Actions
                TangibleButton(
                  onTap: widget.onPlayAgain,
                  color: DesignSystem.primary,
                  shadowColor: DesignSystem.primaryShadow,
                  child: const Center(
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceMD),
                TangibleButton(
                  onTap: widget.onHome,
                  color: DesignSystem.surface,
                  shadowColor: DesignSystem.outlineVariant,
                  child: Center(
                    child: Text(
                      'HOME',
                      style: TextStyle(
                        color: DesignSystem.inkSlate.withValues(alpha: 0.5),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
