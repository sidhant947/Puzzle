import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class ColorMazeNavScreen extends ConsumerStatefulWidget {
  const ColorMazeNavScreen({super.key});

  @override
  ConsumerState<ColorMazeNavScreen> createState() => _ColorMazeNavScreenState();
}

class _ColorMazeNavScreenState extends ConsumerState<ColorMazeNavScreen> {
  final Random _random = Random();
  late Timer _colorCycleTimer;

  // Grid configs: 5x5 maze
  final int _gridSize = 5;
  late List<List<int>> _gridColors; // 0=Red, 1=Blue, 2=Green, 3=Yellow
  late int _activePermissionColor; // Current color the player can walk on
  late String _activePermissionColorName;

  // Player position
  int _playerRow = 0;
  int _playerCol = 0;
  // End target position
  final int _targetRow = 4;
  final int _targetCol = 4;

  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
  ];

  final List<String> _colorNames = ['RED', 'BLUE', 'GREEN', 'YELLOW'];

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _score = 0;
    _isGameOver = false;
    _generatePuzzle();
    _startColorCycling();
  }

  void _generatePuzzle() {
    _playerRow = 0;
    _playerCol = 0;

    // Randomize colors for the 5x5 grid
    _gridColors = List.generate(
      _gridSize,
      (_) => List.generate(_gridSize, (_) => _random.nextInt(_colors.length)),
    );

    // Make sure starting tile and target tile match the initial permission color so they are accessible
    _activePermissionColor = _random.nextInt(_colors.length);
    _activePermissionColorName = _colorNames[_activePermissionColor];

    _gridColors[_playerRow][_playerCol] = _activePermissionColor;
    _gridColors[_targetRow][_targetCol] = _random.nextInt(_colors.length); // target color can be anything
  }

  void _startColorCycling() {
    _colorCycleTimer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if (_isGameOver) return;
      setState(() {
        _activePermissionColor = _random.nextInt(_colors.length);
        _activePermissionColorName = _colorNames[_activePermissionColor];
      });
    });
  }

  void _movePlayer(int dr, int dc) {
    if (_isGameOver) return;

    final nr = _playerRow + dr;
    final nc = _playerCol + dc;

    if (nr >= 0 && nr < _gridSize && nc >= 0 && nc < _gridSize) {
      final tileColor = _gridColors[nr][nc];

      // Check if target cell has the active permission color
      if (tileColor == _activePermissionColor || (nr == _targetRow && nc == _targetCol)) {
        HapticFeedbackUtil.lightImpact();
        setState(() {
          _playerRow = nr;
          _playerCol = nc;
        });

        // Check if reached destination
        if (_playerRow == _targetRow && _playerCol == _targetCol) {
          _score++;
          HapticFeedbackUtil.success();
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            _generatePuzzle();
          }
        }
      } else {
        HapticFeedbackUtil.error();
      }
    }
  }

  void _onGameComplete() async {
    _colorCycleTimer.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('color_maze_nav');
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
    _colorCycleTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'color_maze_nav'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'color_maze_nav'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _colorCycleTimer.cancel();
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
                // Active Permission Card
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _colors[_activePermissionColor].withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    border: Border.all(color: _colors[_activePermissionColor], width: 2),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'ALLOW: ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                      Text(
                        _activePermissionColorName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _colors[_activePermissionColor],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                    style: TextStyle(fontWeight: FontWeight.bold, color: DesignSystem.primary),
                  ),
                ),
              ],
            ),
          ),
          // Board Game
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
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize,
                    ),
                    itemCount: _gridSize * _gridSize,
                    itemBuilder: (context, index) {
                      final r = index ~/ _gridSize;
                      final c = index % _gridSize;
                      final tileColorIdx = _gridColors[r][c];
                      final tileColor = _colors[tileColorIdx];

                      final isPlayer = (_playerRow == r && _playerCol == c);
                      final isTarget = (_targetRow == r && _targetCol == c);

                      return Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: tileColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                          border: Border.all(
                            color: isPlayer
                                ? DesignSystem.primary
                                : (isTarget ? Colors.purple : tileColor.withValues(alpha: 0.4)),
                            width: isPlayer || isTarget ? 3.0 : 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: isPlayer
                            ? Icon(Icons.directions_walk_rounded, color: DesignSystem.primary, size: 28)
                            : (isTarget
                                ? const Icon(Icons.flag_rounded, color: Colors.purple, size: 28)
                                : null),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Navigation D-Pad
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward_rounded, size: 36),
                  onPressed: () => _movePlayer(-1, 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_rounded, size: 36),
                      onPressed: () => _movePlayer(0, -1),
                    ),
                    const SizedBox(width: 50),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_rounded, size: 36),
                      onPressed: () => _movePlayer(0, 1),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward_rounded, size: 36),
                  onPressed: () => _movePlayer(1, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
