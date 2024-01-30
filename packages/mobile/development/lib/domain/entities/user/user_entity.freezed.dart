// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEntity {
  @HiveField(0)
  String? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get gender => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get photo => throw _privateConstructorUsedError;
  @HiveField(7)
  MetricUnitsEntity? get metricUnitsEntity =>
      throw _privateConstructorUsedError;
  @HiveField(8)
  int? get height => throw _privateConstructorUsedError;
  @HiveField(9)
  int? get weight => throw _privateConstructorUsedError;
  @HiveField(10)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? firstName,
      @HiveField(2) String? lastName,
      @HiveField(3) String? gender,
      @HiveField(4) String? email,
      @HiveField(5) DateTime? dateOfBirth,
      @HiveField(6) String? photo,
      @HiveField(7) MetricUnitsEntity? metricUnitsEntity,
      @HiveField(8) int? height,
      @HiveField(9) int? weight,
      @HiveField(10) DateTime? createdAt,
      @HiveField(11) DateTime? updatedAt});

  $MetricUnitsEntityCopyWith<$Res>? get metricUnitsEntity;
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? photo = freezed,
    Object? metricUnitsEntity = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      metricUnitsEntity: freezed == metricUnitsEntity
          ? _value.metricUnitsEntity
          : metricUnitsEntity // ignore: cast_nullable_to_non_nullable
              as MetricUnitsEntity?,
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
  $MetricUnitsEntityCopyWith<$Res>? get metricUnitsEntity {
    if (_value.metricUnitsEntity == null) {
      return null;
    }

    return $MetricUnitsEntityCopyWith<$Res>(_value.metricUnitsEntity!, (value) {
      return _then(_value.copyWith(metricUnitsEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? id,
      @HiveField(1) String? firstName,
      @HiveField(2) String? lastName,
      @HiveField(3) String? gender,
      @HiveField(4) String? email,
      @HiveField(5) DateTime? dateOfBirth,
      @HiveField(6) String? photo,
      @HiveField(7) MetricUnitsEntity? metricUnitsEntity,
      @HiveField(8) int? height,
      @HiveField(9) int? weight,
      @HiveField(10) DateTime? createdAt,
      @HiveField(11) DateTime? updatedAt});

  @override
  $MetricUnitsEntityCopyWith<$Res>? get metricUnitsEntity;
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? email = freezed,
    Object? dateOfBirth = freezed,
    Object? photo = freezed,
    Object? metricUnitsEntity = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      metricUnitsEntity: freezed == metricUnitsEntity
          ? _value.metricUnitsEntity
          : metricUnitsEntity // ignore: cast_nullable_to_non_nullable
              as MetricUnitsEntity?,
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

@HiveType(typeId: 0, adapterName: 'UserEntityAdapter')
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.firstName,
      @HiveField(2) this.lastName,
      @HiveField(3) this.gender,
      @HiveField(4) this.email,
      @HiveField(5) this.dateOfBirth,
      @HiveField(6) this.photo,
      @HiveField(7) this.metricUnitsEntity,
      @HiveField(8) this.height,
      @HiveField(9) this.weight,
      @HiveField(10) this.createdAt,
      @HiveField(11) this.updatedAt});

  @override
  @HiveField(0)
  final String? id;
  @override
  @HiveField(1)
  final String? firstName;
  @override
  @HiveField(2)
  final String? lastName;
  @override
  @HiveField(3)
  final String? gender;
  @override
  @HiveField(4)
  final String? email;
  @override
  @HiveField(5)
  final DateTime? dateOfBirth;
  @override
  @HiveField(6)
  final String? photo;
  @override
  @HiveField(7)
  final MetricUnitsEntity? metricUnitsEntity;
  @override
  @HiveField(8)
  final int? height;
  @override
  @HiveField(9)
  final int? weight;
  @override
  @HiveField(10)
  final DateTime? createdAt;
  @override
  @HiveField(11)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserEntity(id: $id, firstName: $firstName, lastName: $lastName, gender: $gender, email: $email, dateOfBirth: $dateOfBirth, photo: $photo, metricUnitsEntity: $metricUnitsEntity, height: $height, weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.metricUnitsEntity, metricUnitsEntity) ||
                other.metricUnitsEntity == metricUnitsEntity) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      gender,
      email,
      dateOfBirth,
      photo,
      metricUnitsEntity,
      height,
      weight,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@HiveField(0) final String? id,
      @HiveField(1) final String? firstName,
      @HiveField(2) final String? lastName,
      @HiveField(3) final String? gender,
      @HiveField(4) final String? email,
      @HiveField(5) final DateTime? dateOfBirth,
      @HiveField(6) final String? photo,
      @HiveField(7) final MetricUnitsEntity? metricUnitsEntity,
      @HiveField(8) final int? height,
      @HiveField(9) final int? weight,
      @HiveField(10) final DateTime? createdAt,
      @HiveField(11) final DateTime? updatedAt}) = _$UserEntityImpl;

  @override
  @HiveField(0)
  String? get id;
  @override
  @HiveField(1)
  String? get firstName;
  @override
  @HiveField(2)
  String? get lastName;
  @override
  @HiveField(3)
  String? get gender;
  @override
  @HiveField(4)
  String? get email;
  @override
  @HiveField(5)
  DateTime? get dateOfBirth;
  @override
  @HiveField(6)
  String? get photo;
  @override
  @HiveField(7)
  MetricUnitsEntity? get metricUnitsEntity;
  @override
  @HiveField(8)
  int? get height;
  @override
  @HiveField(9)
  int? get weight;
  @override
  @HiveField(10)
  DateTime? get createdAt;
  @override
  @HiveField(11)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MetricUnitsEntity {
  @HiveField(0)
  String? get energyUnits => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get heightUnits => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get weightUnits => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MetricUnitsEntityCopyWith<MetricUnitsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetricUnitsEntityCopyWith<$Res> {
  factory $MetricUnitsEntityCopyWith(
          MetricUnitsEntity value, $Res Function(MetricUnitsEntity) then) =
      _$MetricUnitsEntityCopyWithImpl<$Res, MetricUnitsEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String? energyUnits,
      @HiveField(1) String? heightUnits,
      @HiveField(2) String? weightUnits});
}

/// @nodoc
class _$MetricUnitsEntityCopyWithImpl<$Res, $Val extends MetricUnitsEntity>
    implements $MetricUnitsEntityCopyWith<$Res> {
  _$MetricUnitsEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$MetricUnitsEntityImplCopyWith<$Res>
    implements $MetricUnitsEntityCopyWith<$Res> {
  factory _$$MetricUnitsEntityImplCopyWith(_$MetricUnitsEntityImpl value,
          $Res Function(_$MetricUnitsEntityImpl) then) =
      __$$MetricUnitsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? energyUnits,
      @HiveField(1) String? heightUnits,
      @HiveField(2) String? weightUnits});
}

/// @nodoc
class __$$MetricUnitsEntityImplCopyWithImpl<$Res>
    extends _$MetricUnitsEntityCopyWithImpl<$Res, _$MetricUnitsEntityImpl>
    implements _$$MetricUnitsEntityImplCopyWith<$Res> {
  __$$MetricUnitsEntityImplCopyWithImpl(_$MetricUnitsEntityImpl _value,
      $Res Function(_$MetricUnitsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? energyUnits = freezed,
    Object? heightUnits = freezed,
    Object? weightUnits = freezed,
  }) {
    return _then(_$MetricUnitsEntityImpl(
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

@HiveType(typeId: 1, adapterName: 'MetricUnitsEntityAdapter')
class _$MetricUnitsEntityImpl implements _MetricUnitsEntity {
  const _$MetricUnitsEntityImpl(
      {@HiveField(0) this.energyUnits,
      @HiveField(1) this.heightUnits,
      @HiveField(2) this.weightUnits});

  @override
  @HiveField(0)
  final String? energyUnits;
  @override
  @HiveField(1)
  final String? heightUnits;
  @override
  @HiveField(2)
  final String? weightUnits;

  @override
  String toString() {
    return 'MetricUnitsEntity(energyUnits: $energyUnits, heightUnits: $heightUnits, weightUnits: $weightUnits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetricUnitsEntityImpl &&
            (identical(other.energyUnits, energyUnits) ||
                other.energyUnits == energyUnits) &&
            (identical(other.heightUnits, heightUnits) ||
                other.heightUnits == heightUnits) &&
            (identical(other.weightUnits, weightUnits) ||
                other.weightUnits == weightUnits));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, energyUnits, heightUnits, weightUnits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetricUnitsEntityImplCopyWith<_$MetricUnitsEntityImpl> get copyWith =>
      __$$MetricUnitsEntityImplCopyWithImpl<_$MetricUnitsEntityImpl>(
          this, _$identity);
}

abstract class _MetricUnitsEntity implements MetricUnitsEntity {
  const factory _MetricUnitsEntity(
      {@HiveField(0) final String? energyUnits,
      @HiveField(1) final String? heightUnits,
      @HiveField(2) final String? weightUnits}) = _$MetricUnitsEntityImpl;

  @override
  @HiveField(0)
  String? get energyUnits;
  @override
  @HiveField(1)
  String? get heightUnits;
  @override
  @HiveField(2)
  String? get weightUnits;
  @override
  @JsonKey(ignore: true)
  _$$MetricUnitsEntityImplCopyWith<_$MetricUnitsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
