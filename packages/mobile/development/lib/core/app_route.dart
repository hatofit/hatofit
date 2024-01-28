import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/dependecy_injection.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  greeting("/greeting"),
  preference("/preference"),
  userInfo("/user-info"),

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
        builder: (_, __) => BlocProvider(
          create: (_) => di<SplashCubit>()..init(),
          child: const SplashView(),
        ),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.home.path,
      ),
      ShellRoute(
        builder: (_, __, child) => BlocProvider<IntroCubit>(
          create: (_) => di<IntroCubit>()..getState(),
          child: child,
        ),
        routes: [
          GoRoute(
            path: Routes.greeting.path,
            name: Routes.greeting.name,
            builder: (_, __) => const GreetingView(),
          ),
          GoRoute(
            path: Routes.preference.path,
            name: Routes.preference.name,
            builder: (_, __) => const PreferenceView(),
          ),
          GoRoute(
            path: Routes.userInfo.path,
            name: Routes.userInfo.name,
            builder: (_, __) => const UserInfoView(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginView(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => const RegisterView(),
      ),
      GoRoute(
        path: Routes.forgotPassword.path,
        name: Routes.forgotPassword.name,
        builder: (_, __) => const ForgotPasswordView(),
      ),
      GoRoute(
          path: Routes.resetPassword.path,
          name: Routes.resetPassword.name,
          builder: (_, state) {
            String email = state.extra as String;
            return ResetPasswordView(
              email: email,
            );
          }),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, __) => BlocProvider(
          create: (_) => di<HomeCubit>()..streamScan(),
          child: const HomeView(),
        ),
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
  );
}
