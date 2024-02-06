import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_polar_params.freezed.dart';

@freezed
class ConnectPolarParams with _$ConnectPolarParams {
  const factory ConnectPolarParams({
    required String deviceId,
  }) = _ConnectPolarParams;
}
