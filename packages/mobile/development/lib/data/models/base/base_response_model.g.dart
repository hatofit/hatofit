// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseModelImpl<T> _$$BaseResponseModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$BaseResponseModelImpl<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$$BaseResponseModelImplToJson<T>(
  _$BaseResponseModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
      'success': instance.success,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
