import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/controller/bluetooth_controller.dart';
import 'package:hatofit/main.dart';
import 'package:intl/intl.dart';
import 'package:polar/polar.dart';

import '../constants/style.dart';
import '../models/streaming_model.dart';
import 'calc_con.dart';

class PolarController extends GetxController {
  @override
  void onInit() {
    polar.deviceDisconnected.listen((event) {
      isConnected.value = false;
      state.value = 'Disconnected from ${event.deviceId}';
      Get.snackbar('Disconnected', state.value);
      logger.i('Disconnected from ${event.deviceId}');
    });
    polar.deviceConnecting.last.then((value) {
      state.value = 'Connecting to ${value.deviceId}';
      Get.snackbar('Connecting', state.value);
      logger.i('Connecting to ${value.deviceId}');
    });
    polar.deviceConnected.last.then((value) {
      isConnected.value = true;
      state.value = 'Connected to ${value.deviceId}';
      Get.snackbar('Connected', state.value);
      logger.i('Connected to ${value.deviceId}');
    });
    super.onInit();
  }

  final BluetoothController _bleCon = Get.find<BluetoothController>();
  final CalcCon calcCon = Get.find<CalcCon>();

  final Polar _polar = Polar();
  PolarDeviceInfo? _connectedDevice;
  Set<PolarDataType> availableTypes = {};

  Polar get polar => _polar;
  PolarDeviceInfo? get connectedDevice => _connectedDevice;

  StreamController<PolarDeviceInfo?> searchStream =
      StreamController<PolarDeviceInfo?>();

  set interval(interval) {}
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

  int counter = 0;
  bool shouldSave = true;

  void recordWithInterval() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      final DateTime now = DateTime.now();
      final int currentMinute = now.minute;

      if (shouldSave) {
        DateFormat formatter = DateFormat('yyyy-MM-dd');
        final String formatted = formatter.format(now);
        calcCon.saveData(streamingModel[0], formatted, 0, currentMinute);
        counter++;
      }
      shouldSave = !shouldSave;
      streamingModel.clear();
      newStreamingModel();
    });
  }

  void connectToDevice(PolarDeviceInfo device) {
    _bleCon.device = BluetoothDevice.fromId(device.address);
    final connectFuture = _polar.connectToDevice(device.deviceId);

    Future.wait([connectFuture])
        .timeout(const Duration(seconds: 3))
        .then((_) async {
      _connectedDevice = device;
      _bleCon.device!.connect();
      await getPolarType();
      Get.back();
    }).catchError((error) {
      _polar.disconnectFromDevice(device.deviceId);
      _bleCon.device!.disconnect();
      Get.back();
    });
  }

  void disconnectFromDevice(PolarDeviceInfo device) {
    _polar.disconnectFromDevice(device.deviceId);
    _bleCon.device!.disconnect();
    _bleCon.device!.clearGattCache();
  }

  Future<Set> getPolarType() async {
    if (availableTypes.contains(PolarDataType.hr)) {
      return availableTypes;
    }
    await _polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == _connectedDevice!.deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    availableTypes = await _polar
        .getAvailableOnlineStreamDataTypes(_connectedDevice!.deviceId);

    return availableTypes;
  }

  final isConnected = false.obs;
  final state = ''.obs;
  @override
  void onReady() {
    getPhoneInfo();
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
    hrSubscription;
  }

  void startAccStream() {
    accSubscription = _polar
        .startAccStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      accStrmCon.add(data);
    });
    accSubscription;
  }

  void startPpgStream() {
    ppgSubscription = _polar
        .startPpgStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      ppgStrmCon.add(data);
    });
    ppgSubscription;
  }

  void startPpiStream() {
    ppiSubscription = _polar
        .startPpiStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      ppiStrmCon.add(data);
    });
    ppiSubscription;
  }

  void startGyroStream() {
    gyroSubscription = _polar
        .startGyroStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      gyroStrmCon.add(data);
    });
    gyroSubscription;
  }

  void startMagnStream() {
    magnSubscription = _polar
        .startMagnetometerStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      magnStrmCon.add(data);
    });
    magnSubscription;
  }

  void startEcgStream() {
    ecgSubscription = _polar
        .startEcgStreaming(
      connectedDevice!.deviceId,
    )
        .listen((data) {
      ecgStrmCon.add(data);
    });
    ecgSubscription;
  }

  List<StreamingModel> streamingModel = [];

  void newStreamingModel() {
    streamingModel.add(
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
          ecgData: [],
          rssiData: []),
    );
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

  final TextEditingController textEditingController = TextEditingController();
  @override
  void onClose() {
    hrSubscription?.cancel();
    accSubscription?.cancel();
    ppgSubscription?.cancel();
    ppiSubscription?.cancel();
    gyroSubscription?.cancel();
    magnSubscription?.cancel();
    ecgSubscription?.cancel();
    hrStrmCon.close();
    accStrmCon.close();
    ppgStrmCon.close();
    ppiStrmCon.close();
    gyroStrmCon.close();
    magnStrmCon.close();
    ecgStrmCon.close();

    textEditingController.dispose();
    super.onClose();
  }
}
