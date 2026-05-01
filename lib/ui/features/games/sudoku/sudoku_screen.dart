import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sudoku_provider.dart';
import '../../../../../providers/user_providers.dart';

class SudokuScreen extends ConsumerStatefulWidget {
  const SudokuScreen({super.key});

  @override
  ConsumerState<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends ConsumerState<SudokuScreen>
    with TickerProviderStateMixin {
  late AnimationController _gridController;
  late AnimationController _numbersController;
  late Animation<double> _gridFadeAnimation;
  late Animation<double> _numbersFadeAnimation;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _numbersController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _gridFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gridController, curve: Curves.easeOutCubic),
    );
    _numbersFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _numbersController, curve: Curves.easeOutCubic),
    );

    _gridController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _numbersController.forward();
    });
  }

  @override
  void dispose() {
    _gridController.dispose();
    _numbersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sudokuNotifierProvider);
    final notifier = ref.read(sudokuNotifierProvider.notifier);

    ref.listen(sudokuNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        _showVictoryDialog(context, ref);
      }
    });

    const textPrimary = Color(0xFF2D3748);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: textPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_rounded, color: textPrimary, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Mini Sudoku',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        centerTitle: true,
      ),
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
              const SizedBox(height: 16),
              AnimatedBuilder(
                animation: _gridController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _gridFadeAnimation.value,
                    child: child,
                  );
                },
                child: _buildGrid(state, notifier),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _numbersController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _numbersFadeAnimation.value,
                    child: child,
                  );
                },
                child: _buildNumberPad(notifier),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(SudokuState state, SudokuNotifier notifier) {
    const primary = Color(0xFF5B7DB1);
    const textPrimary = Color(0xFF2D3748);
    const warmSand = Color(0xFFF4EAD5);
    const selectedColor = Color(0xFF5B7DB1);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: textPrimary.withValues(alpha: 0.08), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              children: List.generate(4, (r) {
                return Expanded(
                  child: Row(
                    children: List.generate(4, (c) {
                      final isInitial = state.initialBoard[r][c] != 0;
                      final isSelected =
                          state.selectedRow == r && state.selectedCol == c;
                      final value = state.currentBoard[r][c];

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (!isInitial) {
                              HapticFeedback.selectionClick();
                              notifier.selectCell(r, c);
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOutCubic,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? selectedColor.withValues(alpha: 0.15)
                                  : (isInitial
                                      ? warmSand.withValues(alpha: 0.5)
                                      : Colors.white),
                              border: Border(
                                right: BorderSide(
                                  color: (c == 1)
                                      ? textPrimary.withValues(alpha: 0.2)
                                      : textPrimary.withValues(alpha: 0.05),
                                  width: (c == 1) ? 2.5 : 1,
                                ),
                                bottom: BorderSide(
                                  color: (r == 1)
                                      ? textPrimary.withValues(alpha: 0.2)
                                      : textPrimary.withValues(alpha: 0.05),
                                  width: (r == 1) ? 2.5 : 1,
                                ),
                              ),
                            ),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 180),
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: Text(
                                  value == 0 ? '' : value.toString(),
                                  key: ValueKey('$r-$c-$value'),
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: isInitial
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: isInitial
                                        ? textPrimary
                                        : primary,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad(SudokuNotifier notifier) {
    const primary = Color(0xFF5B7DB1);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (i) {
          final num = i + 1;
          return _buildNumberButton(num, notifier);
        }),
      ),
    );
  }

  Widget _buildNumberButton(int num, SudokuNotifier notifier) {
    const primary = Color(0xFF5B7DB1);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 300 + (num * 50)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          notifier.setNumber(num);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutCubic,
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primary.withValues(alpha: 0.15),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: primary.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              num.toString(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    final solvedToday =
        await ref.read(gameStreakNotifierProvider.notifier).completeGame('sudoku');

    if (!context.mounted) return;

    HapticFeedback.heavyImpact();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF81B29A).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.emoji_events_rounded,
                  color: Color(0xFF81B29A),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Well Done!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You solved the puzzle!',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xFF2D3748).withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 24),
              if (solvedToday) ...[
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF81B29A).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+20 XP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF81B29A),
                    ),
                  ),
                ),
              ] else ...[
                Text(
                  'Daily puzzle already solved.',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF718096),
                  ),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B7DB1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}