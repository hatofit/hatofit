import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({
    Key? key,
    required this.navigationShell,
    required this.state,
  }) : super(key: key ?? const Key("BottomNavigationView"));

  final StatefulNavigationShell navigationShell;
  final GoRouterState state;

  static const routes = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(
        Icons.home,
        size: 28,
      ),
      selectedIcon: Icon(
        Icons.home,
        size: 28,
        color: Palette.primary,
      ),
      label: "Home",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.work,
        size: 28,
      ),
      selectedIcon: Icon(
        Icons.work,
        size: 28,
        color: Palette.primary,
      ),
      label: "Workout",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.directions_run,
        size: 28,
      ),
      selectedIcon: Icon(
        Icons.directions_run,
        size: 28,
        color: Palette.primary,
      ),
      label: "Activity",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.settings,
        size: 28,
      ),
      selectedIcon: Icon(
        Icons.settings,
        size: 28,
        color: Palette.primary,
      ),
      label: "Settings",
    ),
  ];

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  bool get isRootBar {
    final split = state.uri.toString().split("/");
    log?.e(split);
    if (split.length >= 3) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    log?.e(state.uri);
    return Parent(
      bottomNavigation: isRootBar
          ? NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              destinations: routes,
              onDestinationSelected: _goBranch,
            )
          : null,
      child: navigationShell,
    );
  }
}
