import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── System UI — transparent bars, edge-to-edge ───────────
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // NOTE: Per-theme systemOverlayStyle is set inside each ThemeData's
  // AppBarTheme, so the app bar handles light/dark status bar icons
  // automatically. We only set the nav bar here to be transparent.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  // ── Hive local storage ───────────────────────────────────
  await Hive.initFlutter();
  // Register adapters here after running build_runner:
  // Hive.registerAdapter(StreakModelAdapter());
  // Hive.registerAdapter(DailyGoalAdapter());

  runApp(
    const ProviderScope(child: AarohaApp()),
  );
}

class AarohaApp extends StatelessWidget {
  const AarohaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aaroha',
      debugShowCheckedModeBanner: false,

      // ── Light theme ──────────────────────────────────────
      theme: AarohaTheme.light,

      // ── Dark theme ───────────────────────────────────────
      darkTheme: AarohaTheme.dark,

      // ── Follows the device's system setting automatically ─
      themeMode: ThemeMode.system,

      routerConfig: appRouter,
    );
  }
}
