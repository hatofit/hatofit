// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetReportsParamsImpl _$$GetReportsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetReportsParamsImpl(
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 5,
    );

Map<String, dynamic> _$$GetReportsParamsImplToJson(
        _$GetReportsParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
