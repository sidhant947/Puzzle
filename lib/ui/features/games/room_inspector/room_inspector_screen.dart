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

class RoomItem {
  final IconData icon;
  final String label;
  final Color color;

  RoomItem({required this.icon, required this.label, required this.color});
}

class RoomInspectorScreen extends ConsumerStatefulWidget {
  const RoomInspectorScreen({super.key});

  @override
  ConsumerState<RoomInspectorScreen> createState() => _RoomInspectorScreenState();
}

class _RoomInspectorScreenState extends ConsumerState<RoomInspectorScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  // Game Phases: 'study' -> 'blink' -> 'recall'
  String _gamePhase = 'study';
  int _countdown = 3;
  Timer? _phaseTimer;

  // Room grid state
  late List<RoomItem?> _grid; // 3x3 grid
  late int _changedCellIndex;
  late RoomItem _originalItem;
  late RoomItem _newItem;

  final List<RoomItem> _roomPool = [
    RoomItem(icon: Icons.chair_rounded, label: 'CHAIR', color: DesignSystem.gameBlue),
    RoomItem(icon: Icons.bed_rounded, label: 'BED', color: DesignSystem.gameGreen),
    RoomItem(icon: Icons.tv_rounded, label: 'TV', color: DesignSystem.gamePurple),
    RoomItem(icon: Icons.light_rounded, label: 'LAMP', color: DesignSystem.gameOrange),
    RoomItem(icon: Icons.local_florist_rounded, label: 'PLANT', color: Colors.teal),
    RoomItem(icon: Icons.kitchen_rounded, label: 'FRIDGE', color: Colors.blueGrey),
    RoomItem(icon: Icons.table_restaurant_rounded, label: 'TABLE', color: Colors.brown),
    RoomItem(icon: Icons.computer_rounded, label: 'DESK', color: Colors.indigo),
  ];

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  void _startRound() {
    _countdown = 3;
    _gamePhase = 'study';
    _generateLayout();

    _phaseTimer?.cancel();
    _phaseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _phaseTimer?.cancel();
          if (_gamePhase == 'study') {
            _gamePhase = 'blink';
            _countdown = 1;
            // 1 second blink
            _phaseTimer = Timer(const Duration(seconds: 1), () {
              setState(() {
                _applyModification();
                _gamePhase = 'recall';
              });
            });
          }
        }
      });
    });
  }

  void _generateLayout() {
    _grid = List.filled(9, null);
    // Put 5 items randomly on the grid
    final indices = List.generate(9, (i) => i)..shuffle();
    final items = List<RoomItem>.from(_roomPool)..shuffle();

    for (int i = 0; i < 5; i++) {
      _grid[indices[i]] = items[i];
    }
  }

  void _applyModification() {
    // Select one of the occupied slots to modify
    final occupiedIndices = <int>[];
    for (int i = 0; i < 9; i++) {
      if (_grid[i] != null) occupiedIndices.add(i);
    }

    _changedCellIndex = occupiedIndices[_random.nextInt(occupiedIndices.length)];
    _originalItem = _grid[_changedCellIndex]!;

    // Swap it with a completely new item not in the current grid
    final currentIcons = _grid.where((item) => item != null).map((item) => item!.icon).toSet();
    final candidateNewItems = _roomPool.where((item) => !currentIcons.contains(item.icon)).toList();

    if (candidateNewItems.isNotEmpty) {
      _newItem = candidateNewItems[_random.nextInt(candidateNewItems.length)];
    } else {
      _newItem = _roomPool.firstWhere((item) => item.icon != _originalItem.icon);
    }

    _grid[_changedCellIndex] = _newItem;
  }

  void _handleCellTap(int index) {
    if (_isGameOver || _gamePhase != 'recall') return;

    if (index == _changedCellIndex) {
      HapticFeedbackUtil.success();
      setState(() {
        _score++;
        if (_score >= _targetScore) {
          _isGameOver = true;
          _onGameComplete();
        } else {
          _startRound();
        }
      });
    } else {
      HapticFeedbackUtil.error();
      setState(() {
        _score = max(0, _score - 1);
        _startRound();
      });
    }
  }

  void _onGameComplete() async {
    _phaseTimer?.cancel();
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('room_inspector');
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

  @override
  void dispose() {
    _phaseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'room_inspector'),
      subtitle: _gamePhase == 'study'
          ? 'Memorize the items in the room grid!'
          : (_gamePhase == 'blink' ? 'Flashed room...' : 'Tap the item that changed!'),
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
      body: Padding(
        padding: const EdgeInsets.all(DesignSystem.spaceMD),
        child: Column(
          children: [
            // Score Board / Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _gamePhase == 'study'
                      ? 'Studying room: $_countdown s'
                      : (_gamePhase == 'blink' ? 'Shuffling...' : 'Spot the change!'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _gamePhase == 'study' ? DesignSystem.gameOrange : DesignSystem.gameGreen,
                  ),
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
            const SizedBox(height: 40),
            // The Grid Room
            Expanded(
              child: Center(
                child: AspectRatio(
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
                    child: _gamePhase == 'blink'
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(DesignSystem.primary),
                            ),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemCount: 9,
                            itemBuilder: (context, index) {
                              final item = _grid[index];

                              return GestureDetector(
                                onTap: () => _handleCellTap(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: item != null
                                        ? item.color.withValues(alpha: 0.15)
                                        : (isDark ? Colors.grey[900] : Colors.grey[100]),
                                    borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                                    border: Border.all(
                                      color: item != null
                                          ? item.color.withValues(alpha: 0.5)
                                          : (isDark ? Colors.white10 : Colors.black.withValues(alpha: 0.1)),
                                      width: 1.5,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: item != null
                                      ? Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(item.icon, size: 40, color: item.color),
                                            const SizedBox(height: 4),
                                            Text(
                                              item.label,
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: item.color,
                                              ),
                                            ),
                                          ],
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
