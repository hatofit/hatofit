import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar/polar.dart';

class StreamingService extends GetxController {
  final polar = Polar();
  RxString hrData = ''.obs;
  String deviceId = ''.obs.value;

  void searchForDevices(Function(String deviceId) discoveredDevicesCallback) {
    polar.searchForDevice().listen((event) {
      discoveredDevicesCallback(event.deviceId);
      deviceId = event.deviceId;
      debugPrint('Device ID: $deviceId');
    });
  }

  void connectingToDevice(String deviceId) {
    polar.connectToDevice(deviceId);
  }

  Future<void> streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);

    debugPrint('available types: $availableTypes');
    if (availableTypes.contains(PolarDataType.hr)) {
      polar.startHrStreaming(deviceId).listen(
        (e) {
          hrData.value = e.samples.map((e) => e.hr).toString();
          debugPrint('HR data received ${e.samples.map((e) => e.hr)}');
          debugPrint('Local HR data received ${hrData.value}');
        },
      );
    }
  }
}
