import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/user_providers.dart';
import '../../../../data/models/user_data.dart';
import '../../../../data/models/game_streak.dart';
import '../games/sudoku/sudoku_screen.dart';
import '../games/minesweeper/minesweeper_screen.dart';
import '../games/oneline/oneline_screen.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  CustomPageRoute({required Widget page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 450),
          reverseTransitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            return FadeTransition(
              opacity: curvedAnimation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.03),
                  end: Offset.zero,
                ).animate(curvedAnimation),
                child: child,
              ),
            );
          },
        );
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _cardsController;
  late Animation<double> _headerFadeAnimation;
  late Animation<Offset> _headerSlideAnimation;
  late Animation<double> _cardsFadeAnimation;
  late Animation<Offset> _cardsSlideAnimation;

  final List<Map<String, dynamic>> _games = [
    {
      'title': 'Sudoku',
      'id': 'sudoku',
      'icon': Icons.grid_4x4_rounded,
      'screen': const SudokuScreen(),
    },
    {
      'title': 'Minesweeper',
      'id': 'minesweeper',
      'icon': Icons.dangerous_rounded,
      'screen': const MinesweeperScreen(),
    },
    {
      'title': 'Oneline',
      'id': 'oneline',
      'icon': Icons.gesture_rounded,
      'screen': const OnelineScreen(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _cardsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _headerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerController, curve: Curves.easeOutCubic),
    );
    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _headerController, curve: Curves.easeOutCubic));

    _cardsFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _cardsController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      ),
    );
    _cardsSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _cardsController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
    ));

    _headerController.forward();
    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) _cardsController.forward();
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataNotifierProvider);
    final streaks = ref.watch(gameStreakNotifierProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameStreakNotifierProvider.notifier).resetDailyStatus();
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8F9FA),
              Color(0xFFEEF1F5),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _headerController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _headerFadeAnimation.value,
                    child: SlideTransition(
                      position: _headerSlideAnimation,
                      child: child,
                    ),
                  );
                },
                child: _buildUserStats(userData, ref),
              ),
              _buildDailyProgress(streaks),
              Expanded(
                child: AnimatedBuilder(
                  animation: _cardsController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _cardsFadeAnimation.value,
                      child: SlideTransition(
                        position: _cardsSlideAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: _buildGameGrid(context, streaks),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyProgress(Map<String, GameStreak> streaks) {
    final solvedCount = streaks.values.where((s) => s.solvedToday).length;
    final totalGames = _games.length;
    final progress = solvedCount / totalGames;

    const primary = Color(0xFF5B7DB1);
    const textPrimary = Color(0xFF2D3748);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primary.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              solvedCount == totalGames ? Icons.workspace_premium_rounded : Icons.today_rounded,
              color: primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  solvedCount == totalGames ? 'All Daily Puzzles Solved!' : 'Daily Progress',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      solvedCount == totalGames ? const Color(0xFF81B29A) : primary,
                    ),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '$solvedCount/$totalGames',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserStats(UserData userData, WidgetRef ref) {
    final notifier = ref.read(userDataNotifierProvider.notifier);
    final currentLevelXp = notifier.xpForLevel(userData.level);
    final nextLevelXp = notifier.xpForLevel(userData.level + 1);
    final progress = (userData.xp - currentLevelXp) / (nextLevelXp - currentLevelXp);

    const textPrimary = Color(0xFF2D3748);
    const primary = Color(0xFF5B7DB1);
    const calmGreen = Color(0xFF81B29A);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B7DB1).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level ${userData.level}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mindful Puzzler',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary.withValues(alpha: 0.5),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${userData.xp}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  Text(
                    '${nextLevelXp - userData.xp} XP to level ${userData.level + 1}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: textPrimary.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF1F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOutCubic,
                  height: 10,
                  width: MediaQuery.of(context).size.width * progress.clamp(0.0, 1.0) * 0.82,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primary, calmGreen],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameGrid(BuildContext context, Map<String, GameStreak> streaks) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 16),
            child: Text(
              'CHALLENGES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF718096),
                letterSpacing: 2.0,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: _games.length,
              itemBuilder: (context, index) {
                final game = _games[index];
                return _buildGameCard(
                  context,
                  game['title'],
                  game['id'],
                  game['icon'],
                  streaks[game['id']],
                  () => Navigator.push(
                    context,
                    CustomPageRoute(page: game['screen']),
                  ),
                );
              },
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
    GameStreak? streak,
    VoidCallback onTap,
  ) {
    final streakCount = streak?.currentStreak ?? 0;
    final isSolved = streak?.solvedToday ?? false;

    const primary = Color(0xFF5B7DB1);
    const calmGreen = Color(0xFF81B29A);
    const warmSand = Color(0xFFF4EAD5);
    const textPrimary = Color(0xFF2D3748);
    const textSecondary = Color(0xFF718096);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.95 + (0.05 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: isSolved ? calmGreen.withValues(alpha: 0.1) : Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: isSolved
                  ? calmGreen.withValues(alpha: 0.3)
                  : textPrimary.withValues(alpha: 0.06),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: (isSolved ? calmGreen : primary).withValues(alpha: isSolved ? 0.06 : 0.04),
                blurRadius: isSolved ? 20 : 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isSolved
                            ? calmGreen.withValues(alpha: 0.15)
                            : warmSand.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Icon(
                        icon,
                        size: 44,
                        color: isSolved ? calmGreen : primary,
                      ),
                    ),
                    if (isSolved)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: AnimatedScale(
                          scale: isSolved ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.elasticOut,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: calmGreen,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isSolved ? calmGreen : textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: streakCount > 0
                          ? const Color(0xFFFF9F43)
                          : textSecondary.withValues(alpha: 0.4),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$streakCount day${streakCount != 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
