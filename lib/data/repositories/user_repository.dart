import 'package:hive/hive.dart';
import '../models/user_data.dart';
import '../models/game_streak.dart';

class UserRepository {
  static const String userDataBoxName = 'user_data';
  static const String gameStreakBoxName = 'game_streaks';

  Future<void> init() async {
    final userBox = await Hive.openBox<UserData>(userDataBoxName);
    final streakBox = await Hive.openBox<GameStreak>(gameStreakBoxName);
    
    // Compact boxes periodically to clean up append-only log files
    await userBox.compact();
    await streakBox.compact();
  }

  UserData getUserData() {
    final box = Hive.box<UserData>(userDataBoxName);
    return box.get('current', defaultValue: UserData.initial())!;
  }

  Future<void> saveUserData(UserData data) async {
    final box = Hive.box<UserData>(userDataBoxName);
    await box.put('current', data);
  }

  List<GameStreak> getAllGameStreaks() {
    final box = Hive.box<GameStreak>(gameStreakBoxName);
    return box.values.toList();
  }

  GameStreak getGameStreak(String gameId) {
    final box = Hive.box<GameStreak>(gameStreakBoxName);
    return box.get(gameId, defaultValue: GameStreak.initial(gameId))!;
  }

  Future<void> saveGameStreak(GameStreak streak) async {
    final box = Hive.box<GameStreak>(gameStreakBoxName);
    await box.put(streak.gameId, streak);
  }

  Future<void> saveAllGameStreaks(List<GameStreak> streaks) async {
    final box = Hive.box<GameStreak>(gameStreakBoxName);
    final Map<String, GameStreak> streakMap = {
      for (var s in streaks) s.gameId: s
    };
    await box.putAll(streakMap);
  }
}
