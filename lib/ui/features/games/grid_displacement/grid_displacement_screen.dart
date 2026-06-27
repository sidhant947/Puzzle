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

class GridDisplacementScreen extends ConsumerStatefulWidget {
  const GridDisplacementScreen({super.key});

  @override
  ConsumerState<GridDisplacementScreen> createState() => _GridDisplacementScreenState();
}

class _GridDisplacementScreenState extends ConsumerState<GridDisplacementScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  // Phases: 'study' -> 'recall'
  String _phase = 'study';
  int _countdown = 5;
  Timer? _countdownTimer;

  // Icons pool
  final List<IconData> _iconPool = [
    Icons.star_rounded,
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.coffee_rounded,
    Icons.airplanemode_active_rounded,
    Icons.lightbulb_rounded,
    Icons.pets_rounded,
    Icons.face_rounded,
    Icons.local_fire_department_rounded,
    Icons.camera_alt_rounded,
    Icons.beach_access_rounded,
    Icons.music_note_rounded,
    Icons.directions_bike_rounded,
    Icons.sailing_rounded,
    Icons.celebration_rounded,
    Icons.science_rounded,
  ];

  late List<IconData> _originalGrid;
  late List<IconData> _scrambledGrid;

  // Swapped indices
  late int _swapIdx1;
  late int _swapIdx2;

  final Set<int> _selectedIndices = {};

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
    _selectedIndices.clear();
    _phase = 'study';
    _countdown = 5;

    // Pick 9 random icons
    final chosenIcons = (List<IconData>.from(_iconPool)..shuffle(_random)).sublist(0, 9);
    _originalGrid = List<IconData>.from(chosenIcons);

    // Swap exactly two positions for recall phase
    _swapIdx1 = _random.nextInt(9);
    do {
      _swapIdx2 = _random.nextInt(9);
    } while (_swapIdx1 == _swapIdx2);

    _scrambledGrid = List<IconData>.from(_originalGrid);
    final temp = _scrambledGrid[_swapIdx1];
    _scrambledGrid[_swapIdx1] = _scrambledGrid[_swapIdx2];
    _scrambledGrid[_swapIdx2] = temp;

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

  void _onCellTapped(int index) {
    if (_phase != 'recall' || _isGameOver) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        if (_selectedIndices.length < 2) {
          _selectedIndices.add(index);
        }
      }

      // If two cells selected, check answer automatically
      if (_selectedIndices.length == 2) {
        final list = _selectedIndices.toList();
        final idxA = list[0];
        final idxB = list[1];

        final isCorrect = (idxA == _swapIdx1 && idxB == _swapIdx2) ||
            (idxA == _swapIdx2 && idxB == _swapIdx1);

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
              content: Text(l10n.snackbarIncorrectSwapped),
              duration: Duration(milliseconds: 1500),
            ),
          );
          // Briefly show the correct swap before restarting
          _selectedIndices.clear();
          _selectedIndices.add(_swapIdx1);
          _selectedIndices.add(_swapIdx2);
          
          Timer(const Duration(milliseconds: 1500), () {
            if (mounted) _startRound();
          });
        }
      }
    });
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('grid_displacement');
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
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'grid_displacement'),
      subtitle: _phase == 'study'
          ? AppLocalizations.of(context)!.phaseMemorizePlacements
          : L10nGameHelpers.getGameSubtitle(context, 'grid_displacement'),
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
              // Score Banner
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: DesignSystem.primary.withValues(alpha: 0.15),
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
                      color: Colors.grey.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                    ),
                    child: Text(
                      _phase == 'study' ? 'Study: $_countdown s' : 'Recall Phase',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Grid Room
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
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final item = _phase == 'study' ? _originalGrid[index] : _scrambledGrid[index];
                      final isSelected = _selectedIndices.contains(index);

                      return GestureDetector(
                        onTap: () => _onCellTapped(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? DesignSystem.primary.withValues(alpha: 0.2)
                                : (isDark ? Colors.grey[900] : Colors.grey[100]),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                            border: Border.all(
                              color: isSelected
                                  ? DesignSystem.primary
                                  : (isDark ? DesignSystem.darkOutline : DesignSystem.outline),
                              width: isSelected ? 2.5 : 1.5,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            item,
                            size: 40,
                            color: isSelected
                                ? DesignSystem.primary
                                : (isDark ? Colors.white70 : Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
