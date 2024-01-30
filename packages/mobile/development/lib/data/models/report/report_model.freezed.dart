// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
mixin _$ReportModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;
  String? get exerciseId => throw _privateConstructorUsedError;
  int? get startTime => throw _privateConstructorUsedError;
  int? get endTime => throw _privateConstructorUsedError;
  List<ReportDeviceModel>? get devices => throw _privateConstructorUsedError;
  List<ReportDataModel>? get reports => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportModelCopyWith<ReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res, ReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? sessionId,
      String? exerciseId,
      int? startTime,
      int? endTime,
      List<ReportDeviceModel>? devices,
      List<ReportDataModel>? reports});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res, $Val extends ReportModel>
    implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

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
              as List<ReportDeviceModel>?,
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportModelImplCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$$ReportModelImplCopyWith(
          _$ReportModelImpl value, $Res Function(_$ReportModelImpl) then) =
      __$$ReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? sessionId,
      String? exerciseId,
      int? startTime,
      int? endTime,
      List<ReportDeviceModel>? devices,
      List<ReportDataModel>? reports});
}

/// @nodoc
class __$$ReportModelImplCopyWithImpl<$Res>
    extends _$ReportModelCopyWithImpl<$Res, _$ReportModelImpl>
    implements _$$ReportModelImplCopyWith<$Res> {
  __$$ReportModelImplCopyWithImpl(
      _$ReportModelImpl _value, $Res Function(_$ReportModelImpl) _then)
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
    return _then(_$ReportModelImpl(
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
              as List<ReportDeviceModel>?,
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportModelImpl extends _ReportModel {
  const _$ReportModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.sessionId,
      this.exerciseId,
      this.startTime,
      this.endTime,
      final List<ReportDeviceModel>? devices,
      final List<ReportDataModel>? reports})
      : _devices = devices,
        _reports = reports,
        super._();

  factory _$ReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? sessionId;
  @override
  final String? exerciseId;
  @override
  final int? startTime;
  @override
  final int? endTime;
  final List<ReportDeviceModel>? _devices;
  @override
  List<ReportDeviceModel>? get devices {
    final value = _devices;
    if (value == null) return null;
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReportDataModel>? _reports;
  @override
  List<ReportDataModel>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportModel(id: $id, sessionId: $sessionId, exerciseId: $exerciseId, startTime: $startTime, endTime: $endTime, devices: $devices, reports: $reports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportModelImpl &&
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

  @JsonKey(ignore: true)
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
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      __$$ReportModelImplCopyWithImpl<_$ReportModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportModelImplToJson(
      this,
    );
  }
}

abstract class _ReportModel extends ReportModel {
  const factory _ReportModel(
      {@JsonKey(name: '_id') final String? id,
      final String? sessionId,
      final String? exerciseId,
      final int? startTime,
      final int? endTime,
      final List<ReportDeviceModel>? devices,
      final List<ReportDataModel>? reports}) = _$ReportModelImpl;
  const _ReportModel._() : super._();

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$ReportModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get sessionId;
  @override
  String? get exerciseId;
  @override
  int? get startTime;
  @override
  int? get endTime;
  @override
  List<ReportDeviceModel>? get devices;
  @override
  List<ReportDataModel>? get reports;
  @override
  @JsonKey(ignore: true)
  _$$ReportModelImplCopyWith<_$ReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportDeviceModel _$ReportDeviceModelFromJson(Map<String, dynamic> json) {
  return _ReportDeviceModel.fromJson(json);
}

/// @nodoc
mixin _$ReportDeviceModel {
  String? get name => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDeviceModelCopyWith<ReportDeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDeviceModelCopyWith<$Res> {
  factory $ReportDeviceModelCopyWith(
          ReportDeviceModel value, $Res Function(ReportDeviceModel) then) =
      _$ReportDeviceModelCopyWithImpl<$Res, ReportDeviceModel>;
  @useResult
  $Res call({String? name, String? identifier});
}

/// @nodoc
class _$ReportDeviceModelCopyWithImpl<$Res, $Val extends ReportDeviceModel>
    implements $ReportDeviceModelCopyWith<$Res> {
  _$ReportDeviceModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ReportDeviceModelImplCopyWith<$Res>
    implements $ReportDeviceModelCopyWith<$Res> {
  factory _$$ReportDeviceModelImplCopyWith(_$ReportDeviceModelImpl value,
          $Res Function(_$ReportDeviceModelImpl) then) =
      __$$ReportDeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? identifier});
}

/// @nodoc
class __$$ReportDeviceModelImplCopyWithImpl<$Res>
    extends _$ReportDeviceModelCopyWithImpl<$Res, _$ReportDeviceModelImpl>
    implements _$$ReportDeviceModelImplCopyWith<$Res> {
  __$$ReportDeviceModelImplCopyWithImpl(_$ReportDeviceModelImpl _value,
      $Res Function(_$ReportDeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$ReportDeviceModelImpl(
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
@JsonSerializable()
class _$ReportDeviceModelImpl extends _ReportDeviceModel {
  const _$ReportDeviceModelImpl({this.name, this.identifier}) : super._();

  factory _$ReportDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDeviceModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'ReportDeviceModel(name: $name, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDeviceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDeviceModelImplCopyWith<_$ReportDeviceModelImpl> get copyWith =>
      __$$ReportDeviceModelImplCopyWithImpl<_$ReportDeviceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDeviceModelImplToJson(
      this,
    );
  }
}

abstract class _ReportDeviceModel extends ReportDeviceModel {
  const factory _ReportDeviceModel(
      {final String? name, final String? identifier}) = _$ReportDeviceModelImpl;
  const _ReportDeviceModel._() : super._();

  factory _ReportDeviceModel.fromJson(Map<String, dynamic> json) =
      _$ReportDeviceModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$ReportDeviceModelImplCopyWith<_$ReportDeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportDataModel _$ReportDataModelFromJson(Map<String, dynamic> json) {
  return _ReportDataModel.fromJson(json);
}

/// @nodoc
mixin _$ReportDataModel {
  String? get type => throw _privateConstructorUsedError;
  List<DataValueModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDataModelCopyWith<ReportDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataModelCopyWith<$Res> {
  factory $ReportDataModelCopyWith(
          ReportDataModel value, $Res Function(ReportDataModel) then) =
      _$ReportDataModelCopyWithImpl<$Res, ReportDataModel>;
  @useResult
  $Res call({String? type, List<DataValueModel>? data});
}

/// @nodoc
class _$ReportDataModelCopyWithImpl<$Res, $Val extends ReportDataModel>
    implements $ReportDataModelCopyWith<$Res> {
  _$ReportDataModelCopyWithImpl(this._value, this._then);

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
              as List<DataValueModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDataModelImplCopyWith<$Res>
    implements $ReportDataModelCopyWith<$Res> {
  factory _$$ReportDataModelImplCopyWith(_$ReportDataModelImpl value,
          $Res Function(_$ReportDataModelImpl) then) =
      __$$ReportDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, List<DataValueModel>? data});
}

/// @nodoc
class __$$ReportDataModelImplCopyWithImpl<$Res>
    extends _$ReportDataModelCopyWithImpl<$Res, _$ReportDataModelImpl>
    implements _$$ReportDataModelImplCopyWith<$Res> {
  __$$ReportDataModelImplCopyWithImpl(
      _$ReportDataModelImpl _value, $Res Function(_$ReportDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ReportDataModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<DataValueModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDataModelImpl extends _ReportDataModel {
  const _$ReportDataModelImpl({this.type, final List<DataValueModel>? data})
      : _data = data,
        super._();

  factory _$ReportDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDataModelImplFromJson(json);

  @override
  final String? type;
  final List<DataValueModel>? _data;
  @override
  List<DataValueModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReportDataModel(type: $type, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataModelImplCopyWith<_$ReportDataModelImpl> get copyWith =>
      __$$ReportDataModelImplCopyWithImpl<_$ReportDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDataModelImplToJson(
      this,
    );
  }
}

abstract class _ReportDataModel extends ReportDataModel {
  const factory _ReportDataModel(
      {final String? type,
      final List<DataValueModel>? data}) = _$ReportDataModelImpl;
  const _ReportDataModel._() : super._();

  factory _ReportDataModel.fromJson(Map<String, dynamic> json) =
      _$ReportDataModelImpl.fromJson;

  @override
  String? get type;
  @override
  List<DataValueModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataModelImplCopyWith<_$ReportDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataValueModel _$DataValueModelFromJson(Map<String, dynamic> json) {
  return _DataValueModel.fromJson(json);
}

/// @nodoc
mixin _$DataValueModel {
  String? get device => throw _privateConstructorUsedError;
  List<List<dynamic>>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataValueModelCopyWith<DataValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataValueModelCopyWith<$Res> {
  factory $DataValueModelCopyWith(
          DataValueModel value, $Res Function(DataValueModel) then) =
      _$DataValueModelCopyWithImpl<$Res, DataValueModel>;
  @useResult
  $Res call({String? device, List<List<dynamic>>? value});
}

/// @nodoc
class _$DataValueModelCopyWithImpl<$Res, $Val extends DataValueModel>
    implements $DataValueModelCopyWith<$Res> {
  _$DataValueModelCopyWithImpl(this._value, this._then);

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
abstract class _$$DataValueModelImplCopyWith<$Res>
    implements $DataValueModelCopyWith<$Res> {
  factory _$$DataValueModelImplCopyWith(_$DataValueModelImpl value,
          $Res Function(_$DataValueModelImpl) then) =
      __$$DataValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? device, List<List<dynamic>>? value});
}

/// @nodoc
class __$$DataValueModelImplCopyWithImpl<$Res>
    extends _$DataValueModelCopyWithImpl<$Res, _$DataValueModelImpl>
    implements _$$DataValueModelImplCopyWith<$Res> {
  __$$DataValueModelImplCopyWithImpl(
      _$DataValueModelImpl _value, $Res Function(_$DataValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? value = freezed,
  }) {
    return _then(_$DataValueModelImpl(
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
@JsonSerializable()
class _$DataValueModelImpl extends _DataValueModel {
  const _$DataValueModelImpl({this.device, final List<List<dynamic>>? value})
      : _value = value,
        super._();

  factory _$DataValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataValueModelImplFromJson(json);

  @override
  final String? device;
  final List<List<dynamic>>? _value;
  @override
  List<List<dynamic>>? get value {
    final value = _value;
    if (value == null) return null;
    if (_value is EqualUnmodifiableListView) return _value;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataValueModel(device: $device, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataValueModelImpl &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, device, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataValueModelImplCopyWith<_$DataValueModelImpl> get copyWith =>
      __$$DataValueModelImplCopyWithImpl<_$DataValueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataValueModelImplToJson(
      this,
    );
  }
}

abstract class _DataValueModel extends DataValueModel {
  const factory _DataValueModel(
      {final String? device,
      final List<List<dynamic>>? value}) = _$DataValueModelImpl;
  const _DataValueModel._() : super._();

  factory _DataValueModel.fromJson(Map<String, dynamic> json) =
      _$DataValueModelImpl.fromJson;

  @override
  String? get device;
  @override
  List<List<dynamic>>? get value;
  @override
  @JsonKey(ignore: true)
  _$$DataValueModelImplCopyWith<_$DataValueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
