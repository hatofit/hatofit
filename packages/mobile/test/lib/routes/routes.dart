// route
// main screen -> check bluetooth state -> find devices screen

import 'package:get/get.dart';
import 'package:hatofit/pages/device_detail.dart';
import 'package:hatofit/pages/find_devices.dart';

import '../main.dart';

class AppRoutes {
  static const String home = '/';
  static const String findDevices = '/findDevices';
  static const String deviceDetail = '/deviceDetail';
}

class AppPages {
  // getpage variable
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const MyApp(),
    ),
    GetPage(
      name: AppRoutes.findDevices,
      page: () => const FindDevicesPage(),
    ),
    GetPage(
      name: AppRoutes.deviceDetail,
      page: () => const DeviceDetail(),
    )
  ];
}
