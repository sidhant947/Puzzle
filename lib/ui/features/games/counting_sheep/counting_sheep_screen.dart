import 'package:puzzle/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/juice/game_scaffold.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/game_completion_dialog.dart';
import '../../../../widgets/tangible.dart';
import '../../../../providers/user_providers.dart';
import 'counting_sheep_engine.dart';
import 'counting_sheep_provider.dart';

class CountingSheepScreen extends ConsumerStatefulWidget {
  const CountingSheepScreen({super.key});

  @override
  ConsumerState<CountingSheepScreen> createState() => _CountingSheepScreenState();
}

class _CountingSheepScreenState extends ConsumerState<CountingSheepScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showGameOverDialog(bool success, int correctCount) {
    if (success) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('counting_sheep');
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GameCompletionDialog(
        title: success ? 'WELL DONE!' : 'NOT QUITE',
        message: success 
          ? 'You counted all $correctCount sheep!' 
          : 'There were actually $correctCount sheep.',
        onPlayAgain: () {
          ref.read(countingSheepNotifierProvider.notifier).reset();
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
    final state = ref.watch(countingSheepNotifierProvider);
    final notifier = ref.read(countingSheepNotifierProvider.notifier);

    ref.listen(countingSheepNotifierProvider, (previous, next) {
      if ((next.status == CountingSheepStatus.success || next.status == CountingSheepStatus.failure) &&
          (previous?.status != CountingSheepStatus.success && previous?.status != CountingSheepStatus.failure)) {
        _showGameOverDialog(next.status == CountingSheepStatus.success, next.correctCount);
      }
    });

    return GameScaffold(
      title: l10n.countingSheepTitle.toUpperCase(),
      body: Stack(
        children: [
          if (state.status == CountingSheepStatus.idle)
            _buildDifficultySelection(l10n, notifier),
          if (state.status == CountingSheepStatus.playing)
            _buildGameField(state),
          if (state.status == CountingSheepStatus.answering)
            _buildAnswerInput(l10n, notifier),
        ],
      ),
    );
  }

  Widget _buildDifficultySelection(AppLocalizations l10n, CountingSheepNotifier notifier) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.countingSheepSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.countingSheepHowToPlay,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
            ),
            const SizedBox(height: 48),
            ...Difficulty.values.map((d) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: TangibleButton(
                  onTap: () => notifier.startGame(d),
                  color: _getDifficultyColor(d),
                  child: Text(
                    d.name.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(Difficulty d) {
    switch (d) {
      case Difficulty.easy: return DesignSystem.accentEmerald;
      case Difficulty.medium: return DesignSystem.accentAmber;
      case Difficulty.hard: return DesignSystem.accentBerry;
    }
  }

  Widget _buildGameField(CountingSheepState state) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: state.sheep.map((s) => SheepWidget(
            key: ValueKey(s.id), 
            sheep: s,
            constraints: constraints,
          )).toList(),
        );
      }
    );
  }

  Widget _buildAnswerInput(AppLocalizations l10n, CountingSheepNotifier notifier) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.countingSheepSubtitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            TangibleContainer(
              depth: 4,
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                autofocus: true,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: DesignSystem.primary),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                ),
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: TangibleButton(
                onTap: () {
                  final count = int.tryParse(_controller.text);
                  if (count != null) {
                    notifier.submitCount(count);
                    _controller.clear();
                  }
                },
                color: DesignSystem.primary,
                child: const Text(
                  'SUBMIT ANSWER',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SheepWidget extends StatefulWidget {
  final Sheep sheep;
  final BoxConstraints constraints;
  const SheepWidget({super.key, required this.sheep, required this.constraints});

  @override
  State<SheepWidget> createState() => _SheepWidgetState();
}

class _SheepWidgetState extends State<SheepWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: (widget.sheep.speed * 1000).toInt()),
      vsync: this,
    );

    _animation = Tween<double>(begin: -0.2, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    Future.delayed(Duration(milliseconds: (widget.sheep.delay * 1000).toInt()), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          left: widget.constraints.maxWidth * _animation.value,
          top: (widget.constraints.maxHeight - 100) * widget.sheep.startY + 50,
          child: const Text('🐑', style: TextStyle(fontSize: 48)),
        );
      },
    );
  }
}
