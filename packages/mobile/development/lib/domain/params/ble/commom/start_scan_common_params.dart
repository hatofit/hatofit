import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_scan_common_params.freezed.dart';

@freezed
class StartScanCommonParams with _$StartScanCommonParams {
  const factory StartScanCommonParams({
    @Default([]) List<Guid> serviceIds,
    @Default(null) Duration? timeout,
  }) = _StartScanCommonParams;
}
