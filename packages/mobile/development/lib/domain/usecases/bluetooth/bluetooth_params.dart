import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'bluetooth_params.freezed.dart';

@freezed
class BluetoothParams with _$BluetoothParams {
  const factory BluetoothParams({
    @Default("") String deviceId,
    @Default({}) Set<PolarDataType> types,
  }) = _BluetoothParams;
}
