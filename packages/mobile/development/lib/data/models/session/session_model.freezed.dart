// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get mood => throw _privateConstructorUsedError;
  ExerciseModel? get exercise => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;
  int? get endTime => throw _privateConstructorUsedError;
  List<SessionTimelineModel>? get timelines =>
      throw _privateConstructorUsedError;
  List<SessionDataItemModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) then) =
      _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? userId,
      String? mood,
      ExerciseModel? exercise,
      int? startTime,
      int? endTime,
      List<SessionTimelineModel>? timelines,
      List<SessionDataItemModel>? data});

  $ExerciseModelCopyWith<$Res>? get exercise;
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? mood = freezed,
    Object? exercise = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timelines = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseModel?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      timelines: freezed == timelines
          ? _value.timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<SessionTimelineModel>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseModelCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseModelCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionModelImplCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$SessionModelImplCopyWith(
          _$SessionModelImpl value, $Res Function(_$SessionModelImpl) then) =
      __$$SessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? userId,
      String? mood,
      ExerciseModel? exercise,
      int? startTime,
      int? endTime,
      List<SessionTimelineModel>? timelines,
      List<SessionDataItemModel>? data});

  @override
  $ExerciseModelCopyWith<$Res>? get exercise;
}

/// @nodoc
class __$$SessionModelImplCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$SessionModelImpl>
    implements _$$SessionModelImplCopyWith<$Res> {
  __$$SessionModelImplCopyWithImpl(
      _$SessionModelImpl _value, $Res Function(_$SessionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? mood = freezed,
    Object? exercise = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timelines = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SessionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseModel?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      timelines: freezed == timelines
          ? _value._timelines
          : timelines // ignore: cast_nullable_to_non_nullable
              as List<SessionTimelineModel>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionModelImpl extends _SessionModel {
  const _$SessionModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.userId,
      this.mood,
      this.exercise,
      this.startTime,
      this.endTime,
      final List<SessionTimelineModel>? timelines,
      final List<SessionDataItemModel>? data})
      : _timelines = timelines,
        _data = data,
        super._();

  factory _$SessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? userId;
  @override
  final String? mood;
  @override
  final ExerciseModel? exercise;
  @override
  final int? startTime;
  @override
  final int? endTime;
  final List<SessionTimelineModel>? _timelines;
  @override
  List<SessionTimelineModel>? get timelines {
    final value = _timelines;
    if (value == null) return null;
    if (_timelines is EqualUnmodifiableListView) return _timelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SessionDataItemModel>? _data;
  @override
  List<SessionDataItemModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionModel(id: $id, userId: $userId, mood: $mood, exercise: $exercise, startTime: $startTime, endTime: $endTime, timelines: $timelines, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality()
                .equals(other._timelines, _timelines) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      mood,
      exercise,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_timelines),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      __$$SessionModelImplCopyWithImpl<_$SessionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionModelImplToJson(
      this,
    );
  }
}

abstract class _SessionModel extends SessionModel {
  const factory _SessionModel(
      {@JsonKey(name: '_id') final String? id,
      final String? userId,
      final String? mood,
      final ExerciseModel? exercise,
      final int? startTime,
      final int? endTime,
      final List<SessionTimelineModel>? timelines,
      final List<SessionDataItemModel>? data}) = _$SessionModelImpl;
  const _SessionModel._() : super._();

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$SessionModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get userId;
  @override
  String? get mood;
  @override
  ExerciseModel? get exercise;
  @override
  int? get startTime;
  @override
  int? get endTime;
  @override
  List<SessionTimelineModel>? get timelines;
  @override
  List<SessionDataItemModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SessionModelImplCopyWith<_$SessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionTimelineModel _$SessionTimelineModelFromJson(Map<String, dynamic> json) {
  return _SessionTimelineModel.fromJson(json);
}

/// @nodoc
mixin _$SessionTimelineModel {
  String? get name => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionTimelineModelCopyWith<SessionTimelineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionTimelineModelCopyWith<$Res> {
  factory $SessionTimelineModelCopyWith(SessionTimelineModel value,
          $Res Function(SessionTimelineModel) then) =
      _$SessionTimelineModelCopyWithImpl<$Res, SessionTimelineModel>;
  @useResult
  $Res call({String? name, int? startTime});
}

/// @nodoc
class _$SessionTimelineModelCopyWithImpl<$Res,
        $Val extends SessionTimelineModel>
    implements $SessionTimelineModelCopyWith<$Res> {
  _$SessionTimelineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionTimelineModelImplCopyWith<$Res>
    implements $SessionTimelineModelCopyWith<$Res> {
  factory _$$SessionTimelineModelImplCopyWith(_$SessionTimelineModelImpl value,
          $Res Function(_$SessionTimelineModelImpl) then) =
      __$$SessionTimelineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, int? startTime});
}

/// @nodoc
class __$$SessionTimelineModelImplCopyWithImpl<$Res>
    extends _$SessionTimelineModelCopyWithImpl<$Res, _$SessionTimelineModelImpl>
    implements _$$SessionTimelineModelImplCopyWith<$Res> {
  __$$SessionTimelineModelImplCopyWithImpl(_$SessionTimelineModelImpl _value,
      $Res Function(_$SessionTimelineModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_$SessionTimelineModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionTimelineModelImpl extends _SessionTimelineModel {
  const _$SessionTimelineModelImpl({this.name, this.startTime}) : super._();

  factory _$SessionTimelineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionTimelineModelImplFromJson(json);

  @override
  final String? name;
  @override
  final int? startTime;

  @override
  String toString() {
    return 'SessionTimelineModel(name: $name, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionTimelineModelImpl &&
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
  _$$SessionTimelineModelImplCopyWith<_$SessionTimelineModelImpl>
      get copyWith =>
          __$$SessionTimelineModelImplCopyWithImpl<_$SessionTimelineModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionTimelineModelImplToJson(
      this,
    );
  }
}

abstract class _SessionTimelineModel extends SessionTimelineModel {
  const factory _SessionTimelineModel(
      {final String? name, final int? startTime}) = _$SessionTimelineModelImpl;
  const _SessionTimelineModel._() : super._();

  factory _SessionTimelineModel.fromJson(Map<String, dynamic> json) =
      _$SessionTimelineModelImpl.fromJson;

  @override
  String? get name;
  @override
  int? get startTime;
  @override
  @JsonKey(ignore: true)
  _$$SessionTimelineModelImplCopyWith<_$SessionTimelineModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SessionDataItemModel _$SessionDataItemModelFromJson(Map<String, dynamic> json) {
  return _SessionDataItemModel.fromJson(json);
}

/// @nodoc
mixin _$SessionDataItemModel {
  int? get second => throw _privateConstructorUsedError;
  int? get timeStamp => throw _privateConstructorUsedError;
  List<SessionDataItemDeviceModel>? get devices =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDataItemModelCopyWith<SessionDataItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemModelCopyWith<$Res> {
  factory $SessionDataItemModelCopyWith(SessionDataItemModel value,
          $Res Function(SessionDataItemModel) then) =
      _$SessionDataItemModelCopyWithImpl<$Res, SessionDataItemModel>;
  @useResult
  $Res call(
      {int? second, int? timeStamp, List<SessionDataItemDeviceModel>? devices});
}

/// @nodoc
class _$SessionDataItemModelCopyWithImpl<$Res,
        $Val extends SessionDataItemModel>
    implements $SessionDataItemModelCopyWith<$Res> {
  _$SessionDataItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? second = freezed,
    Object? timeStamp = freezed,
    Object? devices = freezed,
  }) {
    return _then(_value.copyWith(
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemDeviceModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemModelImplCopyWith<$Res>
    implements $SessionDataItemModelCopyWith<$Res> {
  factory _$$SessionDataItemModelImplCopyWith(_$SessionDataItemModelImpl value,
          $Res Function(_$SessionDataItemModelImpl) then) =
      __$$SessionDataItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? second, int? timeStamp, List<SessionDataItemDeviceModel>? devices});
}

/// @nodoc
class __$$SessionDataItemModelImplCopyWithImpl<$Res>
    extends _$SessionDataItemModelCopyWithImpl<$Res, _$SessionDataItemModelImpl>
    implements _$$SessionDataItemModelImplCopyWith<$Res> {
  __$$SessionDataItemModelImplCopyWithImpl(_$SessionDataItemModelImpl _value,
      $Res Function(_$SessionDataItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? second = freezed,
    Object? timeStamp = freezed,
    Object? devices = freezed,
  }) {
    return _then(_$SessionDataItemModelImpl(
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as int?,
      timeStamp: freezed == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int?,
      devices: freezed == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemDeviceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDataItemModelImpl extends _SessionDataItemModel {
  const _$SessionDataItemModelImpl(
      {this.second,
      this.timeStamp,
      final List<SessionDataItemDeviceModel>? devices})
      : _devices = devices,
        super._();

  factory _$SessionDataItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionDataItemModelImplFromJson(json);

  @override
  final int? second;
  @override
  final int? timeStamp;
  final List<SessionDataItemDeviceModel>? _devices;
  @override
  List<SessionDataItemDeviceModel>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionDataItemModel(second: $second, timeStamp: $timeStamp, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemModelImpl &&
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
  _$$SessionDataItemModelImplCopyWith<_$SessionDataItemModelImpl>
      get copyWith =>
          __$$SessionDataItemModelImplCopyWithImpl<_$SessionDataItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDataItemModelImplToJson(
      this,
    );
  }
}

abstract class _SessionDataItemModel extends SessionDataItemModel {
  const factory _SessionDataItemModel(
          {final int? second,
          final int? timeStamp,
          final List<SessionDataItemDeviceModel>? devices}) =
      _$SessionDataItemModelImpl;
  const _SessionDataItemModel._() : super._();

  factory _SessionDataItemModel.fromJson(Map<String, dynamic> json) =
      _$SessionDataItemModelImpl.fromJson;

  @override
  int? get second;
  @override
  int? get timeStamp;
  @override
  List<SessionDataItemDeviceModel>? get devices;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemModelImplCopyWith<_$SessionDataItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SessionDataItemDeviceModel _$SessionDataItemDeviceModelFromJson(
    Map<String, dynamic> json) {
  return _SessionDataItemDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$SessionDataItemDeviceModel {
  String? get type => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDataItemDeviceModelCopyWith<SessionDataItemDeviceModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemDeviceModelCopyWith<$Res> {
  factory $SessionDataItemDeviceModelCopyWith(SessionDataItemDeviceModel value,
          $Res Function(SessionDataItemDeviceModel) then) =
      _$SessionDataItemDeviceModelCopyWithImpl<$Res,
          SessionDataItemDeviceModel>;
  @useResult
  $Res call(
      {String? type,
      String? identifier,
      String? brand,
      String? model,
      List<Map<String, dynamic>>? value});
}

/// @nodoc
class _$SessionDataItemDeviceModelCopyWithImpl<$Res,
        $Val extends SessionDataItemDeviceModel>
    implements $SessionDataItemDeviceModelCopyWith<$Res> {
  _$SessionDataItemDeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemDeviceModelImplCopyWith<$Res>
    implements $SessionDataItemDeviceModelCopyWith<$Res> {
  factory _$$SessionDataItemDeviceModelImplCopyWith(
          _$SessionDataItemDeviceModelImpl value,
          $Res Function(_$SessionDataItemDeviceModelImpl) then) =
      __$$SessionDataItemDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? identifier,
      String? brand,
      String? model,
      List<Map<String, dynamic>>? value});
}

/// @nodoc
class __$$SessionDataItemDeviceModelImplCopyWithImpl<$Res>
    extends _$SessionDataItemDeviceModelCopyWithImpl<$Res,
        _$SessionDataItemDeviceModelImpl>
    implements _$$SessionDataItemDeviceModelImplCopyWith<$Res> {
  __$$SessionDataItemDeviceModelImplCopyWithImpl(
      _$SessionDataItemDeviceModelImpl _value,
      $Res Function(_$SessionDataItemDeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
    Object? brand = freezed,
    Object? model = freezed,
    Object? value = freezed,
  }) {
    return _then(_$SessionDataItemDeviceModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDataItemDeviceModelImpl extends _SessionDataItemDeviceModel {
  const _$SessionDataItemDeviceModelImpl(
      {this.type,
      this.identifier,
      this.brand,
      this.model,
      final List<Map<String, dynamic>>? value})
      : _value = value,
        super._();

  factory _$SessionDataItemDeviceModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SessionDataItemDeviceModelImplFromJson(json);

  @override
  final String? type;
  @override
  final String? identifier;
  @override
  final String? brand;
  @override
  final String? model;
  final List<Map<String, dynamic>>? _value;
  @override
  List<Map<String, dynamic>>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionDataItemDeviceModel(type: $type, identifier: $identifier, brand: $brand, model: $model, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemDeviceModelImpl &&
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
  _$$SessionDataItemDeviceModelImplCopyWith<_$SessionDataItemDeviceModelImpl>
      get copyWith => __$$SessionDataItemDeviceModelImplCopyWithImpl<
          _$SessionDataItemDeviceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDataItemDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _SessionDataItemDeviceModel extends SessionDataItemDeviceModel {
  const factory _SessionDataItemDeviceModel(
          {final String? type,
          final String? identifier,
          final String? brand,
          final String? model,
          final List<Map<String, dynamic>>? value}) =
      _$SessionDataItemDeviceModelImpl;
  const _SessionDataItemDeviceModel._() : super._();

  factory _SessionDataItemDeviceModel.fromJson(Map<String, dynamic> json) =
      _$SessionDataItemDeviceModelImpl.fromJson;

  @override
  String? get type;
  @override
  String? get identifier;
  @override
  String? get brand;
  @override
  String? get model;
  @override
  List<Map<String, dynamic>>? get value;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemDeviceModelImplCopyWith<_$SessionDataItemDeviceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
