import 'dart:async';
import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reading_span_provider.g.dart';

enum ReadingSpanPhase { showingSentence, showingLetter, recalling, result }

class ReadingSpanSentence {
  final String text;
  final bool isTrue;

  ReadingSpanSentence(this.text, this.isTrue);
}

class ReadingSpanState {
  final ReadingSpanPhase phase;
  final List<String> sequence;
  final List<String> userSequence;
  final int currentSequenceIndex;
  final ReadingSpanSentence? currentSentence;
  final int currentLength;
  final int score;
  final int timeLeft;
  final bool isGameOver;
  final bool isLoading;
  final bool? lastRoundCorrect;
  final String highlightedLetter; // empty string for none

  ReadingSpanState({
    this.phase = ReadingSpanPhase.showingSentence,
    this.sequence = const [],
    this.userSequence = const [],
    this.currentSequenceIndex = 0,
    this.currentSentence,
    this.currentLength = 2,
    this.score = 0,
    this.timeLeft = 80,
    this.isGameOver = false,
    this.isLoading = true,
    this.lastRoundCorrect,
    this.highlightedLetter = "",
  });

  ReadingSpanState copyWith({
    ReadingSpanPhase? phase,
    List<String>? sequence,
    List<String>? userSequence,
    int? currentSequenceIndex,
    ReadingSpanSentence? currentSentence,
    int? currentLength,
    int? score,
    int? timeLeft,
    bool? isGameOver,
    bool? isLoading,
    bool? lastRoundCorrect,
    String? highlightedLetter,
  }) {
    return ReadingSpanState(
      phase: phase ?? this.phase,
      sequence: sequence ?? this.sequence,
      userSequence: userSequence ?? this.userSequence,
      currentSequenceIndex: currentSequenceIndex ?? this.currentSequenceIndex,
      currentSentence: currentSentence ?? this.currentSentence,
      currentLength: currentLength ?? this.currentLength,
      score: score ?? this.score,
      timeLeft: timeLeft ?? this.timeLeft,
      isGameOver: isGameOver ?? this.isGameOver,
      isLoading: isLoading ?? this.isLoading,
      lastRoundCorrect: lastRoundCorrect ?? this.lastRoundCorrect,
      highlightedLetter: highlightedLetter ?? this.highlightedLetter,
    );
  }
}

@riverpod
class ReadingSpanNotifier extends _$ReadingSpanNotifier {
  final Random _random = Random();
  Timer? _gameTimer;
  Timer? _phaseTimer;

  static final List<ReadingSpanSentence> _sentences = [
    ReadingSpanSentence("The sun rises in the east.", true),
    ReadingSpanSentence("Ice is boiling hot.", false),
    ReadingSpanSentence("Fish can breathe underwater.", true),
    ReadingSpanSentence("Dogs have wings and can fly.", false),
    ReadingSpanSentence("Water freezes at 0 degrees Celsius.", true),
    ReadingSpanSentence("Cats bark like small dogs.", false),
    ReadingSpanSentence("Trees have green leaves in summer.", true),
    ReadingSpanSentence("Rain falls upwards from the ground.", false),
    ReadingSpanSentence("A triangle has four equal sides.", false),
    ReadingSpanSentence("Apples are a type of sweet fruit.", true),
    ReadingSpanSentence("The moon is made of cheddar cheese.", false),
    ReadingSpanSentence("Automobiles have wheels to roll.", true),
    ReadingSpanSentence("Fire is freezing cold.", false),
    ReadingSpanSentence("Paper is made from processed wood.", true),
    ReadingSpanSentence("Birds have feathers to help them fly.", true),
    ReadingSpanSentence("Bananas grow on pine trees.", false),
    ReadingSpanSentence("An elephant is smaller than an ant.", false),
    ReadingSpanSentence("Books contain printed pages of text.", true),
  ];

  static const List<String> _letters = [
    "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z"
  ];

  @override
  ReadingSpanState build() {
    return ReadingSpanState();
  }

  void initGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();

    state = ReadingSpanState(
      isLoading: false,
    );
    _startRound();
    _startTimer();
  }

  void _startTimer() {
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft <= 0) {
        _endGame();
      } else {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      }
    });
  }

  void _startRound() {
    _phaseTimer?.cancel();

    // Generate sequence of target letters
    List<String> seq = [];
    final pool = List<String>.from(_letters)..shuffle(_random);
    for (int i = 0; i < state.currentLength; i++) {
      seq.add(pool[i % pool.length]);
    }

    state = state.copyWith(
      phase: ReadingSpanPhase.showingSentence,
      sequence: seq,
      userSequence: [],
      currentSequenceIndex: 0,
      lastRoundCorrect: null,
    );

    _showNextSentence();
  }

  void _showNextSentence() {
    if (state.currentSequenceIndex < state.sequence.length) {
      final randomSentence = _sentences[_random.nextInt(_sentences.length)];
      state = state.copyWith(
        phase: ReadingSpanPhase.showingSentence,
        currentSentence: randomSentence,
        highlightedLetter: "",
      );
    } else {
      // Transition to recall keyboard
      state = state.copyWith(
        phase: ReadingSpanPhase.recalling,
        highlightedLetter: "",
      );
    }
  }

  void answerSentence(bool claimedTrue) {
    if (state.isGameOver || state.phase != ReadingSpanPhase.showingSentence) return;

    final isCorrect = claimedTrue == state.currentSentence!.isTrue;
    state = state.copyWith(
      score: isCorrect ? state.score + 1 : state.score,
      phase: ReadingSpanPhase.showingLetter,
      highlightedLetter: state.sequence[state.currentSequenceIndex],
    );

    // Show letter for 1.2 seconds, then show next sentence or recall
    _phaseTimer = Timer(const Duration(milliseconds: 1200), () {
      state = state.copyWith(
        currentSequenceIndex: state.currentSequenceIndex + 1,
      );
      _showNextSentence();
    });
  }

  void onLetterTapRecall(String letter) {
    if (state.isGameOver || state.phase != ReadingSpanPhase.recalling) return;

    final newUserSeq = [...state.userSequence, letter];
    state = state.copyWith(userSequence: newUserSeq);

    // Check correctness
    final targetLetter = state.sequence[newUserSeq.length - 1];
    if (letter != targetLetter) {
      _checkRoundResult(false);
    } else if (newUserSeq.length == state.sequence.length) {
      _checkRoundResult(true);
    }
  }

  void _checkRoundResult(bool correct) {
    int nextLen = state.currentLength;
    if (correct) {
      nextLen = state.currentLength + 1;
    } else {
      nextLen = state.currentLength > 2 ? state.currentLength - 1 : 2;
    }

    state = state.copyWith(
      phase: ReadingSpanPhase.result,
      score: correct ? state.score + (state.currentLength * 2) : state.score,
      lastRoundCorrect: correct,
      currentLength: nextLen,
    );

    _phaseTimer = Timer(const Duration(milliseconds: 1200), _startRound);
  }

  void _endGame() {
    _gameTimer?.cancel();
    _phaseTimer?.cancel();
    state = state.copyWith(isGameOver: true);
  }
}
