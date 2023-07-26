import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/controller/bluetooth_controller.dart';
import 'package:polar/polar.dart';

import '../constants/style.dart';
import '../models/streaming_model.dart';
import 'calc_con.dart';

class PolarController extends GetxController {
  final BluetoothController _bleCon = Get.find<BluetoothController>();
  final CalcCon calcCon = Get.find<CalcCon>();

  final Polar _polar = Polar();
  PolarDeviceInfo? _connectedDevice;
  Set<PolarDataType> availableTypes = {};
  final RxString polarState = 'Unknown'.obs;

  Polar get polar => _polar;
  PolarDeviceInfo? get connectedDevice => _connectedDevice;

  StreamController<PolarDeviceInfo?> searchStream =
      StreamController<PolarDeviceInfo?>();
  Stream<PolarDeviceInfo?> searchForDevice() {
    _polar.searchForDevice().listen((event) {
      searchStream.add(event);
    });
    return searchStream.stream;
  }

  Stream<PolarDisInformationEvent> getDisInfo(String deviceId) {
    return _polar.disInformation.where((event) => event.identifier == deviceId);
  }

  Stream<PolarBatteryLevelEvent> getBatteryLevel(String deviceId) {
    return _polar.batteryLevel.where((event) => event.identifier == deviceId);
  }

  Future<int> getRssi() {
    return _bleCon.device!.readRssi();
  }

  ImageProvider<Object> getImage(String name) {
    if (name.contains('sense')) {
      return veritySense;
    } else {
      return h10;
    }
  }

  Future<bool> connectToDevice(PolarDeviceInfo device) async {
    try {
      _polar.connectToDevice(device.deviceId);
      Future.delayed(const Duration(seconds: 5));
      _bleCon.device = BluetoothDevice.fromId(device.address);
      _bleCon.device!.connect();
      _connectedDevice = device;
      return true;
    } catch (e) {
      final disconn = await disconnectFromDevice(device);
      if (disconn == true) {
        await connectToDevice(device);
      }
      return false;
    }
  }

  Future<bool> disconnectFromDevice(PolarDeviceInfo device) async {
    try {
      _polar.disconnectFromDevice(device.deviceId);
      _bleCon.device!.disconnect();
      _bleCon.device!.clearGattCache();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Set> getPolarType() async {
    if (availableTypes.isEmpty) {
      await _polar.sdkFeatureReady.firstWhere(
        (e) =>
            e.identifier == _connectedDevice!.deviceId &&
            e.feature == PolarSdkFeature.onlineStreaming,
      );
      availableTypes = await _polar
          .getAvailableOnlineStreamDataTypes(_connectedDevice!.deviceId);
      addStreamingModel(
        StreamingModel(
            phoneInfo: PhoneInfo(
              os: phoneInfo['os']!,
              manufacturer: phoneInfo['manufacturer']!,
              type: phoneInfo['model']!,
              deviceId: _bleCon.device!.id.toString(),
              totalProcessors: 1,
            ),
            polarDeviceInfo: PolarDeviceInfo(
              name: _connectedDevice!.name,
              deviceId: _connectedDevice!.deviceId,
              address: _connectedDevice!.address,
              rssi: _connectedDevice!.rssi,
              isConnectable: _connectedDevice!.isConnectable,
            ),
            hrData: [],
            accData: [],
            ppgData: [],
            ppiData: [],
            gyroData: [],
            magnData: [],
            ecgData: []),
      );
    }
    return availableTypes;
  }

  String getPolarState() {
    _polar.deviceDisconnected.last.then((value) {
      polarState.value = 'Disconnected';
      return polarState.value;
    });
    _polar.deviceConnecting.last.then((value) {
      polarState.value = 'Connecting';
    });
    _polar.deviceConnected.last.then((value) {
      polarState.value = 'Connected';
    });

    return polarState.value;
  }

  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Map<String, String> phoneInfo = {};
  Future<Map<String, String>> getPhoneInfo() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        phoneInfo['os'] = 'Android ${androidInfo.version.release}';
        phoneInfo['model'] = androidInfo.model;
        phoneInfo['name'] = androidInfo.device;
        phoneInfo['manufacturer'] = androidInfo.manufacturer;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        phoneInfo['os'] = 'iOS ${iosInfo.systemVersion}';
        phoneInfo['model'] = iosInfo.utsname.machine;
        phoneInfo['name'] = iosInfo.name;
        phoneInfo['manufacturer'] = iosInfo.utsname.machine;
      }
    } catch (e) {
      phoneInfo['os'] = 'Unknown';
      phoneInfo['model'] = 'Unknown';
      phoneInfo['name'] = 'Unknown';
    }

    return phoneInfo;
  }

  @override
  void onReady() {
    getPhoneInfo();

    super.onReady();
  }

  StreamController<PolarHrData> hrStrmCon = StreamController<PolarHrData>();
  StreamController<PolarAccData> accStrmCon = StreamController<PolarAccData>();
  StreamController<PolarPpgData> ppgStrmCon = StreamController<PolarPpgData>();
  StreamController<PolarPpiData> ppiStrmCon = StreamController<PolarPpiData>();
  StreamController<PolarGyroData> gyroStrmCon =
      StreamController<PolarGyroData>();
  StreamController<PolarMagnetometerData> magnStrmCon =
      StreamController<PolarMagnetometerData>();
  StreamController<PolarEcgData> ecgStrmCon = StreamController<PolarEcgData>();
  StreamSubscription<PolarHrData>? hrSubscription;
  StreamSubscription<PolarAccData>? accSubscription;
  StreamSubscription<PolarPpgData>? ppgSubscription;
  StreamSubscription<PolarPpiData>? ppiSubscription;
  StreamSubscription<PolarGyroData>? gyroSubscription;
  StreamSubscription<PolarMagnetometerData>? magnSubscription;
  StreamSubscription<PolarEcgData>? ecgSubscription;
  void startHrStream() {
    hrSubscription = _polar
        .startHrStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      hrStrmCon.add(data);
    });
  }

  void startAccStream() {
    accSubscription = _polar
        .startAccStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      accStrmCon.add(data);
    });
  }

  void startPpgStream() {
    ppgSubscription = _polar
        .startPpgStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      ppgStrmCon.add(data);
    });
  }

  void startPpiStream() {
    ppiSubscription = _polar
        .startPpiStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      ppiStrmCon.add(data);
    });
  }

  void startGyroStream() {
    gyroSubscription = _polar
        .startGyroStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      gyroStrmCon.add(data);
    });
  }

  void startMagnStream() {
    magnSubscription = _polar
        .startMagnetometerStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      magnStrmCon.add(data);
    });
  }

  void startEcgStream() {
    _polar.startEcgStreaming(connectedDevice!.deviceId).listen((data) {
      ecgStrmCon.add(data);
    });
  }

  List<StreamingModel> streamingModel = [];

  void addStreamingModel(StreamingModel newModel) {
    streamingModel.add(newModel);
  }

  void addHrData(HrData newHrData, int index) {
    streamingModel[index].hrData.add(newHrData);
  }

  void addAccData(AccData newAccData, int index) {
    streamingModel[index].accData.add(newAccData);
  }

  void addPpgData(PpgData nPG, int index) {
    streamingModel[index].ppgData.add(nPG);
  }

  void addPpiData(PpiData nPI, int index) {
    streamingModel[index].ppiData.add(nPI);
  }

  void addGyroData(GyroData nGD, int index) {
    streamingModel[index].gyroData.add(nGD);
  }

  void addMagnData(GyroData nMD, int index) {
    streamingModel[index].magnData.add(nMD);
  }

  void addEcgData(EcgData nED, int index) {
    streamingModel[index].ecgData.add(nED);
  }

  final hrStream = false.obs;
  final accStream = false.obs;
  final ppgStream = false.obs;
  final ppiStream = false.obs;
  final gyroStream = false.obs;
  final magnStream = false.obs;
  final ecgStream = false.obs;

  Future<Duration> elapsedTime(int startTime, int lastTime) async {
    final DateTime start = DateTime.fromMicrosecondsSinceEpoch(startTime);
    final DateTime last = DateTime.fromMicrosecondsSinceEpoch(lastTime);

    return last.difference(start);
  }
}
