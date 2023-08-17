import 'base/local_source.dart';

abstract class LocalPayloadRepoAbs {
  LocalType get type;
  String get path;
  Map<String, dynamic>? get body;
  Future request();
}

class LocalRepoIml implements LocalPayloadRepoAbs {
  final LocalType localType;
  Map<String, dynamic>? data;
  LocalRepoIml._({required this.localType, this.data});

  factory LocalRepoIml.fetchWorkout() => LocalRepoIml._(
        localType: LocalType.fetchWorkout,
      );

  factory LocalRepoIml.saveWorkout({
    required Map<String, dynamic> data,
  }) =>
      LocalRepoIml._(
        localType: LocalType.saveWorkout,
        data: data,
      );

  @override
  LocalType get type {
    switch (localType) {
      case LocalType.fetchWorkout:
        return LocalType.fetchWorkout;
      case LocalType.saveWorkout:
        return LocalType.saveWorkout;
      case LocalType.fetchSession:
        return LocalType.fetchSession;
      case LocalType.saveSession:
        return LocalType.saveSession;
    }
  }

  @override
  Map<String, dynamic>? get body {
    switch (type) {
      case LocalType.fetchWorkout:
        return null;
      case LocalType.saveWorkout:
        return data;
      case LocalType.fetchSession:
        return null;
      case LocalType.saveSession:
        return data;
    }
  }

  @override
  String get path => 'workout';

  @override
  Future request() {
    return LocalSource.instance.request(this);
  }
}
