import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'conjunction_search_engine.dart';
import 'conjunction_search_provider.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/haptic_feedback.dart';
import '../../../core/juice/game_scaffold.dart';
import 'package:puzzle/l10n/app_localizations.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, size.height * 0.05);
    path.lineTo(size.width * 0.95, size.height * 0.95);
    path.lineTo(size.width * 0.05, size.height * 0.95);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ConjunctionSearchScreen extends ConsumerWidget {
  const ConjunctionSearchScreen({super.key});

  Color _getColor(ColorType colorType) {
    switch (colorType) {
      case ColorType.red:
        return DesignSystem.error;
      case ColorType.blue:
        return DesignSystem.gameBlue;
      case ColorType.green:
        return DesignSystem.gameGreen;
      case ColorType.amber:
        return DesignSystem.gameAmber;
    }
  }

  String _getColorLabel(ColorType colorType, AppLocalizations l10n) {
    switch (colorType) {
      case ColorType.red:
        return l10n.colorRedLabel;
      case ColorType.blue:
        return l10n.colorBlueLabel;
      case ColorType.green:
        return l10n.colorGreenLabel;
      case ColorType.amber:
        return l10n.colorAmberLabel;
    }
  }

  String _getShapeLabel(ShapeType shapeType, AppLocalizations l10n) {
    switch (shapeType) {
      case ShapeType.circle:
        return l10n.shapeCircle;
      case ShapeType.square:
        return l10n.shapeSquare;
      case ShapeType.triangle:
        return l10n.shapeTriangle;
      case ShapeType.star:
        return l10n.shapeStar;
    }
  }

  Widget _buildShape(ShapeType shapeType, Color color, double size) {
    switch (shapeType) {
      case ShapeType.circle:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        );
      case ShapeType.square:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DesignSystem.radiusXS),
            color: color,
          ),
        );
      case ShapeType.triangle:
        return SizedBox(
          width: size,
          height: size,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(color: color),
          ),
        );
      case ShapeType.star:
        return Icon(
          Icons.star_rounded,
          color: color,
          size: size * 1.2,
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(conjunctionSearchNotifierProvider);
    final notifier = ref.read(conjunctionSearchNotifierProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    ref.listen(conjunctionSearchNotifierProvider, (previous, next) {
      if (next.isCompleted && !(previous?.isCompleted ?? false)) {
        HapticFeedbackUtil.victory();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => GameCompletionDialog(
            title: l10n.conjunctionSearchWinTitle,
            message: l10n.conjunctionSearchWinMessage,
            onHome: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            onPlayAgain: () {
              notifier.reset();
              Navigator.of(context).pop();
            },
          ),
        );
      }
    });

    final targetColor = _getColor(state.target.color);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: l10n.conjunctionSearchTitle,
      subtitle: l10n.conjunctionSearchSubtitle,
      onReset: () {
        HapticFeedbackUtil.mediumImpact();
        notifier.reset();
      },
      onHowToPlay: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.howToPlay.toUpperCase()),
            content: Text(l10n.conjunctionSearchHowToPlayDescription),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.gotIt.toUpperCase()),
              ),
            ],
          ),
        );
      },
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxHeight < 550;
          return Column(
            children: [
              // Info Bar (Rounds and Scores)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceSM),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        '${l10n.conjunctionSearchRound}${state.currentRound}/${state.totalRounds}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    TangibleContainer(
                      depth: 2.0,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      radius: DesignSystem.radiusSM,
                      child: Text(
                        '${l10n.conjunctionSearchScore}${state.score}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: DesignSystem.primary),
                      ),
                    ),
                  ],
                ),
              ),

              // Instruction frame
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG, vertical: DesignSystem.spaceXS),
                child: TangibleContainer(
                  depth: 4.0,
                  radius: DesignSystem.radiusMD,
                  color: isDark ? DesignSystem.darkSurface : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.conjunctionSearchFind,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(width: DesignSystem.spaceSM),
                      _buildShape(state.target.shape, targetColor, 28),
                      const SizedBox(width: DesignSystem.spaceSM),
                      Text(
                        '${_getColorLabel(state.target.color, l10n)} ${_getShapeLabel(state.target.shape, l10n)}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: targetColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (!isSmall) const Spacer(),

              // Grid Board
              Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceLG),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: TangibleContainer(
                    color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    shadowColor: isDark ? Colors.black : DesignSystem.outline,
                    depth: 4.0,
                    radius: DesignSystem.radiusLG,
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ConjunctionSearchEngine.gridSize,
                        crossAxisSpacing: DesignSystem.spaceSM,
                        mainAxisSpacing: DesignSystem.spaceSM,
                      ),
                      itemCount: ConjunctionSearchState(
                        items: [],
                        target: state.target,
                        currentRound: 1,
                        totalRounds: 5,
                        isCompleted: false,
                        score: 0,
                        errors: 0,
                      ).copyWith(items: state.items).items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        final itemColor = _getColor(item.color);

                        return GestureDetector(
                          onTap: () {
                            if (item.isTarget) {
                              HapticFeedbackUtil.selection();
                            } else {
                              HapticFeedbackUtil.vibrate();
                            }
                            notifier.selectItem(item);
                          },
                          child: TangibleContainer(
                            depth: 2.0,
                            color: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF8FAFC),
                            shadowColor: isDark ? Colors.black : DesignSystem.outlineVariant,
                            radius: DesignSystem.radiusSM,
                            padding: const EdgeInsets.all(DesignSystem.spaceXS),
                            child: Center(
                              child: _buildShape(item.shape, itemColor, 20),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
