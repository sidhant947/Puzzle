import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/user_data.dart';
import '../../../../data/models/game_streak.dart';
import '../games/sudoku/sudoku_screen.dart';
import '../games/find_word/find_word_screen.dart';
import '../games/crossword/crossword_screen.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataNotifierProvider);
    final streaks = ref.watch(gameStreakNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Games'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildUserStats(userData, ref),
            _buildDailyProgress(streaks),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'GAMES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }

  Widget _buildDailyProgress(Map<String, GameStreak> streaks) {
    final solvedCount = streaks.values.where((s) => s.solvedToday).length;
    final totalGames = _games.length;
    final progress = totalGames > 0 ? solvedCount / totalGames : 0.0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              solvedCount == totalGames ? Icons.check_circle : Icons.timer,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Progress',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Text('$solvedCount/$totalGames'),
          ],
        ),
      ),
    );
  }

  Widget _buildUserStats(UserData userData, WidgetRef ref) {
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(userData.level);
    final nextLevelXp = notifier.xpForLevel(userData.level + 1);
    final progress = (userData.xp - currentLevelXp) / (nextLevelXp - currentLevelXp);

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Level ${userData.level}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '${userData.xp} XP',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: progress.clamp(0.0, 1.0)),
          ],
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

    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          size: 32,
          color: isSolved ? Colors.green : Theme.of(context).primaryColor,
        ),
        title: Text(title),
        subtitle: Text('$streakCount day streak'),
        trailing: isSolved ? const Icon(Icons.check_circle, color: Colors.green) : const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
