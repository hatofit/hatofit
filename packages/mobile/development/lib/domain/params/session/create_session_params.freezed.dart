// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_session_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateSessionParams _$CreateSessionParamsFromJson(Map<String, dynamic> json) {
  return _CreateSessionParams.fromJson(json);
}

/// @nodoc
mixin _$CreateSessionParams {
  String get userId => throw _privateConstructorUsedError;
  String get exerciseId => throw _privateConstructorUsedError;
  int get startTime => throw _privateConstructorUsedError;
  int get endTime => throw _privateConstructorUsedError;
  String get mood => throw _privateConstructorUsedError;
  List<SessionTimelineParams> get timelines =>
      throw _privateConstructorUsedError;
  List<SessionDataItemParams> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateSessionParamsCopyWith<CreateSessionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSessionParamsCopyWith<$Res> {
  factory $CreateSessionParamsCopyWith(
          CreateSessionParams value, $Res Function(CreateSessionParams) then) =
      _$CreateSessionParamsCopyWithImpl<$Res, CreateSessionParams>;
  @useResult
  $Res call(
      {String userId,
      String exerciseId,
      int startTime,
      int endTime,
      String mood,
      List<SessionTimelineParams> timelines,
      List<SessionDataItemParams> data});
}

/// @nodoc
class _$CreateSessionParamsCopyWithImpl<$Res, $Val extends CreateSessionParams>
    implements $CreateSessionParamsCopyWith<$Res> {
  _$CreateSessionParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? exerciseId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? mood = null,
    Object? timelines = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      timelines: null == timelines
          ? _value.timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<SessionTimelineParams>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemParams>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSessionParamsImplCopyWith<$Res>
    implements $CreateSessionParamsCopyWith<$Res> {
  factory _$$CreateSessionParamsImplCopyWith(_$CreateSessionParamsImpl value,
          $Res Function(_$CreateSessionParamsImpl) then) =
      __$$CreateSessionParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String exerciseId,
      int startTime,
      int endTime,
      String mood,
      List<SessionTimelineParams> timelines,
      List<SessionDataItemParams> data});
}

/// @nodoc
class __$$CreateSessionParamsImplCopyWithImpl<$Res>
    extends _$CreateSessionParamsCopyWithImpl<$Res, _$CreateSessionParamsImpl>
    implements _$$CreateSessionParamsImplCopyWith<$Res> {
  __$$CreateSessionParamsImplCopyWithImpl(_$CreateSessionParamsImpl _value,
      $Res Function(_$CreateSessionParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? exerciseId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? mood = null,
    Object? timelines = null,
    Object? data = null,
  }) {
    return _then(_$CreateSessionParamsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      exerciseId: null == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String,
      timelines: null == timelines
          ? _value._timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<SessionTimelineParams>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemParams>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSessionParamsImpl implements _CreateSessionParams {
  const _$CreateSessionParamsImpl(
      {this.userId = "",
      this.exerciseId = "",
      this.startTime = 0,
      this.endTime = 0,
      this.mood = "",
      final List<SessionTimelineParams> timelines = const [],
      final List<SessionDataItemParams> data = const []})
      : _timelines = timelines,
        _data = data;

  factory _$CreateSessionParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSessionParamsImplFromJson(json);

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String exerciseId;
  @override
  @JsonKey()
  final int startTime;
  @override
  @JsonKey()
  final int endTime;
  @override
  @JsonKey()
  final String mood;
  final List<SessionTimelineParams> _timelines;
  @override
  @JsonKey()
  List<SessionTimelineParams> get timelines {
    if (_timelines is EqualUnmodifiableListView) return _timelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timelines);
  }

  final List<SessionDataItemParams> _data;
  @override
  @JsonKey()
  List<SessionDataItemParams> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CreateSessionParams(userId: $userId, exerciseId: $exerciseId, startTime: $startTime, endTime: $endTime, mood: $mood, timelines: $timelines, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSessionParamsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            const DeepCollectionEquality()
                .equals(other._timelines, _timelines) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      exerciseId,
      startTime,
      endTime,
      mood,
      const DeepCollectionEquality().hash(_timelines),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSessionParamsImplCopyWith<_$CreateSessionParamsImpl> get copyWith =>
      __$$CreateSessionParamsImplCopyWithImpl<_$CreateSessionParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSessionParamsImplToJson(
      this,
    );
  }
}

abstract class _CreateSessionParams implements CreateSessionParams {
  const factory _CreateSessionParams(
      {final String userId,
      final String exerciseId,
      final int startTime,
      final int endTime,
      final String mood,
      final List<SessionTimelineParams> timelines,
      final List<SessionDataItemParams> data}) = _$CreateSessionParamsImpl;

  factory _CreateSessionParams.fromJson(Map<String, dynamic> json) =
      _$CreateSessionParamsImpl.fromJson;

  @override
  String get userId;
  @override
  String get exerciseId;
  @override
  int get startTime;
  @override
  int get endTime;
  @override
  String get mood;
  @override
  List<SessionTimelineParams> get timelines;
  @override
  List<SessionDataItemParams> get data;
  @override
  @JsonKey(ignore: true)
  _$$CreateSessionParamsImplCopyWith<_$CreateSessionParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionTimelineParams _$SessionTimelineParamsFromJson(
    Map<String, dynamic> json) {
  return _SessionTimelineParams.fromJson(json);
}

/// @nodoc
mixin _$SessionTimelineParams {
  String get name => throw _privateConstructorUsedError;
  int get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionTimelineParamsCopyWith<SessionTimelineParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionTimelineParamsCopyWith<$Res> {
  factory $SessionTimelineParamsCopyWith(SessionTimelineParams value,
          $Res Function(SessionTimelineParams) then) =
      _$SessionTimelineParamsCopyWithImpl<$Res, SessionTimelineParams>;
  @useResult
  $Res call({String name, int startTime});
}

/// @nodoc
class _$SessionTimelineParamsCopyWithImpl<$Res,
        $Val extends SessionTimelineParams>
    implements $SessionTimelineParamsCopyWith<$Res> {
  _$SessionTimelineParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionTimelineParamsImplCopyWith<$Res>
    implements $SessionTimelineParamsCopyWith<$Res> {
  factory _$$SessionTimelineParamsImplCopyWith(
          _$SessionTimelineParamsImpl value,
          $Res Function(_$SessionTimelineParamsImpl) then) =
      __$$SessionTimelineParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int startTime});
}

/// @nodoc
class __$$SessionTimelineParamsImplCopyWithImpl<$Res>
    extends _$SessionTimelineParamsCopyWithImpl<$Res,
        _$SessionTimelineParamsImpl>
    implements _$$SessionTimelineParamsImplCopyWith<$Res> {
  __$$SessionTimelineParamsImplCopyWithImpl(_$SessionTimelineParamsImpl _value,
      $Res Function(_$SessionTimelineParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? startTime = null,
  }) {
    return _then(_$SessionTimelineParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionTimelineParamsImpl implements _SessionTimelineParams {
  const _$SessionTimelineParamsImpl({this.name = "", this.startTime = 0});

  factory _$SessionTimelineParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionTimelineParamsImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int startTime;

  @override
  String toString() {
    return 'SessionTimelineParams(name: $name, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionTimelineParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionTimelineParamsImplCopyWith<_$SessionTimelineParamsImpl>
      get copyWith => __$$SessionTimelineParamsImplCopyWithImpl<
          _$SessionTimelineParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionTimelineParamsImplToJson(
      this,
    );
  }
}

abstract class _SessionTimelineParams implements SessionTimelineParams {
  const factory _SessionTimelineParams(
      {final String name, final int startTime}) = _$SessionTimelineParamsImpl;

  factory _SessionTimelineParams.fromJson(Map<String, dynamic> json) =
      _$SessionTimelineParamsImpl.fromJson;

  @override
  String get name;
  @override
  int get startTime;
  @override
  @JsonKey(ignore: true)
  _$$SessionTimelineParamsImplCopyWith<_$SessionTimelineParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SessionDataItemParams _$SessionDataItemParamsFromJson(
    Map<String, dynamic> json) {
  return _SessionDataItemParams.fromJson(json);
}

/// @nodoc
mixin _$SessionDataItemParams {
  int get second => throw _privateConstructorUsedError;
  int get timeStamp => throw _privateConstructorUsedError;
  List<SessionDataItemDeviceParams> get devices =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDataItemParamsCopyWith<SessionDataItemParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemParamsCopyWith<$Res> {
  factory $SessionDataItemParamsCopyWith(SessionDataItemParams value,
          $Res Function(SessionDataItemParams) then) =
      _$SessionDataItemParamsCopyWithImpl<$Res, SessionDataItemParams>;
  @useResult
  $Res call(
      {int second, int timeStamp, List<SessionDataItemDeviceParams> devices});
}

/// @nodoc
class _$SessionDataItemParamsCopyWithImpl<$Res,
        $Val extends SessionDataItemParams>
    implements $SessionDataItemParamsCopyWith<$Res> {
  _$SessionDataItemParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? second = null,
    Object? timeStamp = null,
    Object? devices = null,
  }) {
    return _then(_value.copyWith(
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      devices: null == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemDeviceParams>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemParamsImplCopyWith<$Res>
    implements $SessionDataItemParamsCopyWith<$Res> {
  factory _$$SessionDataItemParamsImplCopyWith(
          _$SessionDataItemParamsImpl value,
          $Res Function(_$SessionDataItemParamsImpl) then) =
      __$$SessionDataItemParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int second, int timeStamp, List<SessionDataItemDeviceParams> devices});
}

/// @nodoc
class __$$SessionDataItemParamsImplCopyWithImpl<$Res>
    extends _$SessionDataItemParamsCopyWithImpl<$Res,
        _$SessionDataItemParamsImpl>
    implements _$$SessionDataItemParamsImplCopyWith<$Res> {
  __$$SessionDataItemParamsImplCopyWithImpl(_$SessionDataItemParamsImpl _value,
      $Res Function(_$SessionDataItemParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? second = null,
    Object? timeStamp = null,
    Object? devices = null,
  }) {
    return _then(_$SessionDataItemParamsImpl(
      second: null == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemDeviceParams>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDataItemParamsImpl implements _SessionDataItemParams {
  const _$SessionDataItemParamsImpl(
      {this.second = 0,
      this.timeStamp = 0,
      final List<SessionDataItemDeviceParams> devices = const []})
      : _devices = devices;

  factory _$SessionDataItemParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionDataItemParamsImplFromJson(json);

  @override
  @JsonKey()
  final int second;
  @override
  @JsonKey()
  final int timeStamp;
  final List<SessionDataItemDeviceParams> _devices;
  @override
  @JsonKey()
  List<SessionDataItemDeviceParams> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'SessionDataItemParams(second: $second, timeStamp: $timeStamp, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemParamsImpl &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, second, timeStamp,
      const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDataItemParamsImplCopyWith<_$SessionDataItemParamsImpl>
      get copyWith => __$$SessionDataItemParamsImplCopyWithImpl<
          _$SessionDataItemParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDataItemParamsImplToJson(
      this,
    );
  }
}

abstract class _SessionDataItemParams implements SessionDataItemParams {
  const factory _SessionDataItemParams(
          {final int second,
          final int timeStamp,
          final List<SessionDataItemDeviceParams> devices}) =
      _$SessionDataItemParamsImpl;

  factory _SessionDataItemParams.fromJson(Map<String, dynamic> json) =
      _$SessionDataItemParamsImpl.fromJson;

  @override
  int get second;
  @override
  int get timeStamp;
  @override
  List<SessionDataItemDeviceParams> get devices;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemParamsImplCopyWith<_$SessionDataItemParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SessionDataItemDeviceParams _$SessionDataItemDeviceParamsFromJson(
    Map<String, dynamic> json) {
  return _SessionDataItemDeviceParams.fromJson(json);
}

/// @nodoc
mixin _$SessionDataItemDeviceParams {
  String get type => throw _privateConstructorUsedError;
  String get identifier => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDataItemDeviceParamsCopyWith<SessionDataItemDeviceParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemDeviceParamsCopyWith<$Res> {
  factory $SessionDataItemDeviceParamsCopyWith(
          SessionDataItemDeviceParams value,
          $Res Function(SessionDataItemDeviceParams) then) =
      _$SessionDataItemDeviceParamsCopyWithImpl<$Res,
          SessionDataItemDeviceParams>;
  @useResult
  $Res call(
      {String type,
      String identifier,
      String brand,
      String model,
      List<Map<String, dynamic>> value});
}

/// @nodoc
class _$SessionDataItemDeviceParamsCopyWithImpl<$Res,
        $Val extends SessionDataItemDeviceParams>
    implements $SessionDataItemDeviceParamsCopyWith<$Res> {
  _$SessionDataItemDeviceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? identifier = null,
    Object? brand = null,
    Object? model = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemDeviceParamsImplCopyWith<$Res>
    implements $SessionDataItemDeviceParamsCopyWith<$Res> {
  factory _$$SessionDataItemDeviceParamsImplCopyWith(
          _$SessionDataItemDeviceParamsImpl value,
          $Res Function(_$SessionDataItemDeviceParamsImpl) then) =
      __$$SessionDataItemDeviceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      String identifier,
      String brand,
      String model,
      List<Map<String, dynamic>> value});
}

/// @nodoc
class __$$SessionDataItemDeviceParamsImplCopyWithImpl<$Res>
    extends _$SessionDataItemDeviceParamsCopyWithImpl<$Res,
        _$SessionDataItemDeviceParamsImpl>
    implements _$$SessionDataItemDeviceParamsImplCopyWith<$Res> {
  __$$SessionDataItemDeviceParamsImplCopyWithImpl(
      _$SessionDataItemDeviceParamsImpl _value,
      $Res Function(_$SessionDataItemDeviceParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? identifier = null,
    Object? brand = null,
    Object? model = null,
    Object? value = null,
  }) {
    return _then(_$SessionDataItemDeviceParamsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDataItemDeviceParamsImpl
    implements _SessionDataItemDeviceParams {
  const _$SessionDataItemDeviceParamsImpl(
      {this.type = "",
      this.identifier = "",
      this.brand = "",
      this.model = "",
      final List<Map<String, dynamic>> value = const []})
      : _value = value;

  factory _$SessionDataItemDeviceParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SessionDataItemDeviceParamsImplFromJson(json);

  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String identifier;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String model;
  final List<Map<String, dynamic>> _value;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get value {
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'SessionDataItemDeviceParams(type: $type, identifier: $identifier, brand: $brand, model: $model, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemDeviceParamsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, identifier, brand, model,
      const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDataItemDeviceParamsImplCopyWith<_$SessionDataItemDeviceParamsImpl>
      get copyWith => __$$SessionDataItemDeviceParamsImplCopyWithImpl<
          _$SessionDataItemDeviceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDataItemDeviceParamsImplToJson(
      this,
    );
  }
}

abstract class _SessionDataItemDeviceParams
    implements SessionDataItemDeviceParams {
  const factory _SessionDataItemDeviceParams(
          {final String type,
          final String identifier,
          final String brand,
          final String model,
          final List<Map<String, dynamic>> value}) =
      _$SessionDataItemDeviceParamsImpl;

  factory _SessionDataItemDeviceParams.fromJson(Map<String, dynamic> json) =
      _$SessionDataItemDeviceParamsImpl.fromJson;

  @override
  String get type;
  @override
  String get identifier;
  @override
  String get brand;
  @override
  String get model;
  @override
  List<Map<String, dynamic>> get value;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemDeviceParamsImplCopyWith<_$SessionDataItemDeviceParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
