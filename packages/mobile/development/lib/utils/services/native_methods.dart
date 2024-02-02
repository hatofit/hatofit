import 'package:flutter/services.dart';

abstract class NativeMethods {
  Future<dynamic> turnOnBluetooth();
}

class NativeMethodsImpl implements NativeMethods {
  static const platform = MethodChannel('com.hatofit.hatofit/method');

  @override
  Future<dynamic> turnOnBluetooth() async {
    try {
      final res = await platform.invokeMethod('turnOnBluetooth');
      return res;
    } on PlatformException catch (e) {
      print("Failed to turn on Bluetooth: ${e.message}");
      return e.message;
    }
  }
}