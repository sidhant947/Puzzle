import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'lights_out_engine.dart';
import '../../../../providers/user_providers.dart';

part 'lights_out_provider.g.dart';

@riverpod
class LightsOutNotifier extends _$LightsOutNotifier {
  final LightsOutEngine _engine = LightsOutEngine();

  @override
  List<List<bool>> build() {
    return _engine.generateLevel();
  }

  void toggle(int r, int c) {
    final newState = [for (var row in state) [...row]];
    _engine.toggle(newState, r, c);
    state = newState;

    if (_engine.isSolved(state)) {
      ref.read(gameStreakNotifierProvider.notifier).completeGame('lights_out', xpAmount: 25);
    }
  }

  void reset() {
    state = _engine.generateLevel();
  }
}
