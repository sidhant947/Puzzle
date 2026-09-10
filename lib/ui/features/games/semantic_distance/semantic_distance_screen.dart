import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/tangible.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'semantic_distance_provider.dart';

class SemanticDistanceScreen extends ConsumerStatefulWidget {
  const SemanticDistanceScreen({super.key});

  @override
  ConsumerState<SemanticDistanceScreen> createState() => _SemanticDistanceScreenState();
}

class _SemanticDistanceScreenState extends ConsumerState<SemanticDistanceScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(semanticDistanceNotifierProvider.notifier).startGame();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleGuess(SemanticDistanceNotifier notifier) {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      notifier.submitGuess(text);
      _controller.clear();
    }
    _focusNode.requestFocus();
  }

  Color _getProximityColor(double distance, bool isDark) {
    if (distance == 0) return DesignSystem.gameGreen;
    if (distance < 12) return DesignSystem.gameEmerald;
    if (distance < 25) return DesignSystem.gameAmber;
    if (distance < 45) return DesignSystem.gameBlue;
    return isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate;
  }

  String _getProximityLabel(double distance) {
    if (distance == 0) return 'FOUND';
    if (distance < 12) return 'HOT';
    if (distance < 25) return 'WARM';
    if (distance < 45) return 'COOL';
    return 'COLD';
  }

  void _showCompletionDialog() {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(semanticDistanceNotifierProvider);
    final isVictory = state.guesses.any((g) => g.distance == 0);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: isVictory ? l10n.congrats.toUpperCase() : l10n.timeUp.toUpperCase(),
        message: isVictory 
            ? 'You found the secret word in ${state.guesses.length} guesses!' 
            : 'The secret word was ${state.puzzle?.target}.',
        isVictory: isVictory,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          Navigator.of(context).pop();
          ref.read(semanticDistanceNotifierProvider.notifier).startGame();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(semanticDistanceNotifierProvider);
    final notifier = ref.read(semanticDistanceNotifierProvider.notifier);
    final bestGuess = state.guesses.isNotEmpty ? state.guesses.first : null;

    ref.listen(semanticDistanceNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        if (next.guesses.any((g) => g.distance == 0)) {
          HapticFeedbackUtil.victory();
        } else {
          HapticFeedbackUtil.vibrate();
        }
        ref.read(gameStreakNotifierProvider.notifier).completeGame('semantic_distance');
        _showCompletionDialog();
      }
    });

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'semantic_distance'),
      subtitle: AppLocalizations.of(context)!.semanticDistanceSubtitle,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              DesignSystem.spaceMD,
              DesignSystem.spaceMD,
              DesignSystem.spaceMD,
              DesignSystem.spaceXS,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Guesses: ${state.guesses.length}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TangibleContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Time: ${state.timeLeft}s',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: state.timeLeft < 20 ? DesignSystem.error : colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
            child: Row(
              children: [
                Expanded(
                  child: TangibleButton(
                    onTap: state.isGameOver ? null : () => notifier.requestHint(),
                    color: DesignSystem.gameAmber.withValues(alpha: 0.12),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lightbulb_outline_rounded, size: 16, color: DesignSystem.gameAmber),
                        const SizedBox(width: 6),
                        Text(
                          state.hintsUsed == 0 ? 'Hint (-15s)' : 'Hint (${state.hintsUsed}) -15s',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.amber.shade300 : Colors.amber.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                TangibleButton(
                  onTap: state.isGameOver ? null : () => notifier.giveUp(),
                  color: DesignSystem.error.withValues(alpha: 0.12),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.flag_outlined, size: 16, color: DesignSystem.error),
                      const SizedBox(width: 6),
                      Text(
                        'Give Up',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: isDark ? Colors.red.shade300 : Colors.red.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state.hintText != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DesignSystem.spaceMD,
                DesignSystem.spaceSM,
                DesignSystem.spaceMD,
                0,
              ),
              child: TangibleContainer(
                color: DesignSystem.gameAmber.withValues(alpha: 0.14),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  children: [
                    const Icon(Icons.tips_and_updates_rounded, size: 18, color: DesignSystem.gameAmber),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        state.hintText!,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: isDark ? Colors.amber.shade200 : Colors.amber.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              DesignSystem.spaceMD,
              DesignSystem.spaceSM,
              DesignSystem.spaceMD,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TangibleContainer(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textCapitalization: TextCapitalization.characters,
                      decoration: const InputDecoration(
                        hintText: 'Type a word to guess secret...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onSubmitted: (_) => _handleGuess(notifier),
                    ),
                  ),
                ),
                const SizedBox(width: DesignSystem.spaceSM),
                TangibleButton(
                  onTap: () => _handleGuess(notifier),
                  color: DesignSystem.gameBlue,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.send_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          if (bestGuess != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DesignSystem.spaceMD,
                DesignSystem.spaceSM,
                DesignSystem.spaceMD,
                DesignSystem.spaceSM,
              ),
              child: TangibleContainer(
                color: isDark ? const Color(0xFF1E2430) : const Color(0xFFF1F5F9),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.gps_fixed_rounded,
                              size: 15,
                              color: _getProximityColor(bestGuess.distance, isDark),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'BEST GUESS',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.8,
                                color: isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getProximityColor(bestGuess.distance, isDark).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                          ),
                          child: Text(
                            _getProximityLabel(bestGuess.distance),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: _getProximityColor(bestGuess.distance, isDark),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bestGuess.word,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: _getProximityColor(bestGuess.distance, isDark),
                          ),
                        ),
                        Text(
                          bestGuess.distance.toStringAsFixed(1),
                          style: TextStyle(
                            fontFamily: 'Bebas Neue',
                            fontSize: 20,
                            color: _getProximityColor(bestGuess.distance, isDark),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: (1.0 - (bestGuess.distance / 70.0)).clamp(0.04, 1.0),
                        backgroundColor: colorScheme.outline.withValues(alpha: 0.25),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getProximityColor(bestGuess.distance, isDark),
                        ),
                        minHeight: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: state.guesses.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(DesignSystem.spaceXL),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            size: 44,
                            color: isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Type any word to probe semantic distance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: isDark ? DesignSystem.darkInkSlate : DesignSystem.inkSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceMD),
                    itemCount: state.guesses.length,
                    itemBuilder: (context, index) {
                      final guess = state.guesses[index];
                      final isPerfect = guess.distance == 0;
                      final proxColor = _getProximityColor(guess.distance, isDark);
                      final proxLabel = _getProximityLabel(guess.distance);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: DesignSystem.spaceSM),
                        child: TangibleContainer(
                          color: isPerfect
                              ? DesignSystem.gameGreen.withValues(alpha: 0.2)
                              : (guess.distance < 12
                                  ? DesignSystem.gameGreen.withValues(alpha: 0.08)
                                  : null),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        guess.word,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                          color: isPerfect ? DesignSystem.gameGreen : colorScheme.onSurface,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: proxColor.withValues(alpha: 0.15),
                                          borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
                                        ),
                                        child: Text(
                                          proxLabel,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            color: proxColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    guess.distance.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontFamily: 'Bebas Neue',
                                      fontSize: 20,
                                      color: proxColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: LinearProgressIndicator(
                                  value: (1.0 - (guess.distance / 70.0)).clamp(0.04, 1.0),
                                  backgroundColor: colorScheme.outline.withValues(alpha: 0.2),
                                  valueColor: AlwaysStoppedAnimation<Color>(proxColor),
                                  minHeight: 3.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
