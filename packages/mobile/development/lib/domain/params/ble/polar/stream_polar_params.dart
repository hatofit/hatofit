import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'stream_polar_params.freezed.dart';

@freezed
class StreamPolarParams with _$StreamPolarParams {
  const factory StreamPolarParams({
    required String deviceId,
    @Default({}) Set<PolarDataType> types,
  }) = _StreamPolarParams;
}
