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

class PlayingCard {
  final String rank;
  final String suit; // '♥', '♦', '♣', '♠'
  final Color color;

  PlayingCard({required this.rank, required this.suit, required this.color});
}

class CardCountingMemoryScreen extends ConsumerStatefulWidget {
  const CardCountingMemoryScreen({super.key});

  @override
  ConsumerState<CardCountingMemoryScreen> createState() => _CardCountingMemoryScreenState();
}

class _CardCountingMemoryScreenState extends ConsumerState<CardCountingMemoryScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 5;
  bool _isGameOver = false;

  // Phases: 'idle' -> 'dealing' -> 'recall'
  String _phase = 'idle';

  final List<PlayingCard> _dealtCards = [];
  int _currentCardIndex = -1;
  Timer? _dealTimer;

  late String _targetSuit;
  late int _correctCount;

  final List<String> _suits = ['♥', '♦', '♣', '♠'];
  final List<String> _ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dealTimer?.cancel();
    super.dispose();
  }

  void _startGame() {
    _dealtCards.clear();
    _score = 0;
    _isGameOver = false;
    _startDealing();
  }

  void _startDealing() {
    _dealtCards.clear();
    _currentCardIndex = -1;

    // Generate 5 random cards
    for (int i = 0; i < 5; i++) {
      String suit = _suits[_random.nextInt(_suits.length)];
      String rank = _ranks[_random.nextInt(_ranks.length)];
      Color color = (suit == '♥' || suit == '♦') ? Colors.red : Colors.black87;
      _dealtCards.add(PlayingCard(rank: rank, suit: suit, color: color));
    }

    // Pick a random target suit to ask about
    _targetSuit = _suits[_random.nextInt(_suits.length)];
    _correctCount = _dealtCards.where((c) => c.suit == _targetSuit).length;

    setState(() {
      _phase = 'dealing';
      _currentCardIndex = 0;
    });

    _dealTimer?.cancel();
    _dealTimer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (!mounted) return;
      setState(() {
        if (_currentCardIndex < _dealtCards.length - 1) {
          _currentCardIndex++;
          HapticFeedbackUtil.lightImpact();
        } else {
          _dealTimer?.cancel();
          _phase = 'recall';
        }
      });
    });
  }

  void _onAnswer(int count) {
    if (_phase != 'recall' || _isGameOver) return;

    if (count == _correctCount) {
      _score++;
      HapticFeedbackUtil.success();
      if (_score >= _targetScore) {
        _isGameOver = true;
        _onGameComplete();
      } else {
        _startDealing();
      }
    } else {
      HapticFeedbackUtil.error();
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.snackbarIncorrectCorrectCount(_targetSuit, _correctCount)),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
        ),
      );
      _startDealing();
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('card_counting_memory');
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
            _phase = 'idle';
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'card_counting_memory'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'card_counting_memory'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            _dealTimer?.cancel();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _phase = 'idle';
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
              const SizedBox(height: 45),
              if (_phase == 'idle') ...[
                const Icon(Icons.style_rounded, size: 80, color: DesignSystem.primary),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _startGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DesignSystem.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignSystem.radiusMD)),
                  ),
                  child: Text(AppLocalizations.of(context)!.btnStartDealing, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ] else if (_phase == 'dealing') ...[
                // Display current card
                _buildPlayingCard(_dealtCards[_currentCardIndex], isDark),
                const SizedBox(height: 24),
                Text(
                  'Card ${_currentCardIndex + 1} of 5',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ] else ...[
                // Recall phase
                Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
                    border: Border.all(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'RECALL QUESTION',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'How many $_targetSuit cards were dealt?',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: DesignSystem.gameOrange),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Choices 0 to 4
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      width: 80,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => _onAnswer(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? DesignSystem.darkSurface : Colors.white,
                          foregroundColor: isDark ? Colors.white : Colors.black87,
                          side: BorderSide(
                            color: isDark ? DesignSystem.darkOutline : DesignSystem.outline,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                          ),
                        ),
                        child: Text(
                          '$index',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayingCard(PlayingCard card, bool isDark) {
    final cardBg = isDark ? Colors.grey[900]! : Colors.white;
    return Container(
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white30 : Colors.black26,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.rank,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: card.color),
                ),
                Text(
                  card.suit,
                  style: TextStyle(fontSize: 20, color: card.color),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              card.suit,
              style: TextStyle(fontSize: 60, color: card.color),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  card.suit,
                  style: TextStyle(fontSize: 20, color: card.color),
                ),
                Text(
                  card.rank,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: card.color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
