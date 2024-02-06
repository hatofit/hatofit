import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_common_params.freezed.dart';

@freezed
class ReadCommonParams with _$ReadCommonParams {
  const factory ReadCommonParams({
    required BluetoothCharacteristic characteristic,
    @Default(15) int timeout,
  }) = _ReadCommonParams;
}
