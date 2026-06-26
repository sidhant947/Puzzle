import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class AreaPerimeterMatchScreen extends ConsumerStatefulWidget {
  const AreaPerimeterMatchScreen({super.key});

  @override
  ConsumerState<AreaPerimeterMatchScreen> createState() => _AreaPerimeterMatchScreenState();
}

class _AreaPerimeterMatchScreenState extends ConsumerState<AreaPerimeterMatchScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  late int _targetW;
  late int _targetH;
  late int _targetArea;
  late int _targetPerimeter;

  int _currentW = 2;
  int _currentH = 2;

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    // Generate target width and height between 2 and 7
    _targetW = 2 + _random.nextInt(6);
    _targetH = 2 + _random.nextInt(6);

    _targetArea = _targetW * _targetH;
    _targetPerimeter = 2 * (_targetW + _targetH);

    // Set initial user values
    _currentW = 2;
    _currentH = 2;
  }

  void _checkSolution() {
    final area = _currentW * _currentH;
    final perimeter = 2 * (_currentW + _currentH);

    if (area == _targetArea && perimeter == _targetPerimeter) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        setState(() {
          _generatePuzzle();
        });
      }
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('area_perimeter_match');
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
            _generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: 'AREA & PERIMETER',
      subtitle: 'Adjust the rectangle dimensions to match the target area and perimeter.',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Target board
          Container(
            margin: const EdgeInsets.all(DesignSystem.spaceMD),
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
              border: Border.all(
                color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('TARGET AREA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(
                      '$_targetArea',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: DesignSystem.gameOrange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('TARGET PERIMETER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(
                      '$_targetPerimeter',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: DesignSystem.gameOrange,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    '$_score / $_targetScore',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          // 8x8 Grid Visualizer
          Expanded(
            child: Center(
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                  border: Border.all(
                    color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                    width: 2,
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    const gridSize = 8;
                    final cellSize = constraints.maxWidth / gridSize;

                    return Stack(
                      children: [
                        // Grid background lines
                        for (int i = 1; i < gridSize; i++) ...[
                          Positioned(
                            left: i * cellSize,
                            top: 0,
                            bottom: 0,
                            child: Container(width: 1, color: isDark ? Colors.white10 : Colors.black12),
                          ),
                          Positioned(
                            top: i * cellSize,
                            left: 0,
                            right: 0,
                            child: Container(height: 1, color: isDark ? Colors.white10 : Colors.black12),
                          ),
                        ],
                        // User drawn rectangle starting from top-left (0,0)
                        Positioned(
                          left: 0,
                          top: 0,
                          width: _currentW * cellSize,
                          height: _currentH * cellSize,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              color: DesignSystem.primary.withOpacity(0.3),
                              border: Border.all(
                                color: DesignSystem.primary,
                                width: 3,
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(DesignSystem.radiusSM),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${_currentW} × ${_currentH}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: DesignSystem.primary,
                              ),
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
          // Controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD, vertical: DesignSystem.spaceLG),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStepper('WIDTH', _currentW, (val) {
                      setState(() {
                        _currentW = val;
                      });
                      _checkSolution();
                    }),
                    _buildStepper('HEIGHT', _currentH, (val) {
                      setState(() {
                        _currentH = val;
                      });
                      _checkSolution();
                    }),
                  ],
                ),
                const SizedBox(height: 16),
                // Current stats readout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Current Area: ${_currentW * _currentH}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      'Current Perimeter: ${2 * (_currentW + _currentH)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper(String label, int value, ValueChanged<int> onChanged) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline_rounded),
              iconSize: 32,
              onPressed: value > 1
                  ? () {
                      HapticFeedbackUtil.lightImpact();
                      onChanged(value - 1);
                    }
                  : null,
            ),
            Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                '$value',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_rounded),
              iconSize: 32,
              onPressed: value < 8
                  ? () {
                      HapticFeedbackUtil.lightImpact();
                      onChanged(value + 1);
                    }
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}
