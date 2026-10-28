import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';
import 'prime_factor_trees_engine.dart';

class PrimeFactorTreesScreen extends ConsumerStatefulWidget {
  const PrimeFactorTreesScreen({super.key});

  @override
  ConsumerState<PrimeFactorTreesScreen> createState() => _PrimeFactorTreesScreenState();
}

class _PrimeFactorTreesScreenState extends ConsumerState<PrimeFactorTreesScreen> {
  final PrimeFactorTreesEngine _engine = PrimeFactorTreesEngine();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;
  int? _selectedNodeIndex;

  @override
  void initState() {
    super.initState();
    _engine.generatePuzzle();
  }

  void _onNodeSelect(int index) {
    final node = _engine.treeNodes[index];
    if (node == null || node.isSolved || !node.isVisible) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedNodeIndex = index;
    });
  }

  void _onAnswer(int value) {
    if (_isGameOver || _selectedNodeIndex == null) return;

    final success = _engine.submitAnswer(_selectedNodeIndex!, value);
    if (success) {
      HapticFeedbackUtil.success();
      setState(() {
        _selectedNodeIndex = null;
        if (_engine.isSolved()) {
          _score++;
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            _engine.generatePuzzle();
          }
        }
      });
    } else {
      HapticFeedbackUtil.error();
    }
  }

  void _onGameComplete() async {
    HapticFeedbackUtil.victory();
    await ref.read(gameStreakNotifierProvider.notifier).completeGame('prime_factor_trees');
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
          Navigator.of(context).pop();
          setState(() {
            _score = 0;
            _isGameOver = false;
            _selectedNodeIndex = null;
            _engine.generatePuzzle();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GameScaffold(
      title: L10nGameHelpers.getGameTitle(context, 'prime_factor_trees'),
      subtitle: L10nGameHelpers.getGameSubtitle(context, 'prime_factor_trees'),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          onPressed: () {
            HapticFeedbackUtil.lightImpact();
            setState(() {
              _score = 0;
              _isGameOver = false;
              _selectedNodeIndex = null;
              _engine.generatePuzzle();
            });
          },
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Decompose: ${_engine.rootValue}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: DesignSystem.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSM),
                  ),
                  child: Text(
                    'Score: $_score / $_targetScore',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DesignSystem.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: CustomPaint(
                  painter: TreeConnectorPainter(_engine.treeNodes),
                  child: Container(
                    padding: const EdgeInsets.all(DesignSystem.spaceMD),
                    child: Column(
                      children: [
                        _buildNodeRow([1]),
                        const SizedBox(height: 40),
                        _buildNodeRow([2, 3]),
                        const SizedBox(height: 40),
                        _buildNodeRow([4, 5, 6, 7]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            decoration: BoxDecoration(
              color: isDark ? DesignSystem.darkSurface : DesignSystem.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(DesignSystem.radiusLG)),
              border: Border(
                top: BorderSide(color: isDark ? DesignSystem.darkOutline : DesignSystem.outline, width: 1.5),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _selectedNodeIndex == null
                      ? 'Select a blank node above to fill it'
                      : 'Choose the correct factor for the selected node:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: _engine.options.length,
                  itemBuilder: (context, index) {
                    final val = _engine.options[index];
                    return ElevatedButton(
                      onPressed: _selectedNodeIndex == null ? null : () => _onAnswer(val),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DesignSystem.primary,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(DesignSystem.radiusMD),
                        ),
                      ),
                      child: Text(
                        '$val',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNodeRow(List<int> indices) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: indices.map((idx) {
        final node = _engine.treeNodes[idx];
        if (node == null || !node.isVisible) {
          return const SizedBox(width: 65, height: 65);
        }

        final isSelected = _selectedNodeIndex == idx;
        final color = node.isSolved
            ? (node.isPrime ? DesignSystem.gameGreen : DesignSystem.gameBlue)
            : (isSelected ? DesignSystem.gameOrange : Colors.grey);

        return GestureDetector(
          onTap: () => _onNodeSelect(idx),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: color.withValues(alpha: isSelected ? 0.25 : 0.15),
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: isSelected ? 3.0 : 2.0,
              ),
              boxShadow: isSelected
                  ? [BoxShadow(color: DesignSystem.gameOrange.withValues(alpha: 0.3), blurRadius: 8, spreadRadius: 1)]
                  : null,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  node.isSolved ? '${node.value}' : '?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: node.isSolved
                        ? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87)
                        : color,
                  ),
                ),
                if (node.isSolved && node.isPrime)
                  const Text(
                    'PRIME',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: DesignSystem.gameGreen),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class TreeConnectorPainter extends CustomPainter {
  final Map<int, FactorNode> nodes;
  TreeConnectorPainter(this.nodes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.4)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    _drawLineIfVisible(canvas, paint, 1, 2, size, 1, 2);
    _drawLineIfVisible(canvas, paint, 1, 3, size, 1, 2);

    _drawLineIfVisible(canvas, paint, 2, 4, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 2, 5, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 3, 6, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 3, 7, size, 2, 3);
  }

  void _drawLineIfVisible(Canvas canvas, Paint paint, int parentIdx, int childIdx, Size size, int parentRow, int childRow) {
    final parent = nodes[parentIdx];
    final child = nodes[childIdx];
    if (parent == null || child == null || !parent.isVisible || !child.isVisible) return;

    double px = _getXOffset(parentIdx, size.width);
    double py = _getYOffset(parentRow);
    double cx = _getXOffset(childIdx, size.width);
    double cy = _getYOffset(childRow);

    canvas.drawLine(Offset(px, py), Offset(cx, cy), paint);
  }

  double _getXOffset(int idx, double width) {
    if (idx == 1) return width / 2;
    if (idx == 2) return width * 0.25;
    if (idx == 3) return width * 0.75;
    if (idx == 4) return width * 0.125;
    if (idx == 5) return width * 0.375;
    if (idx == 6) return width * 0.625;
    if (idx == 7) return width * 0.875;
    return width / 2;
  }

  double _getYOffset(int row) {
    if (row == 1) return 32.5;
    if (row == 2) return 137.5;
    if (row == 3) return 242.5;
    return 0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
