# Adding a New Game

This guide explains how to add a new puzzle game to PUZZLE.

## Step 1: Create Game Directory

```
lib/ui/features/games/your_game/
├── your_game_engine.dart      # Pure Dart logic
├── your_game_provider.dart    # Riverpod state management
├── your_game_screen.dart      # Flutter UI
└── your_game_metadata.dart    # Game registration
```

## Step 2: Implement the Engine

The engine contains pure Dart logic with no Flutter dependencies:

```dart
// your_game_engine.dart
import 'dart:math';

class YourGameEngine {
  // Generate a new puzzle
  YourGameState generatePuzzle() {
    // Implementation
  }
  
  // Check if the puzzle is solved
  bool isSolved(YourGameState state) {
    // Implementation
  }
  
  // Validate a move
  bool isValidMove(YourGameState state, int row, int col, int value) {
    // Implementation
  }
}
```

**Key principles:**
- No Flutter imports (no `package:flutter/`)
- Only `dart:math` for randomness
- Pure functions where possible
- Return new state objects, don't mutate

## Step 3: Create State Model

Define the game state using Freezed:

```dart
// your_game_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'your_game_state.freezed.dart';

@freezed
class YourGameState with _$YourGameState {
  const factory YourGameState({
    required List<List<int>> board,
    required bool isSolved,
    required int moves,
  }) = _YourGameState;
}
```

## Step 4: Implement the Provider

Use Riverpod with code generation:

```dart
// your_game_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'your_game_engine.dart';
import 'your_game_state.dart';

part 'your_game_provider.g.dart';

@riverpod
class YourGameNotifier extends _$YourGameNotifier {
  @override
  YourGameState build() {
    return YourGameEngine().generatePuzzle();
  }

  void makeMove(int row, int col, int value) {
    final engine = YourGameEngine();
    if (engine.isValidMove(state, row, col, value)) {
      // Update state
    }
  }

  void resetGame() {
    state = YourGameEngine().generatePuzzle();
  }
}
```

## Step 5: Build the Screen

Use `GameScaffold` and `ConsumerStatefulWidget`:

```dart
// your_game_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'your_game_provider.dart';

class YourGameScreen extends ConsumerStatefulWidget {
  const YourGameScreen({super.key});

  @override
  ConsumerState<YourGameScreen> createState() => _YourGameScreenState();
}

class _YourGameScreenState extends ConsumerState<YourGameScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(yourGameNotifierProvider);
    final notifier = ref.read(yourGameNotifierProvider.notifier);

    // Listen for win condition
    ref.listen(yourGameNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _onGameComplete();
      }
    });

    return GameScaffold(
      title: l10n.yourGameTitle.toUpperCase(),
      subtitle: l10n.yourGameSubtitle,
      actions: [
        // Reset button
      ],
      body: _buildGameBody(state, notifier),
    );
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('your_game');
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
          ref.read(yourGameNotifierProvider.notifier).resetGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
```

## Step 6: Create Metadata

Register the game with its metadata:

```dart
// your_game_metadata.dart
import 'package:flutter/material.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/data/game_metadata.dart';
import 'package:puzzle/utils/design_system.dart';
import 'your_game_screen.dart';

final yourGameMetadata = GameMetadata(
  id: 'your_game',
  category: 'LOGIC', // LOGIC, MATH, MEMORY, SPATIAL, ATTENTION, WORD
  icon: Icons.extension_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => YourGameScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.default_, // high, default_, low
);

String _title(BuildContext context) => AppLocalizations.of(context)!.yourGameTitle;
String _subtitle(BuildContext context) => AppLocalizations.of(context)!.yourGameSubtitle;
```

## Step 7: Register in Game Registry

Add ONE import to `lib/data/game_registry.dart`:

```dart
import '../ui/features/games/your_game/your_game_metadata.dart';
```

And add the metadata to the list:

```dart
final List<GameMetadata> allGamesMetadata = [
  // ... existing games
  yourGameMetadata,
];
```

## Step 8: Add Localization

Add entries to `lib/l10n/app_en.arb`:

```json
{
  "yourGameTitle": "Your Game",
  "yourGameSubtitle": "Description of your game",
  "@yourGameTitle": {
    "description": "Title of your game"
  }
}
```

## Step 9: Add Tests

Create `test/engines/your_game_engine_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:puzzle/ui/features/games/your_game/your_game_engine.dart';

void main() {
  group('YourGameEngine', () {
    late YourGameEngine engine;

    setUp(() {
      engine = YourGameEngine();
    });

    test('generates valid puzzle', () {
      final state = engine.generatePuzzle();
      expect(state, isNotNull);
    });

    test('validates moves correctly', () {
      final state = engine.generatePuzzle();
      expect(engine.isValidMove(state, 0, 0, 1), isTrue);
    });
  });
}
```

## Step 10: Run Verification

```bash
# Run tests
flutter test test/engines/your_game_engine_test.dart

# Run analyzer
flutter analyze

# Build runner for generated code
dart run build_runner build --delete-conflicting-outputs
```

## Best Practices

1. **Keep engine pure**: No Flutter dependencies in `*_engine.dart`
2. **Use Freezed**: For immutable state models
3. **Use code-gen**: For Riverpod providers (`@riverpod`)
4. **Add haptics**: Call `HapticFeedbackUtil` on user interactions
5. **Add semantics**: Include `semanticsLabel` on interactive elements
6. **Handle errors**: Use try/catch in provider methods
7. **Add tests**: Cover engine logic with unit tests
