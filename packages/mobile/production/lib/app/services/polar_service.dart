// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hatofit/app/models/polar_device.dart';
// import 'package:hatofit/app/models/session_model.dart';
// import 'package:hatofit/app/services/internet_service.dart';
// import 'package:hatofit/app/services/storage_service.dart';
// import 'package:polar/polar.dart';

// class PolarService extends GetxController {
//   final _polar = Polar();
//   final heartRate = Rx<int>(0);
//   final _connectedDeviceId = 'No Device'.obs;
//   final detectedDevices = <PolarDevice>[].obs;

//   final isStartWorkout = false.obs;
//   final List<StreamSubscription> _availableSubscriptions = [];

//   Polar get polar => _polar;
//   String get connectedDeviceId => _connectedDeviceId.value;
//   set connectedDeviceId(String value) => _connectedDeviceId.value = value;

//   SessionDataItem _currentSecondDataItem = SessionDataItem(
//     second: 0,
//     timeStamp: DateTime.now().microsecondsSinceEpoch,
//     devices: [],
//   );

//   // var sessMod = SessionModel(
//   //   exerciseId: 'BoilerPlating',
//   //   startTime: DateTime.now().microsecondsSinceEpoch,
//   //   endTime: 0,
//   //   timelines: [],
//   //   data: [],
//   // ).obs;

//   @override
//   void onReady() {
//     scanPolarDevices();
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     _streamCancelation();
//     super.onClose();
//   }

//   void scanPolarDevices() {
//     _polar.searchForDevice().listen(
//       (event) {
//         String? nameReplace;
//         String? imageAsset;
//         final bool isDetected = detectedDevices.any(
//           (element) => element.deviceId == event.deviceId,
//         );
//         if (!isDetected) {
//           if (event.name.contains('H10')) {
//             nameReplace = 'Polar H10';
//             imageAsset = 'assets/images/polar/polar-h10.webp';
//           } else if (event.name.contains('OH1')) {
//             nameReplace = 'Polar OH1';
//             imageAsset = 'assets/images/polar/polar-oh1.webp';
//           } else if (event.name.contains('H9')) {
//             nameReplace = 'Polar H9';
//             imageAsset = 'assets/images/polar/polar-h9.webp';
//           } else if (event.name.contains('Sense')) {
//             nameReplace = 'Polar Verity Sense';
//             imageAsset = 'assets/images/polar/polar-verity-sense.webp';
//           }
//           nameReplace ??= event.name;
//           imageAsset ??= 'assets/images/polar/polar-h10.webp';
//           detectedDevices.add(
//             PolarDevice(
//               name: nameReplace,
//               address: event.address,
//               deviceId: event.deviceId,
//               rssi: event.rssi,
//               imageAsset: imageAsset,
//               isConnectable: event.isConnectable,
//             ),
//           );
//         }
//       },
//     );
//   }

//   void disconnectDevice(String deviceId) {
//     _streamCancelation();
//     _polar.disconnectFromDevice(deviceId);
//     _polar.deviceDisconnected.last;
//   }

//   Future<void> _streamCancelation() async {
//     for (var element in _availableSubscriptions) {
//       await element.cancel();
//     }
//   }

//   void starWorkout(
//       String exerciseId, int exerciseDuration, String exerciseName) {
//     var currentSecond = 0;
//     final endStream =
//         DateTime.now().microsecondsSinceEpoch + (exerciseDuration * 1000000);
//     SessionModel sessionModel = SessionModel(
//         exerciseId: exerciseId,
//         startTime: DateTime.now().microsecondsSinceEpoch,
//         endTime: endStream,
//         timelines: [],
//         data: []);
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       _currentSecondDataItem = SessionDataItem(
//         second: currentSecond,
//         timeStamp: DateTime.now().microsecondsSinceEpoch,
//         devices: List.from(_currentSecondDataItem.devices),
//       );
//       sessionModel.data.add(_currentSecondDataItem);
//       if (isStartWorkout.value == false) {
//         currentSecond = 0;
//         var exeName = exerciseName;
//         if (exeName == 'EMPTY') {
//           exeName = exerciseId;
//         } else {
//           exeName = exerciseName;
//           sessionModel.exerciseId = '(Custom) $exerciseName';
//         }
//         if (exerciseDuration == 0) {
//           final endTime = DateTime.now();
//           final startTIme =
//               DateTime.fromMicrosecondsSinceEpoch(sessionModel.startTime);
//           final difference = endTime.difference(startTIme);
//           exerciseDuration = difference.inSeconds;
//         }
//         StorageService().saveToJSON(
//             'session/raw/log-$exeName-$_connectedDeviceId-${DateTime.now().microsecondsSinceEpoch - (exerciseDuration * 1000000)}',
//             sessionModel);
//         InternetService().postSession(sessionModel);
//         timer.cancel();
//       }
//       _currentSecondDataItem.devices.clear();
//       currentSecond++;
//     });
//   }

//   void streamWhenReady(String deviceId) async {
//     await _polar.sdkFeatureReady.firstWhere(
//       (e) =>
//           e.identifier == deviceId &&
//           e.feature == PolarSdkFeature.onlineStreaming,
//     );
//     final availableTypes =
//         await _polar.getAvailableOnlineStreamDataTypes(deviceId);
//     debugPrint("===***===\n"
//         "availableTypes: $availableTypes\n"
//         "===***===\n");
//     if (availableTypes.contains(PolarDataType.hr)) {
//       StreamSubscription hrSubscription =
//           _polar.startHrStreaming(deviceId).listen((hrData) {
//         heartRate.value = hrData.samples.last.hr;

//         if (isStartWorkout.value == true) {
//           bool hasHrDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.hr');

//           if (!hasHrDevice) {
//             if (hrData.samples.last.rrsMs.isEmpty) {
//               _currentSecondDataItem.devices.add(
//                 SessionDataItemDevice(
//                   type: 'PolarDataType.hr',
//                   identifier: deviceId,
//                   value: [
//                     {'hr': hrData.samples.last.hr}
//                   ],
//                 ),
//               );
//             } else {
//               _currentSecondDataItem.devices.add(
//                 SessionDataItemDevice(
//                   type: 'PolarDataType.hr',
//                   identifier: deviceId,
//                   value: [
//                     {
//                       'hr': hrData.samples.last.hr,
//                       'rrsMs': hrData.samples.last.rrsMs
//                     }
//                   ],
//                 ),
//               );
//             }
//           }
//         }
//       });
//       _availableSubscriptions.add(hrSubscription);
//     }
//     if (availableTypes.contains(PolarDataType.acc)) {
//       StreamSubscription accSubscription =
//           _polar.startAccStreaming(deviceId).listen((accData) {
//         if (isStartWorkout.value == true) {
//           bool hasAccDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.acc');

//           if (!hasAccDevice) {
//             _currentSecondDataItem.devices.add(
//               SessionDataItemDevice(
//                 type: 'PolarDataType.acc',
//                 identifier: deviceId,
//                 value: [
//                   {
//                     'timeStamp':
//                         accData.samples.last.timeStamp.microsecondsSinceEpoch,
//                     'x': accData.samples.last.x,
//                     'y': accData.samples.last.y,
//                     'z': accData.samples.last.z,
//                   }
//                 ],
//               ),
//             );
//           }
//         }
//       });
//       _availableSubscriptions.add(accSubscription);
//     }
//     if (availableTypes.contains(PolarDataType.ecg)) {
//       StreamSubscription ecgSubscription =
//           _polar.startEcgStreaming(deviceId).listen((ecgData) {
//         if (isStartWorkout.value == true) {
//           bool hasEcgDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.ecg');

//           if (!hasEcgDevice) {
//             _currentSecondDataItem.devices.add(
//               SessionDataItemDevice(
//                 type: 'PolarDataType.ecg',
//                 identifier: deviceId,
//                 value: [
//                   {
//                     'timeStamp':
//                         ecgData.samples.last.timeStamp.microsecondsSinceEpoch,
//                     'voltage': ecgData.samples.last.voltage,
//                   }
//                 ],
//               ),
//             );
//           }
//         }
//       });
//       _availableSubscriptions.add(ecgSubscription);
//     }
//     if (availableTypes.contains(PolarDataType.gyro)) {
//       StreamSubscription gyroSubscription =
//           _polar.startGyroStreaming(deviceId).listen((gyroData) {
//         // calcute how much gyro data is available in a second

//         if (isStartWorkout.value == true) {
//           bool hasGyroDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.gyro');

//           if (!hasGyroDevice) {
//             _currentSecondDataItem.devices.add(
//               SessionDataItemDevice(
//                 type: 'PolarDataType.gyro',
//                 identifier: deviceId,
//                 value: [
//                   {
//                     'timeStamp':
//                         gyroData.samples.last.timeStamp.microsecondsSinceEpoch,
//                     'x': gyroData.samples.last.x,
//                     'y': gyroData.samples.last.y,
//                     'z': gyroData.samples.last.z,
//                   }
//                 ],
//               ),
//             );
//           }
//         }
//       });
//       _availableSubscriptions.add(gyroSubscription);
//     }
//     if (availableTypes.contains(PolarDataType.magnetometer)) {
//       StreamSubscription magnetometerSubscription = _polar
//           .startMagnetometerStreaming(deviceId)
//           .listen((magnetometerData) {
//         if (isStartWorkout.value == true) {
//           bool hasMagnetometerDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.magnetometer');

//           if (!hasMagnetometerDevice) {
//             _currentSecondDataItem.devices.add(
//               SessionDataItemDevice(
//                 type: 'PolarDataType.magnetometer',
//                 identifier: deviceId,
//                 value: [
//                   {
//                     'timeStamp': magnetometerData
//                         .samples.last.timeStamp.microsecondsSinceEpoch,
//                     'x': magnetometerData.samples.last.x,
//                     'y': magnetometerData.samples.last.y,
//                     'z': magnetometerData.samples.last.z,
//                   }
//                 ],
//               ),
//             );
//           }
//         }
//       });
//       _availableSubscriptions.add(magnetometerSubscription);
//     }
//     if (availableTypes.contains(PolarDataType.ppg)) {
//       StreamSubscription ppgSubscription =
//           _polar.startPpgStreaming(deviceId).listen((ppgData) {
//         if (isStartWorkout.value == true) {
//           bool hasPpgDevice = _currentSecondDataItem.devices
//               .any((element) => element.type == 'PolarDataType.ppg');

//           if (!hasPpgDevice) {
//             _currentSecondDataItem.devices.add(
//               SessionDataItemDevice(
//                 type: 'PolarDataType.ppg',
//                 identifier: deviceId,
//                 value: [
//                   {
//                     'timeStamp':
//                         ppgData.samples.last.timeStamp.microsecondsSinceEpoch,
//                     'channelSamples': ppgData.samples.last.channelSamples,
//                   }
//                 ],
//               ),
//             );
//           }
//         }
//       });
//       _availableSubscriptions.add(ppgSubscription);
//     }
//   }
// }
