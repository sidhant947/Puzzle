import 'package:puzzle/utils/l10n_game_helpers.dart';
import "package:puzzle/l10n/app_localizations.dart";

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/ui/features/games/crown/crown_provider.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../../providers/user_providers.dart';
import '../../../core/juice/game_scaffold.dart';

class CrownScreen extends ConsumerStatefulWidget {
  const CrownScreen({super.key});

  @override
  ConsumerState<CrownScreen> createState() => _CrownScreenState();
}

class _CrownScreenState extends ConsumerState<CrownScreen> {
  final List<Color> _regionColors = [
    const Color(0xFFF87171), // Red 400
    const Color(0xFF60A5FA), // Blue 400
    const Color(0xFF34D399), // Emerald 400
    const Color(0xFFFBBF24), // Amber 400
    const Color(0xFFC084FC), // Purple 400
    const Color(0xFFFB923C), // Orange 400
    const Color(0xFF2DD4BF), // Teal 400
    const Color(0xFFF472B6), // Pink 400
    const Color(0xFF818CF8), // Indigo 400
  ];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(crownNotifierProvider.notifier).initGame());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final state = ref.watch(crownNotifierProvider);
    final notifier = ref.read(crownNotifierProvider.notifier);

    ref.listen(crownNotifierProvider, (previous, next) {
      if (next.isSolved && !(previous?.isSolved ?? false)) {
        HapticFeedbackUtil.victory();
        _showVictoryDialog(context, ref);
      }
    });

    return GameScaffold(
      title: l10n.crownTitle.toUpperCase(),
      subtitle: l10n.crownSubtitle,
      actions: [
        TangibleButton(
          color: colorScheme.surface,
          shadowColor: colorScheme.outline,
          onTap: () {
            HapticFeedbackUtil.mediumImpact();
            notifier.initGame();
          },
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.refresh_rounded, size: 20, color: colorScheme.onSurface),
        ),
      ],
      body: state.board == null
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    const Spacer(),
                    _buildGrid(state, notifier, constraints.maxHeight * 0.5),
                    const Spacer(flex: 2),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildGrid(CrownState state, CrownNotifier notifier, double maxHeight) {
    final board = state.board!;
    final marked = state.markedCells;
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2.0),
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignSystem.radiusSM - 2),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: board.size,
                  ),
                  itemCount: board.size * board.size,
                  itemBuilder: (context, index) {
                    int x = index % board.size;
                    int y = index ~/ board.size;
                    int regionId = board.regions[y][x];
                    bool hasCrown = state.crowns.any((p) => p.x == x && p.y == y);
                    bool isMarked = marked.contains(Point(x, y));

                    // Check neighbors to draw thick borders between regions
                    bool borderTop = y > 0 && board.regions[y-1][x] != regionId;
                    bool borderBottom = y < board.size - 1 && board.regions[y+1][x] != regionId;
                    bool borderLeft = x > 0 && board.regions[y][x-1] != regionId;
                    bool borderRight = x < board.size - 1 && board.regions[y][x+1] != regionId;

                    final Color regionColor = _regionColors[regionId % _regionColors.length];

                    return GestureDetector(
                      onTap: () {
                        HapticFeedbackUtil.selectionClick();
                        notifier.tapCell(x, y);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: regionColor,
                          border: Border(
                            top: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderTop ? 2.5 : 0.5),
                            bottom: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderBottom ? 2.5 : 0.5),
                            left: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderLeft ? 2.5 : 0.5),
                            right: BorderSide(color: Theme.of(context).colorScheme.onSurface, width: borderRight ? 2.5 : 0.5),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: FittedBox(
                              child: hasCrown
                                  ? const CrownIcon(size: 32)
                                  : isMarked
                                      ? Icon(
                                          Icons.close_rounded,
                                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.85),
                                          size: 26,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withValues(alpha: 0.25),
                                              offset: const Offset(0, 0.5),
                                              blurRadius: 2,
                                            ),
                                          ],
                                        )
                                      : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVictoryDialog(BuildContext context, WidgetRef ref) async {
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('crown');
    if (!context.mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: L10nGameHelpers.getGameTitle(context, 'crown'),
        message: AppLocalizations.of(context)!.crownMessage,
        onHome: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        onPlayAgain: () {
          ref.read(crownNotifierProvider.notifier).initGame();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class CrownIcon extends StatelessWidget {
  final double size;
  const CrownIcon({super.key, this.size = 28});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: CrownPainter(
          color: const Color(0xFFFBBF24), // Vibrant gold/amber
          outlineColor: const Color(0xFF78350F), // Dark amber border for clarity
        ),
      ),
    );
  }
}

class CrownPainter extends CustomPainter {
  final Color color;
  final Color outlineColor;

  CrownPainter({required this.color, required this.outlineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Add shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.35)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    final path = Path();
    double w = size.width;
    double h = size.height;

    // Shift down slightly for peaks space
    double topOffset = h * 0.1;

    // Draw crown path
    path.moveTo(w * 0.15, h * 0.8 - topOffset);
    path.lineTo(w * 0.85, h * 0.8 - topOffset); // base line
    path.lineTo(w * 0.92, h * 0.35 - topOffset); // right side up
    path.lineTo(w * 0.7, h * 0.58 - topOffset); // right valley
    path.lineTo(w * 0.5, h * 0.22 - topOffset); // middle peak
    path.lineTo(w * 0.3, h * 0.58 - topOffset); // left valley
    path.lineTo(w * 0.08, h * 0.35 - topOffset); // left peak
    path.close();

    // Draw shadow first
    canvas.save();
    canvas.translate(0, 1.5);
    canvas.drawPath(path, shadowPaint);
    // Shadow for peaks
    canvas.drawCircle(Offset(w * 0.08, h * 0.35 - topOffset), w * 0.06, shadowPaint);
    canvas.drawCircle(Offset(w * 0.5, h * 0.22 - topOffset), w * 0.06, shadowPaint);
    canvas.drawCircle(Offset(w * 0.92, h * 0.35 - topOffset), w * 0.06, shadowPaint);
    canvas.restore();

    // Draw main fill
    canvas.drawPath(path, paint);

    // Draw borders/outlines
    final strokePaint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, strokePaint);

    // Draw little circles on the 3 peaks
    canvas.drawCircle(Offset(w * 0.08, h * 0.35 - topOffset), w * 0.06, paint);
    canvas.drawCircle(Offset(w * 0.08, h * 0.35 - topOffset), w * 0.06, strokePaint);

    canvas.drawCircle(Offset(w * 0.5, h * 0.22 - topOffset), w * 0.06, paint);
    canvas.drawCircle(Offset(w * 0.5, h * 0.22 - topOffset), w * 0.06, strokePaint);

    canvas.drawCircle(Offset(w * 0.92, h * 0.35 - topOffset), w * 0.06, paint);
    canvas.drawCircle(Offset(w * 0.92, h * 0.35 - topOffset), w * 0.06, strokePaint);

    // Draw jewel line at the bottom
    final bandPath = Path();
    bandPath.moveTo(w * 0.15, h * 0.7 - topOffset);
    bandPath.lineTo(w * 0.85, h * 0.7 - topOffset);
    canvas.drawPath(bandPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
