import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/history/history_page.dart';
import 'package:polar_hr_devices/pages/home/home_page.dart';
import 'package:polar_hr_devices/pages/setting/setting_page.dart';
import 'package:polar_hr_devices/pages/workout/workout_page.dart';

import '../../data/colors_pallete_hex.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        final statusBarColor = _getStatusBarColor(controller.tabIndex);
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
          ),
        );
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomePage(),
                WorkoutPage(),
                HistoryPage(),
                SettingPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: ColorPalette.black50,
            selectedItemColor: ColorPalette.navBar,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 8,
            items: [
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.house,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.dumbbell,
                label: 'Workout',
              ),
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.noteSticky,
                label: 'History',
              ),
              _bottomNavigationBarItem(
                icon: FontAwesomeIcons.gear,
                label: 'Setting',
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getStatusBarColor(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return ColorPalette.crimsonRed20;
      case 1:
        return ColorPalette.royalBlue;
      case 2:
      case 3:
        return ColorPalette.black00;
      default:
        return Colors.transparent;
    }
  }

  _bottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
