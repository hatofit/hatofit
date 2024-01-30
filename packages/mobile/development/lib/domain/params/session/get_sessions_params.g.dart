// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sessions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSessionsParamsImpl _$$GetSessionsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSessionsParamsImpl(
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 10,
    );

Map<String, dynamic> _$$GetSessionsParamsImplToJson(
        _$GetSessionsParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
