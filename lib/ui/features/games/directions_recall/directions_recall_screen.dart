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

class DirectionStep {
  final String dir; // 'NORTH', 'SOUTH', 'EAST', 'WEST'
  final int distance;

  DirectionStep(this.dir, this.distance);

  @override
  String toString() => '$dir $distance';
}

class DirectionsRecallScreen extends ConsumerStatefulWidget {
  const DirectionsRecallScreen({super.key});

  @override
  ConsumerState<DirectionsRecallScreen> createState() => _DirectionsRecallScreenState();
}

class _DirectionsRecallScreenState extends ConsumerState<DirectionsRecallScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  // Phases: 'study' -> 'recall'
  String _phase = 'study';
  int _countdown = 8;
  Timer? _countdownTimer;

  final int _gridSize = 5;
  late int _startX;
  late int _startY;
  late int _targetX;
  late int _targetY;
  
  final List<DirectionStep> _steps = [];

  Point<int>? _userSelection;

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startRound() {
    _countdownTimer?.cancel();
    _steps.clear();
    _userSelection = null;
    _phase = 'study';
    _countdown = 8;

    // Pick random start position
    _startX = _random.nextInt(_gridSize);
    _startY = _random.nextInt(_gridSize);

    int cx = _startX;
    int cy = _startY;

    final dirs = ['NORTH', 'SOUTH', 'EAST', 'WEST'];

    // Generate 3 valid steps that keep us in bounds
    int attempts = 0;
    while (_steps.length < 3 && attempts < 100) {
      attempts++;
      String d = dirs[_random.nextInt(4)];
      int dist = 1 + _random.nextInt(2); // 1 or 2 blocks

      int nx = cx;
      int ny = cy;

      if (d == 'NORTH') ny -= dist;
      if (d == 'SOUTH') ny += dist;
      if (d == 'WEST') nx -= dist;
      if (d == 'EAST') nx += dist;

      if (nx >= 0 && nx < _gridSize && ny >= 0 && ny < _gridSize) {
        _steps.add(DirectionStep(d, dist));
        cx = nx;
        cy = ny;
      }
    }

    // Target coordinates
    _targetX = cx;
    _targetY = cy;

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _phase = 'recall';
          _countdownTimer?.cancel();
        }
      });
    });
  }

  void _onCellTapped(int x, int y) {
    if (_phase != 'recall' || _isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _userSelection = Point(x, y);
    });
  }

  void _onSubmit() {
    if (_userSelection == null || _isGameOver) return;

    final isCorrect = _userSelection!.x == _targetX && _userSelection!.y == _targetY;

    if (isCorrect) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _startRound();
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectDestination(_targetX + 1, _targetY + 1)),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
      _startRound();
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('directions_recall');
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
            _score = 0;
            _isGameOver = false;
            _startRound();
          });
        },
      ),
    );
  }

  IconData _getDirIcon(String dir) {
    switch (dir) {
      case 'NORTH': return Icons.arrow_upward_rounded;
      case 'SOUTH': return Icons.arrow_downward_rounded;
      case 'WEST': return Icons.arrow_back_rounded;
      case 'EAST': return Icons.arrow_forward_rounded;
    }
    return Icons.help_outline;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'directions_recall'),
      subtitle: _phase == 'study'
          ? 'Memorize the directions and navigate from the START node in your head!'
          : 'Tapped your guessed final cell on the grid map.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _startRound();
            });
          },
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DesignSystem.spaceMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score / Timer Banner
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: DesignSystem.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      '${AppLocalizations.of(context)!.statScore}: $_score / $_targetScore',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: DesignSystem.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      _phase == 'study' ? 'Study: $_countdown s' : 'Recall Phase',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Map Grid
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(
                      color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _gridSize,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: _gridSize * _gridSize,
                    itemBuilder: (context, index) {
                      int x = index % _gridSize;
                      int y = index ~/ _gridSize;

                      final isStart = x == _startX && y == _startY;
                      final isSelected = _userSelection != null && _userSelection!.x == x && _userSelection!.y == y;

                      return GestureDetector(
                        onTap: () => _onCellTapped(x, y),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? DesignSystem.primary.withOpacity(0.2)
                                : (isStart
                                    ? Colors.green.withOpacity(0.15)
                                    : (isDark ? Colors.grey[900] : Colors.grey[150])),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                            border: Border.all(
                              color: isSelected
                                  ? DesignSystem.primary
                                  : (isStart ? Colors.green : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1))),
                              width: isSelected || isStart ? 2.5 : 1.0,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: isStart
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_circle_filled_rounded, size: 24, color: Colors.green),
                                    Text(AppLocalizations.of(context)!.btnStartGame, style: TextStyle(fontSize: 8, color: Colors.green, fontWeight: FontWeight.bold)),
                                  ],
                                )
                              : (isSelected
                                  ? const Icon(Icons.location_on_rounded, size: 28, color: DesignSystem.primary)
                                  : null),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Instruction list or Submit Button
              if (_phase == 'study') ...[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('DIRECTIONS LIST:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _steps.map((step) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? DesignSystem.darkSurface : Colors.white,
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                        border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                      ),
                      child: Column(
                        children: [
                          Icon(_getDirIcon(step.dir), color: DesignSystem.gameOrange, size: 28),
                          const SizedBox(height: 4),
                          Text(
                            '${step.dir} ${step.distance}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ] else ...[
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _userSelection != null ? _onSubmit : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey[400]?.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.btnSubmitLocation, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
