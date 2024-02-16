// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get mood => throw _privateConstructorUsedError;
  @HiveField(3)
  ExerciseEntity? get exercise => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get startTime => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get endTime => throw _privateConstructorUsedError;
  @HiveField(6)
  List<SessionTimelineEntity>? get timelines =>
      throw _privateConstructorUsedError;
  @HiveField(7)
  List<SessionDataItemEntity>? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionEntityCopyWith<SessionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEntityCopyWith<$Res> {
  factory $SessionEntityCopyWith(
          SessionEntity value, $Res Function(SessionEntity) then) =
      _$SessionEntityCopyWithImpl<$Res, SessionEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? userId,
      @HiveField(2) String? mood,
      @HiveField(3) ExerciseEntity? exercise,
      @HiveField(4) int? startTime,
      @HiveField(5) int? endTime,
      @HiveField(6) List<SessionTimelineEntity>? timelines,
      @HiveField(7) List<SessionDataItemEntity>? data});

  $ExerciseEntityCopyWith<$Res>? get exercise;
}

/// @nodoc
class _$SessionEntityCopyWithImpl<$Res, $Val extends SessionEntity>
    implements $SessionEntityCopyWith<$Res> {
  _$SessionEntityCopyWithImpl(this._value, this._then);

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
              as ExerciseEntity?,
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
              as List<SessionTimelineEntity>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemEntity>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseEntityCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseEntityCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionEntityImplCopyWith<$Res>
    implements $SessionEntityCopyWith<$Res> {
  factory _$$SessionEntityImplCopyWith(
          _$SessionEntityImpl value, $Res Function(_$SessionEntityImpl) then) =
      __$$SessionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? userId,
      @HiveField(2) String? mood,
      @HiveField(3) ExerciseEntity? exercise,
      @HiveField(4) int? startTime,
      @HiveField(5) int? endTime,
      @HiveField(6) List<SessionTimelineEntity>? timelines,
      @HiveField(7) List<SessionDataItemEntity>? data});

  @override
  $ExerciseEntityCopyWith<$Res>? get exercise;
}

/// @nodoc
class __$$SessionEntityImplCopyWithImpl<$Res>
    extends _$SessionEntityCopyWithImpl<$Res, _$SessionEntityImpl>
    implements _$$SessionEntityImplCopyWith<$Res> {
  __$$SessionEntityImplCopyWithImpl(
      _$SessionEntityImpl _value, $Res Function(_$SessionEntityImpl) _then)
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
    return _then(_$SessionEntityImpl(
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
              as ExerciseEntity?,
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
              as List<SessionTimelineEntity>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SessionDataItemEntity>?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.sessionEntityIndex,
    adapterName: BoxTypeId.sessionEntityAdapterName)
class _$SessionEntityImpl implements _SessionEntity {
  const _$SessionEntityImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.userId,
      @HiveField(2) this.mood,
      @HiveField(3) this.exercise,
      @HiveField(4) this.startTime,
      @HiveField(5) this.endTime,
      @HiveField(6) final List<SessionTimelineEntity>? timelines,
      @HiveField(7) final List<SessionDataItemEntity>? data})
      : _timelines = timelines,
        _data = data;

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? userId;
  @override
  @HiveField(2)
  final String? mood;
  @override
  @HiveField(3)
  final ExerciseEntity? exercise;
  @override
  @HiveField(4)
  final int? startTime;
  @override
  @HiveField(5)
  final int? endTime;
  final List<SessionTimelineEntity>? _timelines;
  @override
  @HiveField(6)
  List<SessionTimelineEntity>? get timelines {
    final value = _timelines;
    if (value == null) return null;
    if (_timelines is EqualUnmodifiableListView) return _timelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SessionDataItemEntity>? _data;
  @override
  @HiveField(7)
  List<SessionDataItemEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionEntity(id: $id, userId: $userId, mood: $mood, exercise: $exercise, startTime: $startTime, endTime: $endTime, timelines: $timelines, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionEntityImpl &&
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
  _$$SessionEntityImplCopyWith<_$SessionEntityImpl> get copyWith =>
      __$$SessionEntityImplCopyWithImpl<_$SessionEntityImpl>(this, _$identity);
}

abstract class _SessionEntity implements SessionEntity {
  const factory _SessionEntity(
          {@HiveField(0) final String? id,
          @HiveField(1) final String? userId,
          @HiveField(2) final String? mood,
          @HiveField(3) final ExerciseEntity? exercise,
          @HiveField(4) final int? startTime,
          @HiveField(5) final int? endTime,
          @HiveField(6) final List<SessionTimelineEntity>? timelines,
          @HiveField(7) final List<SessionDataItemEntity>? data}) =
      _$SessionEntityImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get userId;
  @override
  @HiveField(2)
  String? get mood;
  @override
  @HiveField(3)
  ExerciseEntity? get exercise;
  @override
  @HiveField(4)
  int? get startTime;
  @override
  @HiveField(5)
  int? get endTime;
  @override
  @HiveField(6)
  List<SessionTimelineEntity>? get timelines;
  @override
  @HiveField(7)
  List<SessionDataItemEntity>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SessionEntityImplCopyWith<_$SessionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionTimelineEntity {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get startTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionTimelineEntityCopyWith<SessionTimelineEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionTimelineEntityCopyWith<$Res> {
  factory $SessionTimelineEntityCopyWith(SessionTimelineEntity value,
          $Res Function(SessionTimelineEntity) then) =
      _$SessionTimelineEntityCopyWithImpl<$Res, SessionTimelineEntity>;
  @useResult
  $Res call({@HiveField(0) String? name, @HiveField(1) int? startTime});
}

/// @nodoc
class _$SessionTimelineEntityCopyWithImpl<$Res,
        $Val extends SessionTimelineEntity>
    implements $SessionTimelineEntityCopyWith<$Res> {
  _$SessionTimelineEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$SessionTimelineEntityImplCopyWith<$Res>
    implements $SessionTimelineEntityCopyWith<$Res> {
  factory _$$SessionTimelineEntityImplCopyWith(
          _$SessionTimelineEntityImpl value,
          $Res Function(_$SessionTimelineEntityImpl) then) =
      __$$SessionTimelineEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? name, @HiveField(1) int? startTime});
}

/// @nodoc
class __$$SessionTimelineEntityImplCopyWithImpl<$Res>
    extends _$SessionTimelineEntityCopyWithImpl<$Res,
        _$SessionTimelineEntityImpl>
    implements _$$SessionTimelineEntityImplCopyWith<$Res> {
  __$$SessionTimelineEntityImplCopyWithImpl(_$SessionTimelineEntityImpl _value,
      $Res Function(_$SessionTimelineEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? startTime = freezed,
  }) {
    return _then(_$SessionTimelineEntityImpl(
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

@HiveType(
    typeId: BoxTypeId.sessionTimelineEntityIndex,
    adapterName: BoxTypeId.sessionTimelineEntityAdapterName)
class _$SessionTimelineEntityImpl implements _SessionTimelineEntity {
  const _$SessionTimelineEntityImpl(
      {@HiveField(0) this.name, @HiveField(1) this.startTime});

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final int? startTime;

  @override
  String toString() {
    return 'SessionTimelineEntity(name: $name, startTime: $startTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionTimelineEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionTimelineEntityImplCopyWith<_$SessionTimelineEntityImpl>
      get copyWith => __$$SessionTimelineEntityImplCopyWithImpl<
          _$SessionTimelineEntityImpl>(this, _$identity);
}

abstract class _SessionTimelineEntity implements SessionTimelineEntity {
  const factory _SessionTimelineEntity(
      {@HiveField(0) final String? name,
      @HiveField(1) final int? startTime}) = _$SessionTimelineEntityImpl;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  int? get startTime;
  @override
  @JsonKey(ignore: true)
  _$$SessionTimelineEntityImplCopyWith<_$SessionTimelineEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionDataItemEntity {
  @HiveField(0)
  int? get second => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get timeStamp => throw _privateConstructorUsedError;
  @HiveField(2)
  List<SessionDataItemDeviceEntity>? get devices =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionDataItemEntityCopyWith<SessionDataItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemEntityCopyWith<$Res> {
  factory $SessionDataItemEntityCopyWith(SessionDataItemEntity value,
          $Res Function(SessionDataItemEntity) then) =
      _$SessionDataItemEntityCopyWithImpl<$Res, SessionDataItemEntity>;
  @useResult
  $Res call(
      {@HiveField(0) int? second,
      @HiveField(1) int? timeStamp,
      @HiveField(2) List<SessionDataItemDeviceEntity>? devices});
}

/// @nodoc
class _$SessionDataItemEntityCopyWithImpl<$Res,
        $Val extends SessionDataItemEntity>
    implements $SessionDataItemEntityCopyWith<$Res> {
  _$SessionDataItemEntityCopyWithImpl(this._value, this._then);

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
              as List<SessionDataItemDeviceEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemEntityImplCopyWith<$Res>
    implements $SessionDataItemEntityCopyWith<$Res> {
  factory _$$SessionDataItemEntityImplCopyWith(
          _$SessionDataItemEntityImpl value,
          $Res Function(_$SessionDataItemEntityImpl) then) =
      __$$SessionDataItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? second,
      @HiveField(1) int? timeStamp,
      @HiveField(2) List<SessionDataItemDeviceEntity>? devices});
}

/// @nodoc
class __$$SessionDataItemEntityImplCopyWithImpl<$Res>
    extends _$SessionDataItemEntityCopyWithImpl<$Res,
        _$SessionDataItemEntityImpl>
    implements _$$SessionDataItemEntityImplCopyWith<$Res> {
  __$$SessionDataItemEntityImplCopyWithImpl(_$SessionDataItemEntityImpl _value,
      $Res Function(_$SessionDataItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? second = freezed,
    Object? timeStamp = freezed,
    Object? devices = freezed,
  }) {
    return _then(_$SessionDataItemEntityImpl(
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
              as List<SessionDataItemDeviceEntity>?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.sessionDataItemEntityIndex,
    adapterName: BoxTypeId.sessionDataItemEntityAdapterName)
class _$SessionDataItemEntityImpl implements _SessionDataItemEntity {
  const _$SessionDataItemEntityImpl(
      {@HiveField(0) this.second,
      @HiveField(1) this.timeStamp,
      @HiveField(2) final List<SessionDataItemDeviceEntity>? devices})
      : _devices = devices;

  @override
  @HiveField(0)
  final int? second;
  @override
  @HiveField(1)
  final int? timeStamp;
  final List<SessionDataItemDeviceEntity>? _devices;
  @override
  @HiveField(2)
  List<SessionDataItemDeviceEntity>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionDataItemEntity(second: $second, timeStamp: $timeStamp, devices: $devices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemEntityImpl &&
            (identical(other.second, second) || other.second == second) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode => Object.hash(runtimeType, second, timeStamp,
      const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDataItemEntityImplCopyWith<_$SessionDataItemEntityImpl>
      get copyWith => __$$SessionDataItemEntityImplCopyWithImpl<
          _$SessionDataItemEntityImpl>(this, _$identity);
}

abstract class _SessionDataItemEntity implements SessionDataItemEntity {
  const factory _SessionDataItemEntity(
          {@HiveField(0) final int? second,
          @HiveField(1) final int? timeStamp,
          @HiveField(2) final List<SessionDataItemDeviceEntity>? devices}) =
      _$SessionDataItemEntityImpl;

  @override
  @HiveField(0)
  int? get second;
  @override
  @HiveField(1)
  int? get timeStamp;
  @override
  @HiveField(2)
  List<SessionDataItemDeviceEntity>? get devices;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemEntityImplCopyWith<_$SessionDataItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SessionDataItemDeviceEntity {
  @HiveField(0)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get identifier => throw _privateConstructorUsedError;
  @HiveField(2)
  List<Map<String, dynamic>>? get value => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get brand => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionDataItemDeviceEntityCopyWith<SessionDataItemDeviceEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDataItemDeviceEntityCopyWith<$Res> {
  factory $SessionDataItemDeviceEntityCopyWith(
          SessionDataItemDeviceEntity value,
          $Res Function(SessionDataItemDeviceEntity) then) =
      _$SessionDataItemDeviceEntityCopyWithImpl<$Res,
          SessionDataItemDeviceEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? type,
      @HiveField(1) String? identifier,
      @HiveField(2) List<Map<String, dynamic>>? value,
      @HiveField(3) String? brand,
      @HiveField(4) String? model});
}

/// @nodoc
class _$SessionDataItemDeviceEntityCopyWithImpl<$Res,
        $Val extends SessionDataItemDeviceEntity>
    implements $SessionDataItemDeviceEntityCopyWith<$Res> {
  _$SessionDataItemDeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
    Object? value = freezed,
    Object? brand = freezed,
    Object? model = freezed,
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
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionDataItemDeviceEntityImplCopyWith<$Res>
    implements $SessionDataItemDeviceEntityCopyWith<$Res> {
  factory _$$SessionDataItemDeviceEntityImplCopyWith(
          _$SessionDataItemDeviceEntityImpl value,
          $Res Function(_$SessionDataItemDeviceEntityImpl) then) =
      __$$SessionDataItemDeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? type,
      @HiveField(1) String? identifier,
      @HiveField(2) List<Map<String, dynamic>>? value,
      @HiveField(3) String? brand,
      @HiveField(4) String? model});
}

/// @nodoc
class __$$SessionDataItemDeviceEntityImplCopyWithImpl<$Res>
    extends _$SessionDataItemDeviceEntityCopyWithImpl<$Res,
        _$SessionDataItemDeviceEntityImpl>
    implements _$$SessionDataItemDeviceEntityImplCopyWith<$Res> {
  __$$SessionDataItemDeviceEntityImplCopyWithImpl(
      _$SessionDataItemDeviceEntityImpl _value,
      $Res Function(_$SessionDataItemDeviceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
    Object? value = freezed,
    Object? brand = freezed,
    Object? model = freezed,
  }) {
    return _then(_$SessionDataItemDeviceEntityImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.sessionDataItemDeviceEntityIndex,
    adapterName: BoxTypeId.sessionDataItemDeviceEntityAdapterName)
class _$SessionDataItemDeviceEntityImpl
    implements _SessionDataItemDeviceEntity {
  const _$SessionDataItemDeviceEntityImpl(
      {@HiveField(0) this.type,
      @HiveField(1) this.identifier,
      @HiveField(2) final List<Map<String, dynamic>>? value,
      @HiveField(3) this.brand,
      @HiveField(4) this.model})
      : _value = value;

  @override
  @HiveField(0)
  final String? type;
  @override
  @HiveField(1)
  final String? identifier;
  final List<Map<String, dynamic>>? _value;
  @override
  @HiveField(2)
  List<Map<String, dynamic>>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(3)
  final String? brand;
  @override
  @HiveField(4)
  final String? model;

  @override
  String toString() {
    return 'SessionDataItemDeviceEntity(type: $type, identifier: $identifier, value: $value, brand: $brand, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemDeviceEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            const DeepCollectionEquality().equals(other._value, _value) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, identifier,
      const DeepCollectionEquality().hash(_value), brand, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDataItemDeviceEntityImplCopyWith<_$SessionDataItemDeviceEntityImpl>
      get copyWith => __$$SessionDataItemDeviceEntityImplCopyWithImpl<
          _$SessionDataItemDeviceEntityImpl>(this, _$identity);
}

abstract class _SessionDataItemDeviceEntity
    implements SessionDataItemDeviceEntity {
  const factory _SessionDataItemDeviceEntity(
      {@HiveField(0) final String? type,
      @HiveField(1) final String? identifier,
      @HiveField(2) final List<Map<String, dynamic>>? value,
      @HiveField(3) final String? brand,
      @HiveField(4) final String? model}) = _$SessionDataItemDeviceEntityImpl;

  @override
  @HiveField(0)
  String? get type;
  @override
  @HiveField(1)
  String? get identifier;
  @override
  @HiveField(2)
  List<Map<String, dynamic>>? get value;
  @override
  @HiveField(3)
  String? get brand;
  @override
  @HiveField(4)
  String? get model;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemDeviceEntityImplCopyWith<_$SessionDataItemDeviceEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
