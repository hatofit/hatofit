// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseResponseEntity<T> {
  dynamic get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get success => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseResponseEntityCopyWith<T, BaseResponseEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseEntityCopyWith<T, $Res> {
  factory $BaseResponseEntityCopyWith(BaseResponseEntity<T> value,
          $Res Function(BaseResponseEntity<T>) then) =
      _$BaseResponseEntityCopyWithImpl<T, $Res, BaseResponseEntity<T>>;
  @useResult
  $Res call({dynamic data, String? message, bool? success});
}

/// @nodoc
class _$BaseResponseEntityCopyWithImpl<T, $Res,
        $Val extends BaseResponseEntity<T>>
    implements $BaseResponseEntityCopyWith<T, $Res> {
  _$BaseResponseEntityCopyWithImpl(this._value, this._then);

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
              as dynamic,
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
abstract class _$$BaseResponseEntityImplCopyWith<T, $Res>
    implements $BaseResponseEntityCopyWith<T, $Res> {
  factory _$$BaseResponseEntityImplCopyWith(_$BaseResponseEntityImpl<T> value,
          $Res Function(_$BaseResponseEntityImpl<T>) then) =
      __$$BaseResponseEntityImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({dynamic data, String? message, bool? success});
}

/// @nodoc
class __$$BaseResponseEntityImplCopyWithImpl<T, $Res>
    extends _$BaseResponseEntityCopyWithImpl<T, $Res,
        _$BaseResponseEntityImpl<T>>
    implements _$$BaseResponseEntityImplCopyWith<T, $Res> {
  __$$BaseResponseEntityImplCopyWithImpl(_$BaseResponseEntityImpl<T> _value,
      $Res Function(_$BaseResponseEntityImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? success = freezed,
  }) {
    return _then(_$BaseResponseEntityImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

class _$BaseResponseEntityImpl<T> implements _BaseResponseEntity<T> {
  const _$BaseResponseEntityImpl({this.data, this.message, this.success});

  @override
  final dynamic data;
  @override
  final String? message;
  @override
  final bool? success;

  @override
  String toString() {
    return 'BaseResponseEntity<$T>(data: $data, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseEntityImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseEntityImplCopyWith<T, _$BaseResponseEntityImpl<T>>
      get copyWith => __$$BaseResponseEntityImplCopyWithImpl<T,
          _$BaseResponseEntityImpl<T>>(this, _$identity);
}

abstract class _BaseResponseEntity<T> implements BaseResponseEntity<T> {
  const factory _BaseResponseEntity(
      {final dynamic data,
      final String? message,
      final bool? success}) = _$BaseResponseEntityImpl<T>;

  @override
  dynamic get data;
  @override
  String? get message;
  @override
  bool? get success;
  @override
  @JsonKey(ignore: true)
  _$$BaseResponseEntityImplCopyWith<T, _$BaseResponseEntityImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
