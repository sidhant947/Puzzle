import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/game_streak.dart';
import '../../../../widgets/super_streak_action.dart';
import '../../../../utils/design_system.dart';
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
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutExpo,
              reverseCurve: Curves.easeInExpo,
            );
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: child,
            );
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
      'color': DesignSystem.gameBlue,
      'screen': const SudokuScreen(),
    },
    {
      'title': 'Find Word',
      'id': 'find_word',
      'icon': Icons.abc_rounded,
      'color': DesignSystem.gameGreen,
      'screen': const FindWordScreen(),
    },
    {
      'title': 'Crossword',
      'id': 'crossword',
      'icon': Icons.grid_on_rounded,
      'color': DesignSystem.gamePurple,
      'screen': const CrosswordScreen(),
    },
    {
      'title': 'Word Search',
      'id': 'word_search',
      'icon': Icons.search_rounded,
      'color': DesignSystem.gameOrange,
      'screen': const WordSearchScreen(),
    },
    {
      'title': '2048',
      'id': 'game_2048',
      'icon': Icons.grid_view_rounded,
      'color': DesignSystem.gamePink,
      'screen': const Game2048Screen(),
    },
    {
      'title': 'Crown',
      'id': 'crown',
      'icon': Icons.workspace_premium_rounded,
      'color': DesignSystem.gameTeal,
      'screen': const CrownScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final streaks = ref.watch(gameStreakNotifierProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'GAMES',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
            actions: const [
              SuperStreakAction(),
              SizedBox(width: 8),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final game = _games[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildGameCard(
                      context,
                      game['title'],
                      game['id'],
                      game['icon'],
                      game['color'],
                      streaks[game['id']],
                      isDark,
                      () => Navigator.push(
                        context,
                        CustomPageRoute(page: game['screen']),
                      ),
                    ),
                  );
                },
                childCount: _games.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(
    BuildContext context,
    String title,
    String gameId,
    IconData icon,
    Color accentColor,
    GameStreak? streak,
    bool isDark,
    VoidCallback onTap,
  ) {
    final streakCount = streak?.currentStreak ?? 0;
    final isSolved = streak?.solvedToday ?? false;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutExpo,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusXL),
          border: Border.all(
            color: isDark ? theme.colorScheme.outline.withValues(alpha: 0.3) : theme.colorScheme.outline,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: isDark ? 0.15 : 0.08),
                borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
              ),
              child: Icon(
                icon,
                size: 28,
                color: accentColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.4,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (streakCount > 0) ...[
                        Icon(
                          Icons.local_fire_department_rounded,
                          size: 14,
                          color: DesignSystem.gameOrange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$streakCount',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        streakCount > 0 ? 'DAY STREAK' : 'PLAY NOW',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: theme.colorScheme.onSurface.withValues(alpha: streakCount > 0 ? 0.6 : 0.4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSolved
                    ? accentColor.withValues(alpha: isDark ? 0.2 : 0.1)
                    : theme.colorScheme.onSurface.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSolved ? Icons.check_rounded : Icons.arrow_forward_rounded,
                size: 18,
                color: isSolved ? accentColor : theme.colorScheme.onSurface.withValues(alpha: 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}