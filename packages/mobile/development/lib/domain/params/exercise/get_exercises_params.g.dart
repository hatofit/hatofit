// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exercises_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetExercisesParamsImpl _$$GetExercisesParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExercisesParamsImpl(
      showFromCompany: json['showFromCompany'] as bool? ?? false,
      page: json['page'] as int? ?? 0,
      limit: json['limit'] as int? ?? 10,
    );

Map<String, dynamic> _$$GetExercisesParamsImplToJson(
        _$GetExercisesParamsImpl instance) =>
    <String, dynamic>{
      'showFromCompany': instance.showFromCompany,
      'page': instance.page,
      'limit': instance.limit,
    };
