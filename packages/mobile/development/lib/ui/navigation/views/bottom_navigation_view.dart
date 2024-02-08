import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';

class BottomNavigationView extends StatefulWidget {
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
        Icons.local_fire_department,
        size: 28,
      ),
      selectedIcon: Icon(
        Icons.local_fire_department,
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

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  void _goBranch(int index) => widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );

  bool get isRootBar {
    final split = widget.state.uri.toString().split("/");
    if (split.length >= 3) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      bottomNavigation: isRootBar
          ? NavigationBar(
              selectedIndex: widget.navigationShell.currentIndex,
              destinations: BottomNavigationView.routes,
              onDestinationSelected: _goBranch,
            )
          : null,
      child: widget.navigationShell,
    );
  }
}
