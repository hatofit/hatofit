import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_common_services_params.freezed.dart';

@freezed
class GetCommonServicesParams with _$GetCommonServicesParams {
  const factory GetCommonServicesParams({
    required BluetoothDevice device,
  }) = _GetCommonServicesParams;
}
