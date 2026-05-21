import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';

class RelationalMemoryScreen extends ConsumerStatefulWidget {
  const RelationalMemoryScreen({super.key});

  @override
  ConsumerState<RelationalMemoryScreen> createState() => _RelationalMemoryScreenState();
}

class _RelationalMemoryScreenState extends ConsumerState<RelationalMemoryScreen> {
  final Random _random = Random();
  static const int gridSize = 3;

  int _round = 1;
  static const int totalRounds = 3;

  // Level config: how many items to remember
  final List<int> _itemsCount = [3, 4, 5];

  // List of distinct icons and colors to bind
  final List<Map<String, dynamic>> _iconPool = [
    {'icon': Icons.vpn_key_rounded, 'color': DesignSystem.accentAmber},
    {'icon': Icons.star_rounded, 'color': DesignSystem.accentBerry},
    {'icon': Icons.pets_rounded, 'color': DesignSystem.accentEmerald},
    {'icon': Icons.umbrella_rounded, 'color': DesignSystem.gameBlue},
    {'icon': Icons.favorite_rounded, 'color': DesignSystem.gameRose},
  ];

  // Position index (0 to 8) -> Icon Map
  late Map<int, Map<String, dynamic>> _targetsMap;
  
  bool _isMemorizationPhase = true;
  int? _selectedIconIndexFromTray;
  
  // Player placements: Position index -> Icon index in pool
  late Map<int, int> _playerPlacements;
  int _secondsLeftToMemorize = 4;
  Timer? _memorizationTimer;

  @override
  void initState() {
    super.initState();
    _startRound();
  }

  @override
  void dispose() {
    _memorizationTimer?.cancel();
    super.dispose();
  }

  void _startRound() {
    _memorizationTimer?.cancel();
    setState(() {
      _isMemorizationPhase = true;
      _selectedIconIndexFromTray = null;
      _playerPlacements = {};
      _targetsMap = {};
      _secondsLeftToMemorize = 4;

      final count = _itemsCount[_round - 1];
      
      // Select random positions
      final Set<int> positions = {};
      while (positions.length < count) {
        positions.add(_random.nextInt(gridSize * gridSize));
      }
      
      final posList = positions.toList();
      for (int i = 0; i < count; i++) {
        _targetsMap[posList[i]] = _iconPool[i];
      }
    });

    _memorizationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsLeftToMemorize > 1) {
          _secondsLeftToMemorize--;
        } else {
          _secondsLeftToMemorize = 0;
          _isMemorizationPhase = false;
          _memorizationTimer?.cancel();
        }
      });
    });
  }

  void _onTrayIconSelected(int idx) {
    if (_isMemorizationPhase) return;
    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedIconIndexFromTray = idx;
    });
  }

  void _onGridCellTapped(int index) {
    if (_isMemorizationPhase || _selectedIconIndexFromTray == null) return;

    HapticFeedbackUtil.mediumImpact();
    setState(() {
      // Place selected tray icon on this grid slot (replaces if any there)
      _playerPlacements[index] = _selectedIconIndexFromTray!;
      _selectedIconIndexFromTray = null; // deselect
    });

    _checkPlacements();
  }

  void _checkPlacements() {
    final count = _itemsCount[_round - 1];
    
    // Check if player placed all required items
    if (_playerPlacements.length < count) return;

    bool allCorrect = true;
    _playerPlacements.forEach((pos, poolIdx) {
      final expectedIcon = _targetsMap[pos];
      final actualIcon = _iconPool[poolIdx];
      if (expectedIcon == null || expectedIcon['icon'] != actualIcon['icon']) {
        allCorrect = false;
      }
    });

    if (allCorrect) {
      HapticFeedbackUtil.success();
      if (_round < totalRounds) {
        setState(() {
          _round++;
        });
        _startRound();
      } else {
        ref.read(gameStreakNotifierProvider.notifier).completeGame('relational_memory', xpAmount: 30);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: "LOCATION BIND ACED",
            message: "Fabulous spatial relational memory accuracy!",
            onHome: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            onPlayAgain: () {
              Navigator.pop(context);
              setState(() {
                _round = 1;
              });
              _startRound();
            },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final count = _itemsCount[_round - 1];

    return GameScaffold(
      title: "RELATIONAL BIND",
      subtitle: _isMemorizationPhase 
          ? "MEMORIZE THE LOCATION OF EACH COLORFUL ICON!" 
          : "PLACE THE ICONS FROM THE TRAY TO THEIR CORRECT SLOTS IN THE GRID",
      body: LayoutBuilder(
        builder: (context, constraints) {
          final boardSize = min(constraints.maxWidth, constraints.maxHeight) * 0.75;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
            child: Column(
              children: [
                const SizedBox(height: DesignSystem.spaceLG),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ROUND: $_round / $totalRounds",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      _isMemorizationPhase ? "MEMORIZE: $_secondsLeftToMemorize s" : "PLACE ICONS",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: _isMemorizationPhase ? DesignSystem.error : DesignSystem.accentEmerald,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: DesignSystem.spaceLG),
                
                // Grid Board
                SizedBox(
                  width: boardSize,
                  height: boardSize,
                  child: TangibleContainer(
                    color: colorScheme.outline,
                    radius: DesignSystem.radiusMD,
                    padding: const EdgeInsets.all(DesignSystem.spaceXS),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridSize,
                        crossAxisSpacing: DesignSystem.spaceXS,
                        mainAxisSpacing: DesignSystem.spaceXS,
                      ),
                      itemCount: gridSize * gridSize,
                      itemBuilder: (context, index) {
                        Map<String, dynamic>? cellIcon;

                        if (_isMemorizationPhase) {
                          cellIcon = _targetsMap[index];
                        } else {
                          final poolIdx = _playerPlacements[index];
                          if (poolIdx != null) {
                            cellIcon = _iconPool[poolIdx];
                          }
                        }

                        return GestureDetector(
                          onTap: () => _onGridCellTapped(index),
                          child: TangibleContainer(
                            radius: DesignSystem.radiusSM,
                            depth: cellIcon != null ? 0.0 : 2.0,
                            color: colorScheme.surface,
                            shadowColor: colorScheme.outline,
                            child: Center(
                              child: cellIcon != null
                                  ? Icon(
                                      cellIcon['icon'] as IconData,
                                      size: 36,
                                      color: cellIcon['color'] as Color,
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                const Spacer(),
                
                // Tray selection options
                if (!_isMemorizationPhase) ...[
                  Text(
                    "TRAY ICONS",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: DesignSystem.spaceMD),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(count, (idx) {
                      final item = _iconPool[idx];
                      final isAlreadyPlaced = _playerPlacements.values.contains(idx);
                      final isSelected = _selectedIconIndexFromTray == idx;

                      if (isAlreadyPlaced) return const SizedBox.shrink();

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TangibleButton(
                          padding: const EdgeInsets.all(16),
                          color: isSelected ? DesignSystem.primary : colorScheme.surface,
                          shadowColor: isSelected ? DesignSystem.primaryShadow : colorScheme.outline,
                          onTap: () => _onTrayIconSelected(idx),
                          child: Icon(
                            item['icon'] as IconData,
                            size: 28,
                            color: isSelected ? Colors.white : (item['color'] as Color),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
                const SizedBox(height: DesignSystem.space2XL),
              ],
            ),
          );
        },
      ),
    );
  }
}
