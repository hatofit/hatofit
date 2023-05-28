import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class PermissionCheckAndRequest {
  Future<int> getAndroidSdk() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    debugPrint('Running on ${androidInfo.version.sdkInt}');
    return androidInfo.version.sdkInt;
  }

  Future<bool> requestBluetoothAccess() async {
    Future<bool> permStatus;
    if (Platform.isAndroid && await getAndroidSdk() > 30) {
      permStatus = _requestAccess(Permission.bluetooth)
          .then((isGranted) => _requestAccess(Permission.bluetoothScan))
          .then((isGranted) => _requestAccess(Permission.bluetoothConnect))
          .then((isGranted) => _requestAccess(Permission.location))
          .then((isGranted) => _requestAccess(Permission.locationAlways))
          .then((isGranted) => _requestAccess(Permission.locationWhenInUse))
          .then((isGranted) => isGranted);
    } else {
      permStatus = _requestAccess(Permission.bluetooth);
    }
    bool status = await permStatus;
    debugPrint('Bluetooth permission status: $status');
    return permStatus;
  }

  Future<bool> _requestAccess(Permission permission) async {
    PermissionStatus status = await permission.request();
    return status.isGranted;
  }
}
