import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'cryptogram_engine.dart';

part 'cryptogram_provider.g.dart';

class CryptogramState {
  final String originalQuote;
  final String encodedQuote;
  final Map<String, String> userMapping;
  final String? selectedLetter;
  final bool isGameOver;
  final bool isGameWon;
  final bool isLoading;

  CryptogramState({
    required this.originalQuote,
    required this.encodedQuote,
    this.userMapping = const {},
    this.selectedLetter,
    this.isGameOver = false,
    this.isGameWon = false,
    this.isLoading = true,
  });

  CryptogramState copyWith({
    String? originalQuote,
    String? encodedQuote,
    Map<String, String>? userMapping,
    String? selectedLetter,
    bool? isGameOver,
    bool? isGameWon,
    bool? isLoading,
  }) {
    return CryptogramState(
      originalQuote: originalQuote ?? this.originalQuote,
      encodedQuote: encodedQuote ?? this.encodedQuote,
      userMapping: userMapping ?? this.userMapping,
      selectedLetter: selectedLetter, // Allow null
      isGameOver: isGameOver ?? this.isGameOver,
      isGameWon: isGameWon ?? this.isGameWon,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

@riverpod
class CryptogramNotifier extends _$CryptogramNotifier {
  final _engine = CryptogramEngine();

  @override
  CryptogramState build() {
    return CryptogramState(originalQuote: '', encodedQuote: '');
  }

  void initGame() {
    final puzzle = _engine.generatePuzzle();
    state = CryptogramState(
      originalQuote: puzzle['original'],
      encodedQuote: puzzle['encoded'],
      isLoading: false,
    );
  }

  void selectLetter(String letter) {
    if (state.isGameOver) return;
    state = state.copyWith(selectedLetter: letter);
  }

  void assignLetter(String realLetter) {
    if (state.isGameOver || state.selectedLetter == null) return;
    
    final newMapping = Map<String, String>.from(state.userMapping);
    
    // Remove if this real letter was assigned elsewhere
    newMapping.removeWhere((key, value) => value == realLetter);
    
    newMapping[state.selectedLetter!] = realLetter;
    
    final won = _engine.checkWin(state.originalQuote, newMapping, state.encodedQuote);
    
    state = state.copyWith(
      userMapping: newMapping,
      isGameOver: won,
      isGameWon: won,
    );
  }

  void clearAssignment() {
    if (state.isGameOver || state.selectedLetter == null) return;
    final newMapping = Map<String, String>.from(state.userMapping);
    newMapping.remove(state.selectedLetter);
    state = state.copyWith(userMapping: newMapping);
  }
}
