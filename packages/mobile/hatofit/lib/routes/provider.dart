import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/app/app.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isGoingToLogin = state.matchedLocation == '/greeter';

      if (!isLoggedIn && !isGoingToLogin && !isDuplicate) {
        isDuplicate = true;
        return '/greeter';
      }
      if (isGoingToLogin && isGoingToLogin && !isDuplicate) {
        isDuplicate = true;
        return '/';
      }

      if (isDuplicate) {
        isDuplicate = false;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/greeter',
        name: greeter,
        builder: (context, state) => GreetScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) => HomeScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/login',
        name: login,
        builder: (context, state) => LoginScreen(key: state.pageKey),
      ),
      // ShellRoute(
      //     navigatorKey: _shellNavigator,
      //     builder: (context, state, child) =>
      //         DashboardScreen(key: state.pageKey, child: child),
      //     routes: [
      //       GoRoute(
      //           path: '/',
      //           name: home,
      //           pageBuilder: (context, state) {
      //             return NoTransitionPage(
      //                 child: HomeScreen(
      //               key: state.pageKey,
      //             ));
      //           },
      //           routes: [
      //             // GoRoute(
      //             //     parentNavigatorKey: _shellNavigator,
      //             //     path: 'productDetail/:id',
      //             //     name: productDetail,
      //             //     pageBuilder: (context, state) {
      //             //       final id = state.params['id'].toString();
      //             //       return NoTransitionPage(
      //             //           child: ProductDetailScreen(
      //             //         id: int.parse(id),
      //             //         key: state.pageKey,
      //             //       ));
      //             //     })
      //           ]),
      //     ])
    ],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
