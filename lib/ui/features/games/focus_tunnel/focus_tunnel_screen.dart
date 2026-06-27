import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class FocusTunnelScreen extends ConsumerStatefulWidget {
  const FocusTunnelScreen({super.key});

  @override
  ConsumerState<FocusTunnelScreen> createState() => _FocusTunnelScreenState();
}

class TunnelSymbol {
  final double id;
  final IconData icon;
  final Color color;
  double scale; // Starts tiny in 3D center, grows large
  double rotation;

  TunnelSymbol({
    required this.id,
    required this.icon,
    required this.color,
    this.scale = 0.1,
    this.rotation = 0.0,
  });
}

class _FocusTunnelScreenState extends ConsumerState<FocusTunnelScreen> with SingleTickerProviderStateMixin {
  final Random _random = Random();
  late AnimationController _tunnelAnimationController;
  late Timer _spawnTimer;

  // Icons used as symbols
  final List<IconData> _symbols = [
    Icons.favorite_rounded,
    Icons.star_rounded,
    Icons.face_rounded,
    Icons.ac_unit_rounded,
    Icons.flash_on_rounded,
    Icons.brightness_5_rounded,
  ];

  final List<Color> _colors = [
    DesignSystem.gameBlue,
    DesignSystem.gameGreen,
    DesignSystem.gameOrange,
    DesignSystem.gamePurple,
    DesignSystem.gameRose,
  ];

  final List<TunnelSymbol> _activeSymbols = [];
  final List<IconData> _history = []; // 2-back history tracking
  int _score = 0;
  final int _targetScore = 15;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _tunnelAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _activeSymbols.clear();
    _history.clear();

    _spawnTimer = Timer.periodic(const Duration(milliseconds: 1200), (timer) {
      if (_isGameOver) return;
      _spawnSymbol();
    });
  }

  void _spawnSymbol() {
    IconData icon;
    // 33% chance to spawn a 2-back match
    if (_history.length >= 2 && _random.nextDouble() < 0.33) {
      icon = _history[_history.length - 2];
    } else {
      icon = _symbols[_random.nextInt(_symbols.length)];
    }

    _history.add(icon);
    if (_history.length > 5) {
      _history.removeAt(0);
    }

    setState(() {
      _activeSymbols.add(TunnelSymbol(
        id: _random.nextDouble(),
        icon: icon,
        color: _colors[_random.nextInt(_colors.length)],
      ));
    });
  }

  void _onTapSymbol(TunnelSymbol symbol) {
    if (_isGameOver) return;

    // Check if the tapped symbol matches the 2-back symbol rule
    // That means it matches the second most recent item in our history,
    // which should be located exactly at index `_history.length - 3` because the tapped one is already in history.
    // Let's find this symbol's position in active list.
    // Simply, if we look at the last few symbols spawned:
    // tapped symbol icon == symbol.icon.
    // If we trace the spawned order: the symbol just before this one is 1-back, the one before that is 2-back.
    // Let's verify by scanning the index of this symbol in history:
    final symIndex = _history.lastIndexOf(symbol.icon);
    bool isMatch = false;
    if (symIndex >= 2 && _history[symIndex - 2] == symbol.icon) {
      isMatch = true;
    }

    setState(() {
      _activeSymbols.removeWhere((s) => s.id == symbol.id);
      if (isMatch) {
        _score++;
        HapticFeedbackUtil.success();
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        }
      } else {
        _score = max(0, _score - 2);
        HapticFeedbackUtil.error();
      }
    });
  }

  void _onGameComplete() async {
    _spawnTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('focus_tunnel');
    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: AppLocalizations.of(context)!.wellDone.toUpperCase(),
        message: AppLocalizations.of(context)!.completed,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          setState(() {
            _startNewGame();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _tunnelAnimationController.dispose();
    _spawnTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Update active symbol growth scaling (simulating flying forward in tunnel)
    for (var s in _activeSymbols) {
      s.scale += 0.015;
      s.rotation += 0.02;
    }
    // Remove symbols that have grown too large (past screen borders)
    _activeSymbols.removeWhere((s) => s.scale >= 2.5);

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'focus_tunnel'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'focus_tunnel'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _spawnTimer.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Keep track of the symbol sequence in your mind',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  margin: const EdgeInsets.all(DesignSystem.spaceMD),
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final center = Offset(constraints.maxWidth / 2, constraints.maxHeight / 2);

                      return Stack(
                        children: [
                          // Concentric background circles to simulate a tunnel
                          AnimatedBuilder(
                            animation: _tunnelAnimationController,
                            builder: (context, child) {
                              return CustomPaint(
                                size: Size(constraints.maxWidth, constraints.maxHeight),
                                painter: TunnelBackgroundPainter(
                                  value: _tunnelAnimationController.value,
                                  isDark: isDark,
                                ),
                              );
                            },
                          ),
                          // Flying tunnel symbols
                          ..._activeSymbols.map((symbol) {
                            // Calculate position radiating from center
                            // Scale determines size and distance from center
                            final double size = 30 + (symbol.scale * 40);
                            final double radius = symbol.scale * (constraints.maxWidth / 2.5);

                            // Distribute directions slightly based on its ID
                            final double angle = symbol.id * 2 * pi;
                            final double left = center.dx + cos(angle) * radius - (size / 2);
                            final double top = center.dy + sin(angle) * radius - (size / 2);

                            return Positioned(
                              left: left,
                              top: top,
                              width: size,
                              height: size,
                              child: GestureDetector(
                                onTapDown: (_) => _onTapSymbol(symbol),
                                child: Transform.rotate(
                                  angle: symbol.rotation,
                                  child: Opacity(
                                    opacity: min(1.0, symbol.scale),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: symbol.color.withValues(alpha: 0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: symbol.color, width: 2),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        symbol.icon,
                                        color: symbol.color,
                                        size: size * 0.6,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                          // Center focal point
                          Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class TunnelBackgroundPainter extends CustomPainter {
  final double value;
  final bool isDark;

  TunnelBackgroundPainter({required this.value, required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? Colors.white.withValues(alpha: 0.05) : Colors.black.withValues(alpha: 0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 1.2;

    // Draw radiating perspective lines from center
    const numLines = 8;
    for (int i = 0; i < numLines; i++) {
      final angle = (i / numLines) * 2 * pi;
      canvas.drawLine(center, center + Offset(cos(angle) * maxRadius, sin(angle) * maxRadius), paint);
    }

    // Draw expanding concentric circles
    for (int i = 1; i <= 5; i++) {
      double radius = ((i + value) / 6) * maxRadius;
      if (radius > 0) {
        canvas.drawCircle(center, radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
