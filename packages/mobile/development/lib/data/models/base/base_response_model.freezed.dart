// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseResponseModel<T> _$BaseResponseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseResponseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseResponseModel<T> {
  T? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseModelCopyWith<T, BaseResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseModelCopyWith<T, $Res> {
  factory $BaseResponseModelCopyWith(BaseResponseModel<T> value,
          $Res Function(BaseResponseModel<T>) then) =
      _$BaseResponseModelCopyWithImpl<T, $Res, BaseResponseModel<T>>;
  @useResult
  $Res call({T? data, String? message, bool? success});
}

/// @nodoc
class _$BaseResponseModelCopyWithImpl<T, $Res,
        $Val extends BaseResponseModel<T>>
    implements $BaseResponseModelCopyWith<T, $Res> {
  _$BaseResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseModelImplCopyWith<T, $Res>
    implements $BaseResponseModelCopyWith<T, $Res> {
  factory _$$BaseResponseModelImplCopyWith(_$BaseResponseModelImpl<T> value,
          $Res Function(_$BaseResponseModelImpl<T>) then) =
      __$$BaseResponseModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, String? message, bool? success});
}

/// @nodoc
class __$$BaseResponseModelImplCopyWithImpl<T, $Res>
    extends _$BaseResponseModelCopyWithImpl<T, $Res, _$BaseResponseModelImpl<T>>
    implements _$$BaseResponseModelImplCopyWith<T, $Res> {
  __$$BaseResponseModelImplCopyWithImpl(_$BaseResponseModelImpl<T> _value,
      $Res Function(_$BaseResponseModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$BaseResponseModelImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseResponseModelImpl<T> extends _BaseResponseModel<T> {
  const _$BaseResponseModelImpl({this.data, this.message, this.success})
      : super._();

  factory _$BaseResponseModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseResponseModelImplFromJson(json, fromJsonT);

  @override
  final T? data;
  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'BaseResponseModel<$T>(data: $data, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseModelImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseModelImplCopyWith<T, _$BaseResponseModelImpl<T>>
      get copyWith =>
          __$$BaseResponseModelImplCopyWithImpl<T, _$BaseResponseModelImpl<T>>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseResponseModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseResponseModel<T> extends BaseResponseModel<T> {
  const factory _BaseResponseModel(
      {final T? data,
      final String? message,
      final bool? success}) = _$BaseResponseModelImpl<T>;
  const _BaseResponseModel._() : super._();

  factory _BaseResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseResponseModelImpl<T>.fromJson;

  @override
  T? get data;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$BaseResponseModelImplCopyWith<T, _$BaseResponseModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
