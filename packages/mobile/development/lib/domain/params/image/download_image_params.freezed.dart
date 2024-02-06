// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_image_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadImageParams {
  String get url => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadImageParamsCopyWith<DownloadImageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadImageParamsCopyWith<$Res> {
  factory $DownloadImageParamsCopyWith(
          DownloadImageParams value, $Res Function(DownloadImageParams) then) =
      _$DownloadImageParamsCopyWithImpl<$Res, DownloadImageParams>;
  @useResult
  $Res call({String url, String fileName});
}

/// @nodoc
class _$DownloadImageParamsCopyWithImpl<$Res, $Val extends DownloadImageParams>
    implements $DownloadImageParamsCopyWith<$Res> {
  _$DownloadImageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadImageParamsImplCopyWith<$Res>
    implements $DownloadImageParamsCopyWith<$Res> {
  factory _$$DownloadImageParamsImplCopyWith(_$DownloadImageParamsImpl value,
          $Res Function(_$DownloadImageParamsImpl) then) =
      __$$DownloadImageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String fileName});
}

/// @nodoc
class __$$DownloadImageParamsImplCopyWithImpl<$Res>
    extends _$DownloadImageParamsCopyWithImpl<$Res, _$DownloadImageParamsImpl>
    implements _$$DownloadImageParamsImplCopyWith<$Res> {
  __$$DownloadImageParamsImplCopyWithImpl(_$DownloadImageParamsImpl _value,
      $Res Function(_$DownloadImageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? fileName = null,
  }) {
    return _then(_$DownloadImageParamsImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadImageParamsImpl implements _DownloadImageParams {
  const _$DownloadImageParamsImpl({this.url = "", this.fileName = ""});

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String fileName;

  @override
  String toString() {
    return 'DownloadImageParams(url: $url, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadImageParamsImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadImageParamsImplCopyWith<_$DownloadImageParamsImpl> get copyWith =>
      __$$DownloadImageParamsImplCopyWithImpl<_$DownloadImageParamsImpl>(
          this, _$identity);
}

abstract class _DownloadImageParams implements DownloadImageParams {
  const factory _DownloadImageParams(
      {final String url, final String fileName}) = _$DownloadImageParamsImpl;

  @override
  String get url;
  @override
  String get fileName;
  @override
  @JsonKey(ignore: true)
  _$$DownloadImageParamsImplCopyWith<_$DownloadImageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
