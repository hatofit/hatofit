// import 'package:dartz/dartz.dart';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
// import 'package:hatofit/core/core.dart';
// import 'package:hatofit/domain/domain.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:polar/polar.dart';

// class BluetoothRepoImpl implements BluetoothRepo {
//   final BleClient _client;

//   BluetoothRepoImpl(this._client);

//   @override
//   Stream<Either<Failure, ConnectionStateUpdate>> connectToCommonDevice(
//     BluetoothParams params,
//   ) async* {
//     final res = _client.connectToCommonDevice(
//       deviceId: params.deviceId ?? '',
//     );
//     await for (final status in res) {
//       yield status;
//     }
//   }

//   @override
//   Future<Either<Failure, Map<Permission, PermissionStatus>>>
//       requestPermissions() async {
//     final res = await _client.requestPermissions();
//     return res;
//   }

//   @override
//   Stream<Either<Failure, BluetoothEntity>> scanDevices() async* {
//     final res = _client.scanDevices([Uuid.parse("180D")]);
//     await for (final device in res) {
//       yield device;
//     }
//   }

//   @override
//   Stream<Either<Failure, BleStatus>> bleStatus() async* {
//     final res = _client.bleStatus();
//     await for (final status in res) {
//       yield status;
//     }
//   }

//   @override
//   Future<Either<Failure, List<Service>>> getCommonServices(
//     BluetoothParams params,
//   ) async {
//     if (params.deviceId != null) {
//       return await _client.getCommonServices(params.deviceId ?? '');
//     } else {
//       return const Left(BluetoothFailure('Device ID is null'));
//     }
//   }

//   @override
//   Future<Either<Failure, List<int>>> commonServiceRead(
//     BluetoothParams params,
//   ) async {
//     final res = await _client.commonServiceRead(params.uuid!, params.service!);
//     return res;
//   }

//   @override
//   Future<Either<Failure, void>> clearGatt(
//     BluetoothParams params,
//   ) async {
//     return await _client.clearGatt(params.deviceId!);
//   }

//   @override
//   Future<Either<Failure, void>> connectToPolarDevice(
//       BluetoothParams params) async {
//     return await _client.connectToPolarDevice(deviceId: params.polarId);
//   }

//   @override
//   Future<Either<Failure, Set<PolarDataType>>> getPolarServices(
//     BluetoothParams params,
//   ) async {
//     return await _client.getPolarServices(
//       params.polarId,
//       PolarSdkFeature.onlineStreaming,
//     );
//   }

//   @override
//   Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> streamHRPolar(
//     BluetoothParams params,
//   ) async* {
//     final res = _client.polarHrStream(params.polarId, params.types);
//     await for (final data in res) {
//       yield data;
//     }
//   }

//   @override
//   Stream<Either<Failure, List<int>>> streamHRCommon(
//     BluetoothParams params,
//   ) async* {
//     final res = _client.commonServiceSubscribe(
//         UuidConstant.get.heartRateCharacteristic, params.service!);
//     await for (final data in res) {
//       yield data;
//     }
//   } 

//   @override
//   Future<Either<Failure, void>> disconnectPolarDevice(
//     BluetoothParams params,
//   ) async {
//     return await _client.disconnectPolarDevice(deviceId: params.polarId);
//   }
// }
