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
  String? get sessionId => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  ExerciseEntity? get exercise => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get exerciseId => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get mood => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get startTime => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get endTime => throw _privateConstructorUsedError;
  @HiveField(7)
  List<SessionTimelineEntity>? get timelines =>
      throw _privateConstructorUsedError;
  @HiveField(8)
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
      {@HiveField(0) String? sessionId,
      @HiveField(1) String? userId,
      @HiveField(2) ExerciseEntity? exercise,
      @HiveField(3) String? exerciseId,
      @HiveField(4) String? mood,
      @HiveField(5) int? startTime,
      @HiveField(6) int? endTime,
      @HiveField(7) List<SessionTimelineEntity>? timelines,
      @HiveField(8) List<SessionDataItemEntity>? data});

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
    Object? sessionId = freezed,
    Object? userId = freezed,
    Object? exercise = freezed,
    Object? exerciseId = freezed,
    Object? mood = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timelines = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      exerciseId: freezed == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@HiveField(0) String? sessionId,
      @HiveField(1) String? userId,
      @HiveField(2) ExerciseEntity? exercise,
      @HiveField(3) String? exerciseId,
      @HiveField(4) String? mood,
      @HiveField(5) int? startTime,
      @HiveField(6) int? endTime,
      @HiveField(7) List<SessionTimelineEntity>? timelines,
      @HiveField(8) List<SessionDataItemEntity>? data});

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
    Object? sessionId = freezed,
    Object? userId = freezed,
    Object? exercise = freezed,
    Object? exerciseId = freezed,
    Object? mood = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? timelines = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SessionEntityImpl(
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      exerciseId: freezed == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as String?,
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

@HiveType(typeId: 5, adapterName: 'SessionEntityAdapter')
class _$SessionEntityImpl implements _SessionEntity {
  const _$SessionEntityImpl(
      {@HiveField(0) this.sessionId,
      @HiveField(1) this.userId,
      @HiveField(2) this.exercise,
      @HiveField(3) this.exerciseId,
      @HiveField(4) this.mood,
      @HiveField(5) this.startTime,
      @HiveField(6) this.endTime,
      @HiveField(7) final List<SessionTimelineEntity>? timelines,
      @HiveField(8) final List<SessionDataItemEntity>? data})
      : _timelines = timelines,
        _data = data;

  @override
  @HiveField(0)
  final String? sessionId;
  @override
  @HiveField(1)
  final String? userId;
  @override
  @HiveField(2)
  final ExerciseEntity? exercise;
  @override
  @HiveField(3)
  final String? exerciseId;
  @override
  @HiveField(4)
  final String? mood;
  @override
  @HiveField(5)
  final int? startTime;
  @override
  @HiveField(6)
  final int? endTime;
  final List<SessionTimelineEntity>? _timelines;
  @override
  @HiveField(7)
  List<SessionTimelineEntity>? get timelines {
    final value = _timelines;
    if (value == null) return null;
    if (_timelines is EqualUnmodifiableListView) return _timelines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SessionDataItemEntity>? _data;
  @override
  @HiveField(8)
  List<SessionDataItemEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SessionEntity(sessionId: $sessionId, userId: $userId, exercise: $exercise, exerciseId: $exerciseId, mood: $mood, startTime: $startTime, endTime: $endTime, timelines: $timelines, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionEntityImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.mood, mood) || other.mood == mood) &&
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
      sessionId,
      userId,
      exercise,
      exerciseId,
      mood,
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
          {@HiveField(0) final String? sessionId,
          @HiveField(1) final String? userId,
          @HiveField(2) final ExerciseEntity? exercise,
          @HiveField(3) final String? exerciseId,
          @HiveField(4) final String? mood,
          @HiveField(5) final int? startTime,
          @HiveField(6) final int? endTime,
          @HiveField(7) final List<SessionTimelineEntity>? timelines,
          @HiveField(8) final List<SessionDataItemEntity>? data}) =
      _$SessionEntityImpl;

  @override
  @HiveField(0)
  String? get sessionId;
  @override
  @HiveField(1)
  String? get userId;
  @override
  @HiveField(2)
  ExerciseEntity? get exercise;
  @override
  @HiveField(3)
  String? get exerciseId;
  @override
  @HiveField(4)
  String? get mood;
  @override
  @HiveField(5)
  int? get startTime;
  @override
  @HiveField(6)
  int? get endTime;
  @override
  @HiveField(7)
  List<SessionTimelineEntity>? get timelines;
  @override
  @HiveField(8)
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

@HiveType(typeId: 6, adapterName: 'SessionTimelineEntityAdapter')
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
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get value => throw _privateConstructorUsedError;

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
  $Res call({@HiveField(0) String? name, @HiveField(1) String? value});
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
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({@HiveField(0) String? name, @HiveField(1) String? value});
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
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_$SessionDataItemEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 7, adapterName: 'SessionDataItemEntityAdapter')
class _$SessionDataItemEntityImpl implements _SessionDataItemEntity {
  const _$SessionDataItemEntityImpl(
      {@HiveField(0) this.name, @HiveField(1) this.value});

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? value;

  @override
  String toString() {
    return 'SessionDataItemEntity(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDataItemEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDataItemEntityImplCopyWith<_$SessionDataItemEntityImpl>
      get copyWith => __$$SessionDataItemEntityImplCopyWithImpl<
          _$SessionDataItemEntityImpl>(this, _$identity);
}

abstract class _SessionDataItemEntity implements SessionDataItemEntity {
  const factory _SessionDataItemEntity(
      {@HiveField(0) final String? name,
      @HiveField(1) final String? value}) = _$SessionDataItemEntityImpl;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$SessionDataItemEntityImplCopyWith<_$SessionDataItemEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
