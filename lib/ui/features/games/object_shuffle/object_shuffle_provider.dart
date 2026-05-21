import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'object_shuffle_engine.dart';

part 'object_shuffle_provider.g.dart';

enum ObjectShufflePhase { showing, shuffling, waiting, result }

class ObjectShuffleState {
  final List<int> objectSlots; // objectSlots[i] = current slot index for object i
  final int targetObjectIndex;
  final int? swappingA; // slot index A
  final int? swappingB; // slot index B
  final ObjectShufflePhase phase;
  final int level;
  final bool isGameOver;
  final bool isWon;
  final int? selectedSlotIndex;
  final bool isLoading;

  ObjectShuffleState({
    required this.objectSlots,
    required this.targetObjectIndex,
    this.swappingA,
    this.swappingB,
    this.phase = ObjectShufflePhase.showing,
    this.level = 1,
    this.isGameOver = false,
    this.isWon = false,
    this.selectedSlotIndex,
    this.isLoading = true,
  });

  ObjectShuffleState copyWith({
    List<int>? objectSlots,
    int? targetObjectIndex,
    int? swappingA,
    int? swappingB,
    ObjectShufflePhase? phase,
    int? level,
    bool? isGameOver,
    bool? isWon,
    int? selectedSlotIndex,
    bool? isLoading,
  }) {
    return ObjectShuffleState(
      objectSlots: objectSlots ?? this.objectSlots,
      targetObjectIndex: targetObjectIndex ?? this.targetObjectIndex,
      swappingA: swappingA,
      swappingB: swappingB,
      phase: phase ?? this.phase,
      level: level ?? this.level,
      isGameOver: isGameOver ?? this.isGameOver,
      isWon: isWon ?? this.isWon,
      selectedSlotIndex: selectedSlotIndex ?? this.selectedSlotIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class ObjectShuffleNotifier extends _$ObjectShuffleNotifier {
  final _engine = ObjectShuffleEngine();
  Timer? _shuffleTimer;

  @override
  ObjectShuffleState build() {
    return ObjectShuffleState(objectSlots: List.generate(5, (i) => i), targetObjectIndex: 0);
  }

  void initGame() {
    _startRound();
  }

  void _startRound() {
    _shuffleTimer?.cancel();
    final positions = List.generate(5, (i) => i);
    final target = 0; // Always track object 0

    state = ObjectShuffleState(
      objectSlots: positions,
      targetObjectIndex: target,
      level: 1, // We keep level field but don't increment it logic-wise as requested
      phase: ObjectShufflePhase.showing,
      isLoading: false,
    );

    // Show for 2 seconds then start shuffle
    Timer(const Duration(seconds: 2), () {
      _startShuffling();
    });
  }

  void _startShuffling() {
    state = state.copyWith(phase: ObjectShufflePhase.shuffling);
    // 10 random swaps for 5 items
    final shuffles = _engine.generateShuffles(10, state.objectSlots.length);
    int currentShuffle = 0;

    void nextSwap() {
      if (currentShuffle >= shuffles.length) {
        state = state.copyWith(phase: ObjectShufflePhase.waiting, swappingA: null, swappingB: null);
        return;
      }

      final pair = shuffles[currentShuffle]; // pair of slot indexes to swap
      
      // Find which objects are currently in these slots
      int objA = state.objectSlots.indexOf(pair[0]);
      int objB = state.objectSlots.indexOf(pair[1]);

      state = state.copyWith(swappingA: pair[0], swappingB: pair[1]);

      _shuffleTimer = Timer(const Duration(milliseconds: 350), () {
        final newSlots = List<int>.from(state.objectSlots);
        newSlots[objA] = pair[1];
        newSlots[objB] = pair[0];

        state = state.copyWith(objectSlots: newSlots, swappingA: null, swappingB: null);
        currentShuffle++;
        
        _shuffleTimer = Timer(const Duration(milliseconds: 100), nextSwap);
      });
    }

    nextSwap();
  }

  void onShellTap(int slotIndex) {
    if (state.phase != ObjectShufflePhase.waiting || state.isGameOver) return;

    final objectAtSlot = state.objectSlots.indexOf(slotIndex);
    if (objectAtSlot == state.targetObjectIndex) {
      // Correct! Instant Win for this round
      state = state.copyWith(phase: ObjectShufflePhase.result, isGameOver: true, isWon: true, selectedSlotIndex: slotIndex);
    } else {
      // Wrong
      state = state.copyWith(isGameOver: true, isWon: false, phase: ObjectShufflePhase.result, selectedSlotIndex: slotIndex);
    }
  }
}
