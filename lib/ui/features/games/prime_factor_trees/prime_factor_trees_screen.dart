import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puzzle/l10n/app_localizations.dart';
import 'package:puzzle/providers/user_providers.dart';
import 'package:puzzle/utils/design_system.dart';
import 'package:puzzle/utils/haptic_feedback.dart';
import 'package:puzzle/utils/l10n_game_helpers.dart';
import 'package:puzzle/widgets/game_completion_dialog.dart';
import '../../../core/juice/game_scaffold.dart';

class FactorNode {
  final int index; // 1-indexed binary heap index
  final int value;
  final bool isPrime;
  bool isSolved;
  bool isVisible;

  FactorNode({
    required this.index,
    required this.value,
    required this.isPrime,
    this.isSolved = false,
    this.isVisible = false,
  });
}

class PrimeFactorTreesScreen extends ConsumerStatefulWidget {
  const PrimeFactorTreesScreen({super.key});

  @override
  ConsumerState<PrimeFactorTreesScreen> createState() => _PrimeFactorTreesScreenState();
}

class _PrimeFactorTreesScreenState extends ConsumerState<PrimeFactorTreesScreen> {
  final Random _random = Random();
  int _score = 0;
  final int _targetScore = 3;
  bool _isGameOver = false;

  late int _rootValue;
  late Map<int, FactorNode> _treeNodes;
  int? _selectedNodeIndex;
  List<int> _options = [];

  final List<Map<String, dynamic>> _puzzleTemplates = [
    {
      'root': 24,
      'nodes': {
        1: {'val': 24, 'prime': false, 'solved': true, 'visible': true},
        2: {'val': 4, 'prime': false, 'solved': false, 'visible': true},
        3: {'val': 6, 'prime': false, 'solved': false, 'visible': true},
        4: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        5: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        6: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        7: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
      }
    },
    {
      'root': 30,
      'nodes': {
        1: {'val': 30, 'prime': false, 'solved': true, 'visible': true},
        2: {'val': 5, 'prime': true, 'solved': false, 'visible': true},
        3: {'val': 6, 'prime': false, 'solved': false, 'visible': true},
        6: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        7: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
      }
    },
    {
      'root': 36,
      'nodes': {
        1: {'val': 36, 'prime': false, 'solved': true, 'visible': true},
        2: {'val': 6, 'prime': false, 'solved': false, 'visible': true},
        3: {'val': 6, 'prime': false, 'solved': false, 'visible': true},
        4: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        5: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
        6: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        7: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
      }
    },
    {
      'root': 40,
      'nodes': {
        1: {'val': 40, 'prime': false, 'solved': true, 'visible': true},
        2: {'val': 4, 'prime': false, 'solved': false, 'visible': true},
        3: {'val': 10, 'prime': false, 'solved': false, 'visible': true},
        4: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        5: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        6: {'val': 2, 'prime': true, 'solved': false, 'visible': false},
        7: {'val': 5, 'prime': true, 'solved': false, 'visible': false},
      }
    },
    {
      'root': 45,
      'nodes': {
        1: {'val': 45, 'prime': false, 'solved': true, 'visible': true},
        2: {'val': 5, 'prime': true, 'solved': false, 'visible': true},
        3: {'val': 9, 'prime': false, 'solved': false, 'visible': true},
        6: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
        7: {'val': 3, 'prime': true, 'solved': false, 'visible': false},
      }
    }
  ];

  @override
  void initState() {
    super.initState();
    _generatePuzzle();
  }

  void _generatePuzzle() {
    final template = _puzzleTemplates[_random.nextInt(_puzzleTemplates.length)];
    _rootValue = template['root'] as int;

    final nodesMap = template['nodes'] as Map<int, Map<String, dynamic>>;
    _treeNodes = {};
    nodesMap.forEach((idx, data) {
      _treeNodes[idx] = FactorNode(
        index: idx,
        value: data['val'] as int,
        isPrime: data['prime'] as bool,
        isSolved: data['solved'] as bool,
        isVisible: data['visible'] as bool,
      );
    });

    _selectedNodeIndex = null;
    _generateOptions();
  }

  void _generateOptions() {
    final Set<int> optionSet = {};
    // Add all values of unsolved visible nodes
    for (var node in _treeNodes.values) {
      if (node.isVisible && !node.isSolved) {
        optionSet.add(node.value);
      }
    }

    // Add some random numbers
    while (optionSet.length < 6) {
      optionSet.add(_random.nextInt(12) + 2);
    }

    _options = optionSet.toList()..shuffle();
  }

  void _onNodeSelect(int index) {
    final node = _treeNodes[index];
    if (node == null || node.isSolved || !node.isVisible) return;

    HapticFeedbackUtil.lightImpact();
    setState(() {
      _selectedNodeIndex = index;
    });
  }

  void _onAnswer(int value) {
    if (_isGameOver || _selectedNodeIndex == null) return;

    final targetNode = _treeNodes[_selectedNodeIndex!];
    if (targetNode == null) return;

    if (targetNode.value == value) {
      HapticFeedbackUtil.success();
      setState(() {
        targetNode.isSolved = true;
        _selectedNodeIndex = null;

        // Reveal children of this node if it is solved and not prime
        if (!targetNode.isPrime) {
          final leftChild = _treeNodes[targetNode.index * 2];
          final rightChild = _treeNodes[targetNode.index * 2 + 1];
          if (leftChild != null) leftChild.isVisible = true;
          if (rightChild != null) rightChild.isVisible = true;
        }

        _generateOptions();

        // Check if all visible nodes are solved
        bool allSolved = _treeNodes.values.where((n) => n.isVisible).every((n) => n.isSolved);
        if (allSolved) {
          _score++;
          if (_score >= _targetScore) {
            _isGameOver = true;
            _onGameComplete();
          } else {
            _generatePuzzle();
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
            _generatePuzzle();
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
              _generatePuzzle();
            });
          },
        ),
      ],
      body: Column(
        children: [
          // Score header
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceMD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Decompose: $_rootValue',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
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
          // Tree display area
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: CustomPaint(
                  painter: TreeConnectorPainter(_treeNodes),
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
          // Input Panel
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
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    final val = _options[index];
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
        final node = _treeNodes[idx];
        if (node == null || !node.isVisible) {
          return const SizedBox(width: 60, height: 60);
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

    // Draw lines between parents and visible children
    // Row 1 to Row 2: 1 -> 2, 1 -> 3
    _drawLineIfVisible(canvas, paint, 1, 2, size, 1, 2);
    _drawLineIfVisible(canvas, paint, 1, 3, size, 1, 2);

    // Row 2 to Row 3: 2 -> 4, 2 -> 5, 3 -> 6, 3 -> 7
    _drawLineIfVisible(canvas, paint, 2, 4, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 2, 5, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 3, 6, size, 2, 3);
    _drawLineIfVisible(canvas, paint, 3, 7, size, 2, 3);
  }

  void _drawLineIfVisible(Canvas canvas, Paint paint, int parentIdx, int childIdx, Size size, int parentRow, int childRow) {
    final parent = nodes[parentIdx];
    final child = nodes[childIdx];
    if (parent == null || child == null || !parent.isVisible || !child.isVisible) return;

    // Estimate coordinates based on row and structure
    // Row 1 (index 1): Center x
    // Row 2 (indices 2, 3): Left half center x, Right half center x
    // Row 3 (indices 4,5,6,7): Four parts of x
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
    if (row == 1) return 32.5; // Half of 65 node height
    if (row == 2) return 137.5; // 65 + 40 spacing + 32.5
    if (row == 3) return 242.5; // 65 + 40 + 65 + 40 + 32.5
    return 0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
