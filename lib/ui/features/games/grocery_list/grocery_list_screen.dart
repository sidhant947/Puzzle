import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../providers/user_providers.dart';
import '../../../../../utils/design_system.dart';
import '../../../../../utils/haptic_feedback.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../core/juice/game_scaffold.dart';
import 'grocery_list_provider.dart';

class GroceryListScreen extends ConsumerStatefulWidget {
  const GroceryListScreen({super.key});

  @override
  ConsumerState<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends ConsumerState<GroceryListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(groceryListNotifierProvider.notifier).initGame();
    });
  }

  void _showGameOverDialog(int score) {
    final l10n = AppLocalizations.of(context)!;
    bool won = score >= 50;
    if (won) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('grocery_list');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: won ? 'GROCERY GURU!' : 'FORGOT SOMETHING?',
        message: 'You scored $score points in Grocery List!',
        isVictory: won,
        onPlayAgain: () {
          ref.read(groceryListNotifierProvider.notifier).initGame();
          Navigator.pop(context);
        },
        onHome: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(groceryListNotifierProvider);
    final notifier = ref.read(groceryListNotifierProvider.notifier);

    ref.listen(groceryListNotifierProvider, (previous, next) {
      if (next.isGameOver && !(previous?.isGameOver ?? false)) {
        HapticFeedbackUtil.vibrate();
        _showGameOverDialog(next.score);
      }
    });

    if (state.isLoading) {
      return GameScaffold(title: l10n.groceryListTitle.toUpperCase(), body: Center(child: CircularProgressIndicator()));
    }

    return GameScaffold(
      title: 'GROCERY LIST',
      subtitle: state.phase == GroceryListPhase.memorizing 
          ? 'Memorize the items and their categories' 
          : 'Which category did this item belong to?',
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(DesignSystem.spaceLG),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStat('SCORE', '${state.score}', DesignSystem.primary),
                _buildStat('TRIAL', '${state.trial}/10', DesignSystem.accentBerry),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: state.phase == GroceryListPhase.memorizing 
                  ? _buildMemorizationList(context, state, notifier)
                  : _buildTestingZone(context, state, notifier),
            ),
          ),
          const SizedBox(height: DesignSystem.space2XL),
        ],
      ),
    );
  }

  Widget _buildMemorizationList(BuildContext context, GroceryListState state, GroceryListNotifier notifier) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceXL),
          padding: const EdgeInsets.all(DesignSystem.spaceXL),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusLG),
            border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.5).withValues(alpha: 0.2), width: 2),
          ),
          child: Column(
            children: state.list.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['item']!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  Text(item['category']!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7))),
                ],
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: DesignSystem.space2XL),
        TangibleButton(
          onTap: () {
            HapticFeedbackUtil.lightImpact();
            notifier.startTesting();
          },
          color: DesignSystem.primary,
          shadowColor: DesignSystem.primaryShadow,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: const Text('I\'M READY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        ),
      ],
    );
  }

  Widget _buildTestingZone(BuildContext context, GroceryListState state, GroceryListNotifier notifier) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spaceLG),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(height: DesignSystem.spaceMD),
              Text(
                'WHERE DOES THIS BELONG?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                  letterSpacing: 1.0,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: DesignSystem.spaceLG),
              // Test Item Card - Constrained to prevent overflow
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight * 0.25),
                child: TangibleContainer(
                  depth: 4.0,
                  radius: DesignSystem.radiusLG,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  color: Colors.white,
                  shadowColor: Theme.of(context).colorScheme.outline,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        state.testItem!['item']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: DesignSystem.primary,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Grid of Options
              Wrap(
                spacing: DesignSystem.spaceMD,
                runSpacing: DesignSystem.spaceMD,
                alignment: WrapAlignment.center,
                children: state.categoryOptions.map((cat) {
                  // Calculate width for 2 columns with spacing
                  final itemWidth = (constraints.maxWidth - DesignSystem.spaceMD) / 2;
                  return SizedBox(
                    width: itemWidth,
                    child: TangibleButton(
                      onTap: () {
                        HapticFeedbackUtil.lightImpact();
                        notifier.onCategorySelect(cat);
                      },
                      color: DesignSystem.primary,
                      shadowColor: DesignSystem.primaryShadow,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            cat,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return TangibleContainer(
      depth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }
}
