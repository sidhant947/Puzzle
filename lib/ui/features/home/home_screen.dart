import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../widgets/super_streak_action.dart';
import '../games/sudoku/sudoku_screen.dart';
import '../games/find_word/find_word_screen.dart';
import '../games/crossword/crossword_screen.dart';
import '../games/word_search/word_search_screen.dart';
import '../games/game_2048/game_2048_screen.dart';
import '../games/crown/crown_screen.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  CustomPageRoute({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Map<String, dynamic>> _games = [
    {
      'title': 'Sudoku',
      'id': 'sudoku',
      'icon': Icons.grid_4x4_rounded,
      'screen': const SudokuScreen(),
    },
    {
      'title': 'Find Word',
      'id': 'find_word',
      'icon': Icons.abc_rounded,
      'screen': const FindWordScreen(),
    },
    {
      'title': 'Crossword',
      'id': 'crossword',
      'icon': Icons.grid_on_rounded,
      'screen': const CrosswordScreen(),
    },
    {
      'title': 'Word Search',
      'id': 'word_search',
      'icon': Icons.search_rounded,
      'screen': const WordSearchScreen(),
    },
    {
      'title': '2048',
      'id': 'game_2048',
      'icon': Icons.grid_view_rounded,
      'screen': const Game2048Screen(),
    },
    {
      'title': 'Crown',
      'id': 'crown',
      'icon': Icons.workspace_premium_rounded,
      'screen': const CrownScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final streaks = ref.watch(gameStreakNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAMES'),
        centerTitle: true,
        actions: const [
          SuperStreakAction(),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _games.length,
          itemBuilder: (context, index) {
            final game = _games[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildGameCard(
                context,
                game['title'],
                game['id'],
                game['icon'],
                streaks[game['id']],
                () => Navigator.push(
                  context,
                  CustomPageRoute(page: game['screen']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context,
    String title,
    String gameId,
    IconData icon,
    GameStreak? streak,
    VoidCallback onTap,
  ) {
    final streakCount = streak?.currentStreak ?? 0;
    final isSolved = streak?.solvedToday ?? false;
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: theme.colorScheme.primary,
        ),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text('$streakCount DAY STREAK', style: theme.textTheme.bodySmall?.copyWith(fontSize: 10, fontWeight: FontWeight.w900)),
        trailing: isSolved 
            ? Icon(Icons.check, color: theme.colorScheme.primary) 
            : const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
