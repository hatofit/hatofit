// import 'package:dartz/dartz.dart'; 
// import 'package:hatofit/core/core.dart';
// import 'package:hatofit/domain/domain.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:polar/polar.dart';

// abstract class BLERepo {
//   Future<Either<Failure, Map<Permission, PermissionStatus>>>
//       requestPermissions();

//   Stream<Either<Failure, BluetoothEntity>> scanDevices();

//   Stream<Either<Failure, ConnectionStateUpdate>> connectToCommonDevice(
//     BluetoothParams params,
//   );

//   Stream<Either<Failure, BleStatus>> bleStatus();

//   Future<Either<Failure, List<Service>>> getCommonServices(
//     BluetoothParams params,
//   );

//   Future<Either<Failure, List<int>>> commonServiceRead(
//     BluetoothParams params,
//   );

//   Future<Either<Failure, void>> clearGatt(
//     BluetoothParams params,
//   );

//   Future<Either<Failure, void>> connectToPolarDevice(
//     BluetoothParams params,
//   );

//   Future<Either<Failure, void>> disconnectPolarDevice(
//     BluetoothParams params,
//   );

//   Future<Either<Failure, Set<PolarDataType>>> getPolarServices(
//     BluetoothParams params,
//   );

//   Stream<Either<Failure, PolarStreamingData<PolarHrSample>>> streamHRPolar(
//     BluetoothParams params,
//   );
//   Stream<Either<Failure, List<int>>> streamHRCommon(
//     BluetoothParams params,
//   );
// }
