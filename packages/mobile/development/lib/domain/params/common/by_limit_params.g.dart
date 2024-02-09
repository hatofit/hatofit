// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'by_limit_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ByLimitParamsImpl _$$ByLimitParamsImplFromJson(Map<String, dynamic> json) =>
    _$ByLimitParamsImpl(
      showFromCompany: json['showFromCompany'] as bool?,
      showFromLocal: json['showFromLocal'] as bool?,
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 10,
    );

Map<String, dynamic> _$$ByLimitParamsImplToJson(_$ByLimitParamsImpl instance) =>
    <String, dynamic>{
      'showFromCompany': instance.showFromCompany,
      'showFromLocal': instance.showFromLocal,
      'page': instance.page,
      'limit': instance.limit,
    };
