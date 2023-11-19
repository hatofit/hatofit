// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  MetricUnitsModel? get metricUnits => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? gender,
      String? email,
      String? password,
      String? confirmPassword,
      DateTime? dateOfBirth,
      String? photo,
      MetricUnitsModel? metricUnits,
      int? height,
      int? weight,
      DateTime? createdAt,
      DateTime? updatedAt});

  $MetricUnitsModelCopyWith<$Res>? get metricUnits;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? dateOfBirth = freezed,
    Object? photo = freezed,
    Object? metricUnits = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      metricUnits: freezed == metricUnits
          ? _value.metricUnits
          : metricUnits // ignore: cast_nullable_to_non_nullable
              as MetricUnitsModel?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetricUnitsModelCopyWith<$Res>? get metricUnits {
    if (_value.metricUnits == null) {
      return null;
    }

    return $MetricUnitsModelCopyWith<$Res>(_value.metricUnits!, (value) {
      return _then(_value.copyWith(metricUnits: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? gender,
      String? email,
      String? password,
      String? confirmPassword,
      DateTime? dateOfBirth,
      String? photo,
      MetricUnitsModel? metricUnits,
      int? height,
      int? weight,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $MetricUnitsModelCopyWith<$Res>? get metricUnits;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? dateOfBirth = freezed,
    Object? photo = freezed,
    Object? metricUnits = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserModelImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      metricUnits: freezed == metricUnits
          ? _value.metricUnits
          : metricUnits // ignore: cast_nullable_to_non_nullable
              as MetricUnitsModel?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {this.firstName,
      this.lastName,
      this.gender,
      this.email,
      this.password,
      this.confirmPassword,
      this.dateOfBirth,
      this.photo,
      this.metricUnits,
      this.height,
      this.weight,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? gender;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? photo;
  @override
  final MetricUnitsModel? metricUnits;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, gender: $gender, email: $email, password: $password, confirmPassword: $confirmPassword, dateOfBirth: $dateOfBirth, photo: $photo, metricUnits: $metricUnits, height: $height, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.metricUnits, metricUnits) ||
                other.metricUnits == metricUnits) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      gender,
      email,
      password,
      confirmPassword,
      dateOfBirth,
      photo,
      metricUnits,
      height,
      weight,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {final String? firstName,
      final String? lastName,
      final String? gender,
      final String? email,
      final String? password,
      final String? confirmPassword,
      final DateTime? dateOfBirth,
      final String? photo,
      final MetricUnitsModel? metricUnits,
      final int? height,
      final int? weight,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get gender;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;
  @override
  DateTime? get dateOfBirth;
  @override
  String? get photo;
  @override
  MetricUnitsModel? get metricUnits;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MetricUnitsModel _$MetricUnitsModelFromJson(Map<String, dynamic> json) {
  return _MetricUnitsModel.fromJson(json);
}

/// @nodoc
mixin _$MetricUnitsModel {
  String? get energyUnits => throw _privateConstructorUsedError;
  String? get heightUnits => throw _privateConstructorUsedError;
  String? get weightUnits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetricUnitsModelCopyWith<MetricUnitsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricUnitsModelCopyWith<$Res> {
  factory $MetricUnitsModelCopyWith(
          MetricUnitsModel value, $Res Function(MetricUnitsModel) then) =
      _$MetricUnitsModelCopyWithImpl<$Res, MetricUnitsModel>;
  @useResult
  $Res call({String? energyUnits, String? heightUnits, String? weightUnits});
}

/// @nodoc
class _$MetricUnitsModelCopyWithImpl<$Res, $Val extends MetricUnitsModel>
    implements $MetricUnitsModelCopyWith<$Res> {
  _$MetricUnitsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyUnits = freezed,
    Object? heightUnits = freezed,
    Object? weightUnits = freezed,
  }) {
    return _then(_value.copyWith(
      energyUnits: freezed == energyUnits
          ? _value.energyUnits
          : energyUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      heightUnits: freezed == heightUnits
          ? _value.heightUnits
          : heightUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      weightUnits: freezed == weightUnits
          ? _value.weightUnits
          : weightUnits // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetricUnitsModelImplCopyWith<$Res>
    implements $MetricUnitsModelCopyWith<$Res> {
  factory _$$MetricUnitsModelImplCopyWith(_$MetricUnitsModelImpl value,
          $Res Function(_$MetricUnitsModelImpl) then) =
      __$$MetricUnitsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? energyUnits, String? heightUnits, String? weightUnits});
}

/// @nodoc
class __$$MetricUnitsModelImplCopyWithImpl<$Res>
    extends _$MetricUnitsModelCopyWithImpl<$Res, _$MetricUnitsModelImpl>
    implements _$$MetricUnitsModelImplCopyWith<$Res> {
  __$$MetricUnitsModelImplCopyWithImpl(_$MetricUnitsModelImpl _value,
      $Res Function(_$MetricUnitsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyUnits = freezed,
    Object? heightUnits = freezed,
    Object? weightUnits = freezed,
  }) {
    return _then(_$MetricUnitsModelImpl(
      energyUnits: freezed == energyUnits
          ? _value.energyUnits
          : energyUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      heightUnits: freezed == heightUnits
          ? _value.heightUnits
          : heightUnits // ignore: cast_nullable_to_non_nullable
              as String?,
      weightUnits: freezed == weightUnits
          ? _value.weightUnits
          : weightUnits // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetricUnitsModelImpl extends _MetricUnitsModel {
  const _$MetricUnitsModelImpl(
      {this.energyUnits, this.heightUnits, this.weightUnits})
      : super._();

  factory _$MetricUnitsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetricUnitsModelImplFromJson(json);

  @override
  final String? energyUnits;
  @override
  final String? heightUnits;
  @override
  final String? weightUnits;

  @override
  String toString() {
    return 'MetricUnitsModel(energyUnits: $energyUnits, heightUnits: $heightUnits, weightUnits: $weightUnits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricUnitsModelImpl &&
            (identical(other.energyUnits, energyUnits) ||
                other.energyUnits == energyUnits) &&
            (identical(other.heightUnits, heightUnits) ||
                other.heightUnits == heightUnits) &&
            (identical(other.weightUnits, weightUnits) ||
                other.weightUnits == weightUnits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, energyUnits, heightUnits, weightUnits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricUnitsModelImplCopyWith<_$MetricUnitsModelImpl> get copyWith =>
      __$$MetricUnitsModelImplCopyWithImpl<_$MetricUnitsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetricUnitsModelImplToJson(
      this,
    );
  }
}

abstract class _MetricUnitsModel extends MetricUnitsModel {
  const factory _MetricUnitsModel(
      {final String? energyUnits,
      final String? heightUnits,
      final String? weightUnits}) = _$MetricUnitsModelImpl;
  const _MetricUnitsModel._() : super._();

  factory _MetricUnitsModel.fromJson(Map<String, dynamic> json) =
      _$MetricUnitsModelImpl.fromJson;

  @override
  String? get energyUnits;
  @override
  String? get heightUnits;
  @override
  String? get weightUnits;
  @override
  @JsonKey(ignore: true)
  _$$MetricUnitsModelImplCopyWith<_$MetricUnitsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
