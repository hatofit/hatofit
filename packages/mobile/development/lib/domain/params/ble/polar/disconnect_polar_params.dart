import 'package:freezed_annotation/freezed_annotation.dart';

part 'disconnect_polar_params.freezed.dart';

@freezed
class DisconnectPolarParams with _$DisconnectPolarParams {
  const factory DisconnectPolarParams({
    required String deviceId,
  }) = _DisconnectPolarParams;
}
