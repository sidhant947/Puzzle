import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'mirror_image_engine.dart';

part 'mirror_image_provider.g.dart';

class MirrorImageState {
  final MirrorImageLevel level;
  final int? selectedIndex;
  final bool isSolved;

  MirrorImageState({required this.level, this.selectedIndex, this.isSolved = false});

  MirrorImageState copyWith({int? selectedIndex, bool? isSolved}) {
    return MirrorImageState(level: this.level, selectedIndex: selectedIndex, isSolved: isSolved ?? this.isSolved);
  }
}

@riverpod
class MirrorImageNotifier extends _$MirrorImageNotifier {
  final _engine = MirrorImageEngine();

  @override
  MirrorImageState build() {
    return MirrorImageState(level: _engine.generateLevel());
  }

  void selectOption(int index) {
    if (state.isSolved) return;
    final solved = index == state.level.correctIndex;
    state = state.copyWith(selectedIndex: index, isSolved: solved);
  }

  void nextLevel() {
    state = MirrorImageState(level: _engine.generateLevel());
  }
}
