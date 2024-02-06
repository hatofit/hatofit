import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_mtu_common_params.freezed.dart';

@freezed
class RequestMtuCommonParams with _$RequestMtuCommonParams {
  const factory RequestMtuCommonParams({
    required BluetoothDevice device,
    required int mtu,
    @Default(0.35) double predelay,
    @Default(15) int timeout,
  }) = _RequestMtuCommonParams;
}
