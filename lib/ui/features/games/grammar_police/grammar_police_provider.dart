import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'grammar_police_engine.dart';

part 'grammar_police_provider.g.dart';

class GrammarPoliceState {
  final List<ActiveSentence> activeSentences;
  final int score;
  final int lives;
  final bool isGameOver;

  GrammarPoliceState({
    this.activeSentences = const [],
    this.score = 0,
    this.lives = 3,
    this.isGameOver = false,
  });

  GrammarPoliceState copyWith({
    List<ActiveSentence>? activeSentences,
    int? score,
    int? lives,
    bool? isGameOver,
  }) {
    return GrammarPoliceState(
      activeSentences: activeSentences ?? this.activeSentences,
      score: score ?? this.score,
      lives: lives ?? this.lives,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}

class ActiveSentence {
  final GrammarSentence sentence;
  final double y;
  final DateTime createdAt;
  bool isHandled;

  ActiveSentence({
    required this.sentence,
    required this.y,
    required this.createdAt,
    this.isHandled = false,
  });

  ActiveSentence copyWith({double? y, bool? isHandled}) {
    return ActiveSentence(
      sentence: sentence,
      y: y ?? this.y,
      createdAt: createdAt,
      isHandled: isHandled ?? this.isHandled,
    );
  }
}

@riverpod
class GrammarPoliceNotifier extends _$GrammarPoliceNotifier {
  Timer? _gameTimer;
  Timer? _spawnTimer;

  @override
  GrammarPoliceState build() {
    ref.onDispose(() {
      _gameTimer?.cancel();
      _spawnTimer?.cancel();
    });
    return GrammarPoliceState();
  }

  void startGame() {
    _gameTimer?.cancel();
    _spawnTimer?.cancel();
    state = GrammarPoliceState();
    _startSpawning();
    _startGameLoop();
  }

  void _startSpawning() {
    _spawnTimer = Timer.periodic(const Duration(milliseconds: 2500), (timer) {
      if (state.isGameOver) return;
      final newSentence = ActiveSentence(
        sentence: GrammarPoliceEngine.generateSentence(),
        y: 1.1, // Start below screen
        createdAt: DateTime.now(),
      );
      state = state.copyWith(
        activeSentences: [...state.activeSentences, newSentence],
      );
    });
  }

  void _startGameLoop() {
    _gameTimer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (state.isGameOver) return;

      final List<ActiveSentence> updated = [];
      int missedErrors = 0;

      for (var s in state.activeSentences) {
        final nextY = s.y - 0.01;
        if (nextY < -0.1) {
          if (s.sentence.hasError && !s.isHandled) {
            missedErrors++;
          }
          continue;
        }
        updated.add(s.copyWith(y: nextY));
      }

      if (missedErrors > 0) {
        final newLives = (state.lives - missedErrors).clamp(0, 3);
        state = state.copyWith(
          lives: newLives,
          activeSentences: updated,
          isGameOver: newLives <= 0,
        );
      } else {
        state = state.copyWith(activeSentences: updated);
      }
    });
  }

  void handleTap(ActiveSentence active) {
    if (state.isGameOver || active.isHandled) return;

    final updatedSentences = state.activeSentences.map((s) {
      if (s.createdAt == active.createdAt) {
        return s.copyWith(isHandled: true);
      }
      return s;
    }).toList();

    if (active.sentence.hasError) {
      state = state.copyWith(
        score: state.score + 10,
        activeSentences: updatedSentences,
      );
    } else {
      state = state.copyWith(
        lives: 0,
        isGameOver: true,
        activeSentences: updatedSentences,
      );
    }
  }
}
