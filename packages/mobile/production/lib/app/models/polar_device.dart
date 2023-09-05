import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:polar/polar.dart';

class PolarDevice {
  PolarDeviceInfo info;
  final List<StreamSubscription> polarSubs = [];
  // final String name;
  // final String address;
  // final String deviceId;
  // final int rssi;
  final String imageAsset;
  // bool? isConnectable;
  int? battery;
  Rx<int> hr = Rx<int>(0);
  Rx<bool> isConnect = Rx<bool>(false);
  // String? firmware;
  BluetoothDevice? fble;
  PolarDevice({
    required this.info,

    // required this.name,
    // required this.address,
    // required this.deviceId,
    // required this.rssi,
    required this.imageAsset,
    // this.isConnectable,
    this.battery,
    // this.firmware,
    this.fble,
  });
}
