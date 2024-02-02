import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'bluetooth_params.freezed.dart';

@freezed
class BluetoothParams with _$BluetoothParams {
  const factory BluetoothParams({
    @Default(null) String? deviceId,
    @Default("") String polarId,
    @Default({}) Set<PolarDataType> types,
    @Default(null) Uuid? uuid,
    @Default(null) Service? service,
  }) = _BluetoothParams;
}
