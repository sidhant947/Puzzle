import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import 'package:puzzle/widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'posner_spatial_cueing_engine.dart';

class PosnerSpatialCueingScreen extends ConsumerStatefulWidget {
  const PosnerSpatialCueingScreen({super.key});

  @override
  ConsumerState<PosnerSpatialCueingScreen> createState() => _PosnerSpatialCueingScreenState();
}

class _PosnerSpatialCueingScreenState extends ConsumerState<PosnerSpatialCueingScreen> {
  static const int totalTrials = 12;

  late PosnerTrial _currentTrial;
  int _trialCount = 0;
  int _score = 0;
  bool _isCueVisible = false;
  bool _isTargetVisible = false;
  bool _isGameOver = false;
  DateTime? _targetAppearTime;
  final List<int> _reactionTimesMs = [];
  Timer? _sequenceTimer;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  @override
  void dispose() {
    _sequenceTimer?.cancel();
    super.dispose();
  }

  void _startNewGame() {
    _sequenceTimer?.cancel();
    setState(() {
      _trialCount = 0;
      _score = 0;
      _isGameOver = false;
      _reactionTimesMs.clear();
    });
    _runNextTrial();
  }

  void _runNextTrial() {
    if (_trialCount >= totalTrials) {
      _endGame();
      return;
    }

    setState(() {
      _trialCount++;
      _isCueVisible = false;
      _isTargetVisible = false;
      _currentTrial = PosnerSpatialCueingEngine.generateTrial();
    });

    // Step 1: Baseline fixation for 600ms
    _sequenceTimer = Timer(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      // Step 2: Show spatial cue
      setState(() {
        _isCueVisible = true;
      });

      _sequenceTimer = Timer(Duration(milliseconds: _currentTrial.cueDurationMs), () {
        if (!mounted) return;
        setState(() {
          _isCueVisible = false;
        });

        // Step 3: ISI delay before target
        _sequenceTimer = Timer(Duration(milliseconds: _currentTrial.targetDelayMs), () {
          if (!mounted) return;
          setState(() {
            _isTargetVisible = true;
            _targetAppearTime = DateTime.now();
          });
        });
      });
    });
  }

  void _respond(TargetSide side) {
    if (_isGameOver || !_isTargetVisible || _targetAppearTime == null) {
      HapticFeedbackUtil.error();
      return;
    }

    final elapsed = DateTime.now().difference(_targetAppearTime!).inMilliseconds;
    _reactionTimesMs.add(elapsed);

    final isCorrect = side == _currentTrial.targetSide;
    if (isCorrect) {
      HapticFeedbackUtil.lightImpact();
      setState(() {
        _score++;
        _isTargetVisible = false;
      });
    } else {
      HapticFeedbackUtil.error();
      setState(() {
        _isTargetVisible = false;
      });
    }

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted && !_isGameOver) {
        _runNextTrial();
      }
    });
  }

  void _endGame() {
    setState(() {
      _isGameOver = true;
    });
    ref.read(gameStreakNotifierProvider.notifier).completeGame('posner_spatial_cueing');
    _showEndDialog();
  }

  void _showEndDialog() {
    final l10n = AppLocalizations.of(context)!;
    final avgRt = _reactionTimesMs.isNotEmpty
        ? (_reactionTimesMs.reduce((a, b) => a + b) ~/ _reactionTimesMs.length)
        : 0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: l10n.posnerSpatialCueingWinTitle,
        message: 'Average Reaction Time: ${avgRt}ms with $_score/$totalTrials accurate responses!',
        onPlayAgain: () {
          Navigator.of(context).pop();
          _startNewGame();
        },
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GameScaffold(
      title: l10n.posnerSpatialCueingTitle,
      subtitle: l10n.posnerSpatialCueingSubtitle,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceLG,
            vertical: DesignSystem.spaceMD,
          ),
          child: Column(
            children: [
              _buildHeader(colorScheme),
              const Spacer(flex: 1),
              _buildArena(colorScheme),
              const Spacer(flex: 2),
              _buildResponseButtons(colorScheme),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.track_changes_rounded, size: 18, color: DesignSystem.gameRose),
              const SizedBox(width: 6),
              Text(
                'TRIAL $_trialCount / $totalTrials',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.gameRose,
                ),
              ),
            ],
          ),
        ),
        TangibleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: colorScheme.surface,
          child: Row(
            children: [
              const Icon(Icons.stars_rounded, size: 18, color: DesignSystem.primary),
              const SizedBox(width: 6),
              Text(
                'ACCURACY: $_score',
                style: const TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: DesignSystem.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildArena(ColorScheme colorScheme) {
    final showLeftCue = _isCueVisible && (_currentTrial.cueType == CueType.neutral || _currentTrial.cueSide == TargetSide.left);
    final showRightCue = _isCueVisible && (_currentTrial.cueType == CueType.neutral || _currentTrial.cueSide == TargetSide.right);
    final showLeftTarget = _isTargetVisible && _currentTrial.targetSide == TargetSide.left;
    final showRightTarget = _isTargetVisible && _currentTrial.targetSide == TargetSide.right;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBox(showLeftCue, showLeftTarget, colorScheme),
        const SizedBox(width: 32),
        // Fixation Cross
        Icon(
          Icons.add_rounded,
          size: 36,
          color: colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        const SizedBox(width: 32),
        _buildBox(showRightCue, showRightTarget, colorScheme),
      ],
    );
  }

  Widget _buildBox(bool isCued, bool isTarget, ColorScheme colorScheme) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
        border: Border.all(
          color: isCued
              ? DesignSystem.accentAmber
              : colorScheme.outline.withValues(alpha: 0.5),
          width: isCued ? 3.5 : 1.5,
        ),
      ),
      child: Center(
        child: isTarget
            ? Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: DesignSystem.gameRose,
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildResponseButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _respond(TargetSide.left),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'LEFT',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceLG),
        Expanded(
          child: TangibleButton(
            color: colorScheme.surface,
            onTap: () => _respond(TargetSide.right),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Center(
              child: Text(
                'RIGHT',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
