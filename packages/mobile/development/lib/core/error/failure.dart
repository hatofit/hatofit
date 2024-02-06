import 'package:dio/dio.dart';

abstract class Failure {
  /// ignore: avoid_unused_constructor_parameters
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? message;
  final DioException? exception;

  const ServerFailure({this.message, this.exception});

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class BluetoothFailure extends Failure {
  final String? message;

  const BluetoothFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is BluetoothFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class NoDataFailure extends Failure {
  final String? message;

  const NoDataFailure(this.message);

  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;
}

class NoInternetFailure extends Failure {
  final String? message;

  const NoInternetFailure({this.message});

  @override
  bool operator ==(Object other) => other is NoInternetFailure;

  @override
  int get hashCode => 0;
}

class CacheFailure extends Failure {
  final String? reason;

  const CacheFailure([this.reason]);

  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}

class FirebaseFailure extends Failure {
  final String? message;

  const FirebaseFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is FirebaseFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;
}
