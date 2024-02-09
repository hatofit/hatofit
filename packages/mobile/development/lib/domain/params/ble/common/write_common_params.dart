import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_common_params.freezed.dart';

@freezed
class WriteCommonParams with _$WriteCommonParams {
  const factory WriteCommonParams({
    required BluetoothCharacteristic characteristic,
    required List<int> value,
    @Default(false) bool withoutResponse,
    @Default(false) bool allowLongWrite,
    @Default(15) int timeout,
  }) = _WriteCommonParams;
}
