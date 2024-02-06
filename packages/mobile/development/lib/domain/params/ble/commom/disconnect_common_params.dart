import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'disconnect_common_params.freezed.dart';

@freezed
class DisconnectCommonParams with _$DisconnectCommonParams {
  const factory DisconnectCommonParams({
    required BluetoothDevice device,
  }) = _DisconnectCommonParams;
}
