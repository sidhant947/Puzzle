import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/user_data.dart';
import 'data/models/game_streak.dart';
import 'data/repositories/user_repository.dart';
import 'providers/user_providers.dart';
import 'ui/features/main_shell/main_shell.dart';
import 'utils/design_system.dart';
import 'widgets/error_boundary.dart';

void main() async {
  final stopwatch = Stopwatch()..start();

  WidgetsFlutterBinding.ensureInitialized();

  // Performance monitoring
  if (kDebugMode) {
    FlutterError.onError = (details) {
      debugPrint('Flutter Error: ${details.exception}');
      debugPrint('Stack: ${details.stack}');
    };
  }

  await Hive.initFlutter();

  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(GameStreakAdapter());

  final userRepository = UserRepository();
  await userRepository.init();

  // Log app startup time
  stopwatch.stop();
  debugPrint('App startup time: ${stopwatch.elapsedMilliseconds}ms');

  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(userRepository),
      ],
      child: const ErrorBoundary(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle Games',
      debugShowCheckedModeBanner: false,
      theme: DesignSystem.lightTheme,
      darkTheme: DesignSystem.darkTheme,
      themeMode: ThemeMode.system,
      home: const MainShell(),
    );
  }
}
