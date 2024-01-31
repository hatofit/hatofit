abstract class Failure {
  /// ignore: avoid_unused_constructor_parameters
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure(this.message);

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

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure([this.message]);

  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}
