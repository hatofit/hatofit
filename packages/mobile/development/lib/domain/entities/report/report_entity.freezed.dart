// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get sessionId => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get exerciseId => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get startTime => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get endTime => throw _privateConstructorUsedError;
  @HiveField(5)
  List<ReportDeviceEntity>? get devices => throw _privateConstructorUsedError;
  @HiveField(6)
  List<ReportDataEntity>? get reports => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportEntityCopyWith<ReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEntityCopyWith<$Res> {
  factory $ReportEntityCopyWith(
          ReportEntity value, $Res Function(ReportEntity) then) =
      _$ReportEntityCopyWithImpl<$Res, ReportEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? sessionId,
      @HiveField(2) String? exerciseId,
      @HiveField(3) int? startTime,
      @HiveField(4) int? endTime,
      @HiveField(5) List<ReportDeviceEntity>? devices,
      @HiveField(6) List<ReportDataEntity>? reports});
}

/// @nodoc
class _$ReportEntityCopyWithImpl<$Res, $Val extends ReportEntity>
    implements $ReportEntityCopyWith<$Res> {
  _$ReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = freezed,
    Object? exerciseId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? devices = freezed,
    Object? reports = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseId: freezed == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      devices: freezed == devices
          ? _value.devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<ReportDeviceEntity>?,
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportDataEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportEntityImplCopyWith<$Res>
    implements $ReportEntityCopyWith<$Res> {
  factory _$$ReportEntityImplCopyWith(
          _$ReportEntityImpl value, $Res Function(_$ReportEntityImpl) then) =
      __$$ReportEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? sessionId,
      @HiveField(2) String? exerciseId,
      @HiveField(3) int? startTime,
      @HiveField(4) int? endTime,
      @HiveField(5) List<ReportDeviceEntity>? devices,
      @HiveField(6) List<ReportDataEntity>? reports});
}

/// @nodoc
class __$$ReportEntityImplCopyWithImpl<$Res>
    extends _$ReportEntityCopyWithImpl<$Res, _$ReportEntityImpl>
    implements _$$ReportEntityImplCopyWith<$Res> {
  __$$ReportEntityImplCopyWithImpl(
      _$ReportEntityImpl _value, $Res Function(_$ReportEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sessionId = freezed,
    Object? exerciseId = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? devices = freezed,
    Object? reports = freezed,
  }) {
    return _then(_$ReportEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      exerciseId: freezed == exerciseId
          ? _value.exerciseId
          : exerciseId // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as int?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as int?,
      devices: freezed == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<ReportDeviceEntity>?,
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportDataEntity>?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.reportEntityIndex,
    adapterName: BoxTypeId.reportEntityAdapterName)
class _$ReportEntityImpl implements _ReportEntity {
  const _$ReportEntityImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.sessionId,
      @HiveField(2) this.exerciseId,
      @HiveField(3) this.startTime,
      @HiveField(4) this.endTime,
      @HiveField(5) final List<ReportDeviceEntity>? devices,
      @HiveField(6) final List<ReportDataEntity>? reports})
      : _devices = devices,
        _reports = reports;

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? sessionId;
  @override
  @HiveField(2)
  final String? exerciseId;
  @override
  @HiveField(3)
  final int? startTime;
  @override
  @HiveField(4)
  final int? endTime;
  final List<ReportDeviceEntity>? _devices;
  @override
  @HiveField(5)
  List<ReportDeviceEntity>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReportDataEntity>? _reports;
  @override
  @HiveField(6)
  List<ReportDataEntity>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportEntity(id: $id, sessionId: $sessionId, exerciseId: $exerciseId, startTime: $startTime, endTime: $endTime, devices: $devices, reports: $reports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.exerciseId, exerciseId) ||
                other.exerciseId == exerciseId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._devices, _devices) &&
            const DeepCollectionEquality().equals(other._reports, _reports));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      sessionId,
      exerciseId,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_devices),
      const DeepCollectionEquality().hash(_reports));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportEntityImplCopyWith<_$ReportEntityImpl> get copyWith =>
      __$$ReportEntityImplCopyWithImpl<_$ReportEntityImpl>(this, _$identity);
}

abstract class _ReportEntity implements ReportEntity {
  const factory _ReportEntity(
          {@HiveField(0) final String? id,
          @HiveField(1) final String? sessionId,
          @HiveField(2) final String? exerciseId,
          @HiveField(3) final int? startTime,
          @HiveField(4) final int? endTime,
          @HiveField(5) final List<ReportDeviceEntity>? devices,
          @HiveField(6) final List<ReportDataEntity>? reports}) =
      _$ReportEntityImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get sessionId;
  @override
  @HiveField(2)
  String? get exerciseId;
  @override
  @HiveField(3)
  int? get startTime;
  @override
  @HiveField(4)
  int? get endTime;
  @override
  @HiveField(5)
  List<ReportDeviceEntity>? get devices;
  @override
  @HiveField(6)
  List<ReportDataEntity>? get reports;
  @override
  @JsonKey(ignore: true)
  _$$ReportEntityImplCopyWith<_$ReportEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportDeviceEntity {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get identifier => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportDeviceEntityCopyWith<ReportDeviceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDeviceEntityCopyWith<$Res> {
  factory $ReportDeviceEntityCopyWith(
          ReportDeviceEntity value, $Res Function(ReportDeviceEntity) then) =
      _$ReportDeviceEntityCopyWithImpl<$Res, ReportDeviceEntity>;
  @useResult
  $Res call({@HiveField(0) String? name, @HiveField(1) String? identifier});
}

/// @nodoc
class _$ReportDeviceEntityCopyWithImpl<$Res, $Val extends ReportDeviceEntity>
    implements $ReportDeviceEntityCopyWith<$Res> {
  _$ReportDeviceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDeviceEntityImplCopyWith<$Res>
    implements $ReportDeviceEntityCopyWith<$Res> {
  factory _$$ReportDeviceEntityImplCopyWith(_$ReportDeviceEntityImpl value,
          $Res Function(_$ReportDeviceEntityImpl) then) =
      __$$ReportDeviceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) String? name, @HiveField(1) String? identifier});
}

/// @nodoc
class __$$ReportDeviceEntityImplCopyWithImpl<$Res>
    extends _$ReportDeviceEntityCopyWithImpl<$Res, _$ReportDeviceEntityImpl>
    implements _$$ReportDeviceEntityImplCopyWith<$Res> {
  __$$ReportDeviceEntityImplCopyWithImpl(_$ReportDeviceEntityImpl _value,
      $Res Function(_$ReportDeviceEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$ReportDeviceEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.reportDeviceEntityIndex,
    adapterName: BoxTypeId.reportDeviceEntityAdapterName)
class _$ReportDeviceEntityImpl implements _ReportDeviceEntity {
  const _$ReportDeviceEntityImpl(
      {@HiveField(0) this.name, @HiveField(1) this.identifier});

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? identifier;

  @override
  String toString() {
    return 'ReportDeviceEntity(name: $name, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDeviceEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDeviceEntityImplCopyWith<_$ReportDeviceEntityImpl> get copyWith =>
      __$$ReportDeviceEntityImplCopyWithImpl<_$ReportDeviceEntityImpl>(
          this, _$identity);
}

abstract class _ReportDeviceEntity implements ReportDeviceEntity {
  const factory _ReportDeviceEntity(
      {@HiveField(0) final String? name,
      @HiveField(1) final String? identifier}) = _$ReportDeviceEntityImpl;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$ReportDeviceEntityImplCopyWith<_$ReportDeviceEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportDataEntity {
  @HiveField(0)
  String? get type => throw _privateConstructorUsedError;
  @HiveField(1)
  List<ReportDataValueEntity>? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportDataEntityCopyWith<ReportDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataEntityCopyWith<$Res> {
  factory $ReportDataEntityCopyWith(
          ReportDataEntity value, $Res Function(ReportDataEntity) then) =
      _$ReportDataEntityCopyWithImpl<$Res, ReportDataEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? type,
      @HiveField(1) List<ReportDataValueEntity>? data});
}

/// @nodoc
class _$ReportDataEntityCopyWithImpl<$Res, $Val extends ReportDataEntity>
    implements $ReportDataEntityCopyWith<$Res> {
  _$ReportDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportDataValueEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDataEntityImplCopyWith<$Res>
    implements $ReportDataEntityCopyWith<$Res> {
  factory _$$ReportDataEntityImplCopyWith(_$ReportDataEntityImpl value,
          $Res Function(_$ReportDataEntityImpl) then) =
      __$$ReportDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? type,
      @HiveField(1) List<ReportDataValueEntity>? data});
}

/// @nodoc
class __$$ReportDataEntityImplCopyWithImpl<$Res>
    extends _$ReportDataEntityCopyWithImpl<$Res, _$ReportDataEntityImpl>
    implements _$$ReportDataEntityImplCopyWith<$Res> {
  __$$ReportDataEntityImplCopyWithImpl(_$ReportDataEntityImpl _value,
      $Res Function(_$ReportDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ReportDataEntityImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportDataValueEntity>?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.reportDataEntityIndex,
    adapterName: BoxTypeId.reportDataEntityAdapterName)
class _$ReportDataEntityImpl implements _ReportDataEntity {
  const _$ReportDataEntityImpl(
      {@HiveField(0) this.type,
      @HiveField(1) final List<ReportDataValueEntity>? data})
      : _data = data;

  @override
  @HiveField(0)
  final String? type;
  final List<ReportDataValueEntity>? _data;
  @override
  @HiveField(1)
  List<ReportDataValueEntity>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportDataEntity(type: $type, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataEntityImplCopyWith<_$ReportDataEntityImpl> get copyWith =>
      __$$ReportDataEntityImplCopyWithImpl<_$ReportDataEntityImpl>(
          this, _$identity);
}

abstract class _ReportDataEntity implements ReportDataEntity {
  const factory _ReportDataEntity(
          {@HiveField(0) final String? type,
          @HiveField(1) final List<ReportDataValueEntity>? data}) =
      _$ReportDataEntityImpl;

  @override
  @HiveField(0)
  String? get type;
  @override
  @HiveField(1)
  List<ReportDataValueEntity>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataEntityImplCopyWith<_$ReportDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportDataValueEntity {
  @HiveField(0)
  String? get device => throw _privateConstructorUsedError;
  @HiveField(1)
  List<List<dynamic>>? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportDataValueEntityCopyWith<ReportDataValueEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataValueEntityCopyWith<$Res> {
  factory $ReportDataValueEntityCopyWith(ReportDataValueEntity value,
          $Res Function(ReportDataValueEntity) then) =
      _$ReportDataValueEntityCopyWithImpl<$Res, ReportDataValueEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? device, @HiveField(1) List<List<dynamic>>? value});
}

/// @nodoc
class _$ReportDataValueEntityCopyWithImpl<$Res,
        $Val extends ReportDataValueEntity>
    implements $ReportDataValueEntityCopyWith<$Res> {
  _$ReportDataValueEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDataValueEntityImplCopyWith<$Res>
    implements $ReportDataValueEntityCopyWith<$Res> {
  factory _$$ReportDataValueEntityImplCopyWith(
          _$ReportDataValueEntityImpl value,
          $Res Function(_$ReportDataValueEntityImpl) then) =
      __$$ReportDataValueEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? device, @HiveField(1) List<List<dynamic>>? value});
}

/// @nodoc
class __$$ReportDataValueEntityImplCopyWithImpl<$Res>
    extends _$ReportDataValueEntityCopyWithImpl<$Res,
        _$ReportDataValueEntityImpl>
    implements _$$ReportDataValueEntityImplCopyWith<$Res> {
  __$$ReportDataValueEntityImplCopyWithImpl(_$ReportDataValueEntityImpl _value,
      $Res Function(_$ReportDataValueEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ReportDataValueEntityImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>?,
    ));
  }
}

/// @nodoc

@HiveType(
    typeId: BoxTypeId.reportDataValueEntityIndex,
    adapterName: BoxTypeId.reportDataValueEntityAdapterName)
class _$ReportDataValueEntityImpl implements _ReportDataValueEntity {
  const _$ReportDataValueEntityImpl(
      {@HiveField(0) this.device,
      @HiveField(1) final List<List<dynamic>>? value})
      : _value = value;

  @override
  @HiveField(0)
  final String? device;
  final List<List<dynamic>>? _value;
  @override
  @HiveField(1)
  List<List<dynamic>>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportDataValueEntity(device: $device, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataValueEntityImpl &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, device, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataValueEntityImplCopyWith<_$ReportDataValueEntityImpl>
      get copyWith => __$$ReportDataValueEntityImplCopyWithImpl<
          _$ReportDataValueEntityImpl>(this, _$identity);
}

abstract class _ReportDataValueEntity implements ReportDataValueEntity {
  const factory _ReportDataValueEntity(
          {@HiveField(0) final String? device,
          @HiveField(1) final List<List<dynamic>>? value}) =
      _$ReportDataValueEntityImpl;

  @override
  @HiveField(0)
  String? get device;
  @override
  @HiveField(1)
  List<List<dynamic>>? get value;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataValueEntityImplCopyWith<_$ReportDataValueEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
