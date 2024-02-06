import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_common_params.freezed.dart';

@freezed
class ConnectCommonParams with _$ConnectCommonParams {
  const factory ConnectCommonParams({
    required BluetoothDevice device,
    @Default(Duration(seconds: 40)) Duration timeout,
    @Default(512) int mtu,
    @Default(false) bool autoConnect,
  }) = _ConnectCommonParams;
}
