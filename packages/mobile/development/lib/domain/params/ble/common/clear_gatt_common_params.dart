import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clear_gatt_common_params.freezed.dart';

@freezed
class ClearGattCommonParams with _$ClearGattCommonParams {
  const factory ClearGattCommonParams({
    required BluetoothDevice device,
  }) = _ClearGattCommonParams;
}
