import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  forgotPassword("/auth/forgot-password"),
  resetPassword("/auth/reset-password"),

  /// Home Page
  home("/home"),

  // Workout Page
  workout("/workout"),
  workoutDetail("/workout/detail"),

  // Activity Page
  activity("/activity"),
  activityDetail("/activity/detail"),

  // Settings Page
  settings("/settings"),
  settingsProfile("/settings/profile"),
  settingsDeviceDiscovery("/settings/device-discovery");

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => SplashScreenPage(),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.home.path,
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
  );
}
