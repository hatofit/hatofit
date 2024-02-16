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
  String? get brand => throw _privateConstructorUsedError;
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
  $Res call({String? name, String? brand, String? identifier});
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
    Object? brand = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? name, String? brand, String? identifier});
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
    Object? brand = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$ReportDeviceModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
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
  const _$ReportDeviceModelImpl({this.name, this.brand, this.identifier})
      : super._();

  factory _$ReportDeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDeviceModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? brand;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'ReportDeviceModel(name: $name, brand: $brand, identifier: $identifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDeviceModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, brand, identifier);

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
      {final String? name,
      final String? brand,
      final String? identifier}) = _$ReportDeviceModelImpl;
  const _ReportDeviceModel._() : super._();

  factory _ReportDeviceModel.fromJson(Map<String, dynamic> json) =
      _$ReportDeviceModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get brand;
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
  List<ReportDataValueModel>? get data => throw _privateConstructorUsedError;

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
  $Res call({String? type, List<ReportDataValueModel>? data});
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
              as List<ReportDataValueModel>?,
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
  $Res call({String? type, List<ReportDataValueModel>? data});
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
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReportDataValueModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDataModelImpl extends _ReportDataModel {
  const _$ReportDataModelImpl({this.type, this.data}) : super._();

  factory _$ReportDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDataModelImplFromJson(json);

  @override
  final String? type;
  @override
  final List<ReportDataValueModel>? data;

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
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, const DeepCollectionEquality().hash(data));

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
      final List<ReportDataValueModel>? data}) = _$ReportDataModelImpl;
  const _ReportDataModel._() : super._();

  factory _ReportDataModel.fromJson(Map<String, dynamic> json) =
      _$ReportDataModelImpl.fromJson;

  @override
  String? get type;
  @override
  List<ReportDataValueModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataModelImplCopyWith<_$ReportDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportDataValueModel _$ReportDataValueModelFromJson(Map<String, dynamic> json) {
  return _ReportDataValueModel.fromJson(json);
}

/// @nodoc
mixin _$ReportDataValueModel {
  String? get device => throw _privateConstructorUsedError;
  List<List<dynamic>>? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDataValueModelCopyWith<ReportDataValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataValueModelCopyWith<$Res> {
  factory $ReportDataValueModelCopyWith(ReportDataValueModel value,
          $Res Function(ReportDataValueModel) then) =
      _$ReportDataValueModelCopyWithImpl<$Res, ReportDataValueModel>;
  @useResult
  $Res call({String? device, List<List<dynamic>>? value});
}

/// @nodoc
class _$ReportDataValueModelCopyWithImpl<$Res,
        $Val extends ReportDataValueModel>
    implements $ReportDataValueModelCopyWith<$Res> {
  _$ReportDataValueModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ReportDataValueModelImplCopyWith<$Res>
    implements $ReportDataValueModelCopyWith<$Res> {
  factory _$$ReportDataValueModelImplCopyWith(_$ReportDataValueModelImpl value,
          $Res Function(_$ReportDataValueModelImpl) then) =
      __$$ReportDataValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? device, List<List<dynamic>>? value});
}

/// @nodoc
class __$$ReportDataValueModelImplCopyWithImpl<$Res>
    extends _$ReportDataValueModelCopyWithImpl<$Res, _$ReportDataValueModelImpl>
    implements _$$ReportDataValueModelImplCopyWith<$Res> {
  __$$ReportDataValueModelImplCopyWithImpl(_$ReportDataValueModelImpl _value,
      $Res Function(_$ReportDataValueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ReportDataValueModelImpl(
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<List<dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDataValueModelImpl extends _ReportDataValueModel {
  const _$ReportDataValueModelImpl({this.device, this.value}) : super._();

  factory _$ReportDataValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDataValueModelImplFromJson(json);

  @override
  final String? device;
  @override
  final List<List<dynamic>>? value;

  @override
  String toString() {
    return 'ReportDataValueModel(device: $device, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataValueModelImpl &&
            (identical(other.device, device) || other.device == device) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, device, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataValueModelImplCopyWith<_$ReportDataValueModelImpl>
      get copyWith =>
          __$$ReportDataValueModelImplCopyWithImpl<_$ReportDataValueModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDataValueModelImplToJson(
      this,
    );
  }
}

abstract class _ReportDataValueModel extends ReportDataValueModel {
  const factory _ReportDataValueModel(
      {final String? device,
      final List<List<dynamic>>? value}) = _$ReportDataValueModelImpl;
  const _ReportDataValueModel._() : super._();

  factory _ReportDataValueModel.fromJson(Map<String, dynamic> json) =
      _$ReportDataValueModelImpl.fromJson;

  @override
  String? get device;
  @override
  List<List<dynamic>>? get value;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataValueModelImplCopyWith<_$ReportDataValueModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
