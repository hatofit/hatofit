import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/modules/history/history_page.dart';
import 'package:polar_hr_devices/modules/home/home_page.dart';
import 'package:polar_hr_devices/modules/settings/setting_page.dart';
import 'package:polar_hr_devices/modules/workout/workout_page.dart';


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
            selectedItemColor: ColorPalette.black,
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
      default:
        return ColorPalette.backgroundColor;
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
