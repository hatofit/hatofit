import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_common_params.freezed.dart';

@freezed
class StreamCommonParams with _$StreamCommonParams {
  const factory StreamCommonParams({
    required BluetoothCharacteristic characteristic,
  }) = _StreamCommonParams;
}
