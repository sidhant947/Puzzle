import 'dart:math';

enum StopSignalType { go, stop }

class StopSignalTrial {
  final StopSignalType type;
  final int direction; // 0 for left, 1 for right
  final int stopSignalDelay; // ms

  StopSignalTrial({required this.type, required this.direction, required this.stopSignalDelay});
}

class StopSignalEngine {
  final Random _random = Random();

  StopSignalTrial generateTrial() {
    bool isStop = _random.nextDouble() < 0.25;
    return StopSignalTrial(
      type: isStop ? StopSignalType.stop : StopSignalType.go,
      direction: _random.nextInt(2),
      stopSignalDelay: 150 + _random.nextInt(150), // 150-300ms delay
    );
  }
}
