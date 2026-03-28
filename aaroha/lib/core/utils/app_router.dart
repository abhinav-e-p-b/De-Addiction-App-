import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/tracker/presentation/screens/tracker_screen.dart';
import '../../features/swasthi/presentation/screens/swasthi_screen.dart';
import '../../features/shanti/presentation/screens/shanti_screen.dart';
import '../../features/ujjwal/presentation/screens/ujjwal_screen.dart';
import '../../features/sangam/presentation/screens/sangam_screen.dart';
import '../../features/hub/presentation/screens/hub_screen.dart';
import '../widgets/app_shell.dart';

/// Named route constants
class Routes {
  Routes._();
  static const String tracker  = '/tracker';
  static const String swasthi  = '/swasthi';
  static const String shanti   = '/shanti';
  static const String ujjwal   = '/ujjwal';
  static const String sangam   = '/sangam';
  static const String hub      = '/hub';
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.tracker,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.tracker,
              builder: (_, __) => const TrackerScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.swasthi,
              builder: (_, __) => const SwasthiScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.shanti,
              builder: (_, __) => const ShantiScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.ujjwal,
              builder: (_, __) => const UjjwalScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.sangam,
              builder: (_, __) => const SangamScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.hub,
              builder: (_, __) => const HubScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
