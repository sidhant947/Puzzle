# Architecture

## Overview

PUZZLE is a Flutter application following a layered architecture with clear separation of concerns.

## Directory Structure

```
lib/
├── main.dart                    # App entry, Hive init, ProviderScope
├── data/
│   ├── game_metadata.dart       # Typed GameMetadata class
│   ├── game_registry.dart       # Central registry (205 games)
│   ├── game_data.dart           # Deprecated wrapper
│   ├── models/
│   │   ├── user_data.dart       # Freezed model for user profile
│   │   └── game_streak.dart     # Freezed model for streaks
│   └── repositories/
│       └── user_repository.dart # Hive-backed persistence
├── providers/
│   ├── game_providers.dart      # Game filtering/sorting
│   ├── game_session_provider.dart # Current session tracking
│   ├── theme_provider.dart      # Theme persistence
│   └── user_providers.dart      # XP, levels, streaks
├── ui/
│   ├── core/juice/
│   │   └── game_scaffold.dart   # Shared game screen wrapper
│   └── features/
│       ├── home/                # Main game browser
│       │   ├── home_screen.dart
│       │   └── widgets/         # Decomposed home widgets
│       ├── stats/               # Player statistics
│       ├── settings/            # App settings
│       ├── main_shell/          # Bottom/side navigation
│       └── games/               # 205 game implementations
│           └── [game_id]/
│               ├── [game]_engine.dart    # Pure Dart logic
│               ├── [game]_provider.dart  # Riverpod state
│               ├── [game]_screen.dart    # Flutter UI
│               └── [game]_metadata.dart  # Self-contained metadata
├── utils/
│   ├── design_system.dart       # Design tokens, themes
│   ├── haptic_feedback.dart     # Haptic patterns
│   ├── navigation_utils.dart    # Custom page routes
│   ├── l10n_game_helpers.dart   # L10n game title/subtitle lookup
│   └── perf.dart                # Performance profiling
├── widgets/
│   ├── tangible.dart            # Reusable UI primitives
│   ├── game_completion_dialog.dart
│   ├── error_boundary.dart      # Global error handling
│   └── super_streak_action.dart
└── l10n/                        # 22 language translations
```

## Key Patterns

### Game Registration (Scalability)

Each game is self-contained with its own metadata:

```dart
// lib/ui/features/games/[game_id]/[game_id]_metadata.dart
final sudokuMetadata = GameMetadata(
  id: 'sudoku',
  category: 'LOGIC',
  icon: Icons.grid_4x4_rounded,
  color: DesignSystem.gameBlue,
  builder: (context) => SudokuScreen(),
  titleGetter: _title,
  subtitleGetter: _subtitle,
  popularity: Popularity.high,
);
```

To add a new game:
1. Create `[game_id]/` directory with engine, provider, screen
2. Create `[game_id]_metadata.dart`
3. Add ONE import to `game_registry.dart`

### State Management (Riverpod)

- **Pure `build()`**: No side effects in provider build methods
- **Explicit mutations**: State changes via named methods
- **keepAlive**: For persistent state (UserData, GameStreaks)
- **AutoDispose**: For ephemeral state (filtered games)

### Data Flow

```
User Action → Provider Method → Repository → Hive Box
                ↓
            State Update → UI Rebuild
```

### Game Engine Pattern

Each game separates logic from UI:

- `*_engine.dart`: Pure Dart, no Flutter imports, testable
- `*_provider.dart`: Riverpod notifier wrapping engine
- `*_screen.dart`: ConsumerStatefulWidget using GameScaffold

## Design System

- **Typography**: Bebas Neue (headings), Geist (body)
- **Colors**: 12 game accents + primary/secondary
- **Spacing**: 6px grid (XS/SM/MD/LG/XL)
- **Responsive**: Mobile (<600), Tablet (600-1024), Desktop (>1024)

## Testing

- Unit tests for game engines (pure Dart logic)
- Model validation tests
- Test helpers for ProviderScope mocking
