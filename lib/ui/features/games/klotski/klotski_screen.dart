import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class KlotskiBlock {
  final String id;
  final int width;
  final int height;
  int x; // grid column (0..3)
  int y; // grid row (0..4)
  final Color color;
  final String label;

  KlotskiBlock({
    required this.id,
    required this.width,
    required this.height,
    required this.x,
    required this.y,
    required this.color,
    required this.label,
  });
}

class KlotskiScreen extends ConsumerStatefulWidget {
  const KlotskiScreen({super.key});

  @override
  ConsumerState<KlotskiScreen> createState() => _KlotskiScreenState();
}

class _KlotskiScreenState extends ConsumerState<KlotskiScreen> {
  late List<KlotskiBlock> _blocks;
  int _moves = 0;
  KlotskiBlock? _selectedBlock;
  double _panStartX = 0;
  double _panStartY = 0;
  bool _panActive = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _moves = 0;
      _selectedBlock = null;
      _blocks = [
        // Hero (2x2)
        KlotskiBlock(
          id: 'hero',
          width: 2,
          height: 2,
          x: 1,
          y: 0,
          color: DesignSystem.gameRose,
          label: 'HERO',
        ),
        // Left vertical (1x2)
        KlotskiBlock(
          id: 'left_vert_1',
          width: 1,
          height: 2,
          x: 0,
          y: 0,
          color: DesignSystem.gameBlue,
          label: 'GUARD',
        ),
        // Right vertical (1x2)
        KlotskiBlock(
          id: 'right_vert_1',
          width: 1,
          height: 2,
          x: 3,
          y: 0,
          color: DesignSystem.gameBlue,
          label: 'GUARD',
        ),
        // Left middle vertical (1x2)
        KlotskiBlock(
          id: 'left_vert_2',
          width: 1,
          height: 2,
          x: 0,
          y: 2,
          color: DesignSystem.gameTeal,
          label: 'GUARD',
        ),
        // Right middle vertical (1x2)
        KlotskiBlock(
          id: 'right_vert_2',
          width: 1,
          height: 2,
          x: 3,
          y: 2,
          color: DesignSystem.gameTeal,
          label: 'GUARD',
        ),
        // Horizontal (2x1)
        KlotskiBlock(
          id: 'horiz_1',
          width: 2,
          height: 1,
          x: 1,
          y: 2,
          color: DesignSystem.gameOrange,
          label: 'SOLDIER',
        ),
        // Single 1 (1x1)
        KlotskiBlock(
          id: 'single_1',
          width: 1,
          height: 1,
          x: 1,
          y: 3,
          color: DesignSystem.gamePurple,
          label: 'PAWN',
        ),
        // Single 2 (1x1)
        KlotskiBlock(
          id: 'single_2',
          width: 1,
          height: 1,
          x: 2,
          y: 3,
          color: DesignSystem.gamePurple,
          label: 'PAWN',
        ),
        // Single 3 (1x1)
        KlotskiBlock(
          id: 'single_3',
          width: 1,
          height: 1,
          x: 0,
          y: 4,
          color: DesignSystem.gamePurple,
          label: 'PAWN',
        ),
        // Single 4 (1x1)
        KlotskiBlock(
          id: 'single_4',
          width: 1,
          height: 1,
          x: 3,
          y: 4,
          color: DesignSystem.gamePurple,
          label: 'PAWN',
        ),
      ];
    });
  }

  bool _canMoveTo(KlotskiBlock block, int newX, int newY) {
    // Check bounds
    if (newX < 0 || newX + block.width > 4) return false;
    if (newY < 0 || newY + block.height > 5) return false;

    // Check collision with other blocks
    for (var other in _blocks) {
      if (other.id == block.id) continue;
      // Overlap detection
      if (newX < other.x + other.width &&
          newX + block.width > other.x &&
          newY < other.y + other.height &&
          newY + block.height > other.y) {
        return false;
      }
    }
    return true;
  }

  void _moveBlock(KlotskiBlock block, int dx, int dy) {
    final newX = block.x + dx;
    final newY = block.y + dy;

    if (_canMoveTo(block, newX, newY)) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        block.x = newX;
        block.y = newY;
        _moves++;
      });
      _checkWin();
    }
  }

  void _checkWin() {
    final hero = _blocks.firstWhere((b) => b.id == 'hero');
    // Win if 2x2 Hero block reaches bottom middle: x = 1, y = 3
    if (hero.x == 1 && hero.y == 3) {
      HapticFeedbackUtil.victory();
      ref.read(gameStreakNotifierProvider.notifier).completeGame('klotski', xpAmount: 30);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameCompletionDialog(
          title: "KLOTSKI COMPLETED",
          message: "Sensational sliding! You freed the Hero block in $_moves moves.",
          onHome: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onPlayAgain: () {
            Navigator.pop(context);
            _resetGame();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: "KLOTSKI ESCAPE",
      subtitle: "SLIDE THE LARGE RED HERO (2X2) TO THE BOTTOM-MIDDLE DOOR TO ESCAPE. SWIPE A BLOCK OR SELECT TO TAP ARROWS.",
      onReset: _resetGame,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Keep a strict 4:5 aspect ratio for the game board
          final boardWidth = min(constraints.maxWidth, constraints.maxHeight * 0.8) * 0.9;
          final boardHeight = boardWidth * 1.25;

          final cellWidth = boardWidth / 4;
          final cellHeight = boardHeight / 5;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Info Banner
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Text(
                        "MOVES: $_moves",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceMD),

                // Main Game Board
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Outer Frame
                    TangibleContainer(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      radius: DesignSystem.radiusMD,
                      depth: 10,
                      child: SizedBox(
                        width: boardWidth,
                        height: boardHeight,
                        child: Stack(
                          children: [
                            // Subtle background grid lines
                            Positioned.fill(
                              child: GridPaper(
                                color: colorScheme.outline.withValues(alpha: 0.1),
                                divisions: 1,
                                subdivisions: 1,
                                interval: cellWidth,
                              ),
                            ),

                            // Slidable blocks
                            ..._blocks.map((block) {
                              final isSelected = _selectedBlock?.id == block.id;
                              final canUp = _canMoveTo(block, block.x, block.y - 1);
                              final canDown = _canMoveTo(block, block.x, block.y + 1);
                              final canLeft = _canMoveTo(block, block.x - 1, block.y);
                              final canRight = _canMoveTo(block, block.x + 1, block.y);

                              return AnimatedPositioned(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOutCubic,
                                left: block.x * cellWidth,
                                top: block.y * cellHeight,
                                width: block.width * cellWidth,
                                height: block.height * cellHeight,
                                child: Padding(
                                  padding: const EdgeInsets.all(DesignSystem.spaceXS),
                                  child: GestureDetector(
                                    onPanStart: (details) {
                                      _panStartX = details.globalPosition.dx;
                                      _panStartY = details.globalPosition.dy;
                                      _panActive = true;
                                    },
                                    onPanUpdate: (details) {
                                      if (!_panActive) return;
                                      final dx = details.globalPosition.dx - _panStartX;
                                      final dy = details.globalPosition.dy - _panStartY;
                                      const threshold = 25.0;
                                      if (dx.abs() > threshold || dy.abs() > threshold) {
                                        _panActive = false;
                                        if (dx.abs() > dy.abs()) {
                                          if (dx > 0) {
                                            _moveBlock(block, 1, 0);
                                          } else {
                                            _moveBlock(block, -1, 0);
                                          }
                                        } else {
                                          if (dy > 0) {
                                            _moveBlock(block, 0, 1);
                                          } else {
                                            _moveBlock(block, 0, -1);
                                          }
                                        }
                                      }
                                    },
                                    onPanEnd: (_) {
                                      _panActive = false;
                                    },
                                    onTap: () {
                                      HapticFeedbackUtil.lightImpact();
                                      setState(() {
                                        _selectedBlock = isSelected ? null : block;
                                      });
                                    },
                                    child: TangibleContainer(
                                      color: isSelected
                                          ? block.color
                                          : block.color.withValues(alpha: 0.95),
                                      shadowColor: block.color.withValues(alpha: 0.7),
                                      depth: isSelected ? 3.0 : 6.0,
                                      radius: DesignSystem.radiusSM,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // Glow indicator if selected
                                          if (isSelected)
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 2),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 2.5,
                                                  ),
                                                ),
                                              ),
                                            ),

                                          // Hero icon only
                                          if (block.id == 'hero')
                                            const Icon(
                                              Icons.stars_rounded,
                                              color: Colors.white,
                                              size: 28,
                                            ),

                                          // Overlay Navigation Arrows for Selected Block
                                          if (isSelected) ...[
                                            if (canUp)
                                              Positioned(
                                                top: 2,
                                                child: GestureDetector(
                                                  onTap: () => _moveBlock(block, 0, -1),
                                                  child: const CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(Icons.arrow_upward_rounded, size: 14, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            if (canDown)
                                              Positioned(
                                                bottom: 2,
                                                child: GestureDetector(
                                                  onTap: () => _moveBlock(block, 0, 1),
                                                  child: const CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(Icons.arrow_downward_rounded, size: 14, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            if (canLeft)
                                              Positioned(
                                                left: 2,
                                                child: GestureDetector(
                                                  onTap: () => _moveBlock(block, -1, 0),
                                                  child: const CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(Icons.arrow_back_rounded, size: 14, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            if (canRight)
                                              Positioned(
                                                right: 2,
                                                child: GestureDetector(
                                                  onTap: () => _moveBlock(block, 1, 0),
                                                  child: const CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor: Colors.white,
                                                    child: Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),

                    // Escape Zone/Door marker at the bottom middle
                    Positioned(
                      bottom: -12,
                      left: cellWidth * 1 + DesignSystem.spaceXS,
                      right: cellWidth * 1 + DesignSystem.spaceXS,
                      height: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: DesignSystem.gameGreen,
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: DesignSystem.gameGreen.withValues(alpha: 0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceLG),
              ],
            ),
          );
        },
      ),
    );
  }
}
