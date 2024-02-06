import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:polar/polar.dart';

part 'get_polar_services_params.freezed.dart';

@freezed
class GetPolarServicesParams with _$GetPolarServicesParams {
  const factory GetPolarServicesParams({
    required String deviceId,
    required PolarSdkFeature feature,
  }) = _GetPolarServicesParams;
}
