import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop_scan_common_params.freezed.dart';

@freezed
class StopScanCommonParams with _$StopScanCommonParams {
  const factory StopScanCommonParams({
    required StreamSubscription<dynamic> subscription,
  }) = _StopScanCommonParams;
}
