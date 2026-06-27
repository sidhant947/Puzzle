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

class StackBlock {
  double left; // 0.0 to 1.0 (relative screen width fraction)
  double width; // relative width fraction
  final Color color;

  StackBlock({required this.left, required this.width, required this.color});
}

class BlockStackingPhysicsScreen extends ConsumerStatefulWidget {
  const BlockStackingPhysicsScreen({super.key});

  @override
  ConsumerState<BlockStackingPhysicsScreen> createState() => _BlockStackingPhysicsScreenState();
}

class _BlockStackingPhysicsScreenState extends ConsumerState<BlockStackingPhysicsScreen> {
  late Timer _animationTimer;

  // Stacking parameters
  final int _targetStackHeight = 8;
  List<StackBlock> _stackedBlocks = [];

  // Active block state
  double _activeLeft = 0.1;
  double _activeWidth = 0.4;
  double _activeSpeed = 0.015;
  int _activeDirection = 1; // 1 = right, -1 = left

  bool _isGameOver = false;
  bool _hasWon = false;

  final List<Color> _blockColors = [
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.amberAccent,
    Colors.greenAccent,
    Colors.tealAccent,
    Colors.blueAccent,
    Colors.indigoAccent,
    Colors.purpleAccent,
  ];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _isGameOver = false;
    _hasWon = false;
    _activeWidth = 0.4;
    _activeLeft = 0.1;
    _activeSpeed = 0.015;
    _activeDirection = 1;

    // Base block at the bottom
    _stackedBlocks = [
      StackBlock(
        left: 0.25,
        width: 0.5,
        color: Colors.grey,
      )
    ];

    _animationTimer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_isGameOver || _hasWon) return;
      _updateActiveBlock();
    });
  }

  void _updateActiveBlock() {
    setState(() {
      _activeLeft += _activeSpeed * _activeDirection;
      if (_activeLeft + _activeWidth >= 1.0) {
        _activeLeft = 1.0 - _activeWidth;
        _activeDirection = -1;
      } else if (_activeLeft <= 0.0) {
        _activeLeft = 0.0;
        _activeDirection = 1;
      }
    });
  }

  void _dropBlock() {
    if (_isGameOver || _hasWon) return;

    final lastBlock = _stackedBlocks.last;

    // Calculate overlap
    final double overlapLeft = max(_activeLeft, lastBlock.left);
    final double overlapRight = min(_activeLeft + _activeWidth, lastBlock.left + lastBlock.width);
    final double overlapWidth = overlapRight - overlapLeft;

    setState(() {
      if (overlapWidth <= 0.01) {
        // Tower toppled / Missed completely
        HapticFeedbackUtil.error();
        _isGameOver = true;
        _onGameComplete(false);
      } else {
        HapticFeedbackUtil.success();
        // Add overlap block to stack
        _stackedBlocks.add(StackBlock(
          left: overlapLeft,
          width: overlapWidth,
          color: _blockColors[_stackedBlocks.length % _blockColors.length],
        ));

        // Setup next block size & speed
        _activeWidth = overlapWidth;
        _activeLeft = 0.0;
        _activeDirection = 1;
        _activeSpeed += 0.002; // get slightly faster

        if (_stackedBlocks.length - 1 >= _targetStackHeight) {
          _hasWon = true;
          _onGameComplete(true);
        }
      }
    });
  }

  void _onGameComplete(bool won) async {
    _animationTimer.cancel();
    if (won) {
      HapticFeedbackUtil.victory();
      await ref.read(gameStreakNotifierProvider.notifier).completeGame('block_stacking_physics');
    }
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? AppLocalizations.of(context)!.wellDone.toUpperCase() : AppLocalizations.of(context)!.gameOver,
        message: won ? AppLocalizations.of(context)!.completed : AppLocalizations.of(context)!.playAgain,
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
    _animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'block_stacking_physics'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'block_stacking_physics'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _animationTimer.cancel();
            setState(() {
              _startNewGame();
            });
          },
        ),
      ],
      body: GestureDetector(
        onTapDown: (_) => _dropBlock(),
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            // Game header / Stack progress
            Padding(
              padding: const EdgeInsets.all(DesignSystem.spaceMD),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Stack Height: ${_stackedBlocks.length - 1} / $_targetStackHeight',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: DesignSystem.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      _hasWon ? 'VICTORY' : 'PLAYING',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _hasWon ? DesignSystem.gameGreen : DesignSystem.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // The Stack game board
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: 10),
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: ClipRect(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double containerWidth = constraints.maxWidth;
                      final double containerHeight = constraints.maxHeight;
                      final double blockHeight = containerHeight / 11; // max 10 blocks visible

                      return Stack(
                        children: [
                          // Base ground line
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: blockHeight,
                            child: Divider(color: isDark ? Colors.white24 : Colors.black26, height: 1),
                          ),
                          // Static stacked blocks
                          ...List.generate(_stackedBlocks.length, (index) {
                            final block = _stackedBlocks[index];
                            return Positioned(
                              left: block.left * containerWidth,
                              width: block.width * containerWidth,
                              bottom: (index + 1) * blockHeight,
                              height: blockHeight - 2, // small spacing between blocks
                              child: Container(
                                decoration: BoxDecoration(
                                  color: block.color,
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                          // Active moving block at the top stack index
                          if (!_isGameOver && !_hasWon)
                            Positioned(
                              left: _activeLeft * containerWidth,
                              width: _activeWidth * containerWidth,
                              bottom: (_stackedBlocks.length + 1) * blockHeight,
                              height: blockHeight - 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _blockColors[_stackedBlocks.length % _blockColors.length],
                                  borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
