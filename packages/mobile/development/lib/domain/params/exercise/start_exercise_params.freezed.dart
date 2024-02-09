// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_exercise_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StartExerciseParams {
  bool get isFreeWorkout => throw _privateConstructorUsedError;
  ExerciseEntity? get exercise => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;
  BleEntity? get device => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartExerciseParamsCopyWith<StartExerciseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartExerciseParamsCopyWith<$Res> {
  factory $StartExerciseParamsCopyWith(
          StartExerciseParams value, $Res Function(StartExerciseParams) then) =
      _$StartExerciseParamsCopyWithImpl<$Res, StartExerciseParams>;
  @useResult
  $Res call(
      {bool isFreeWorkout,
      ExerciseEntity? exercise,
      UserEntity user,
      BleEntity? device});

  $ExerciseEntityCopyWith<$Res>? get exercise;
  $UserEntityCopyWith<$Res> get user;
  $BleEntityCopyWith<$Res>? get device;
}

/// @nodoc
class _$StartExerciseParamsCopyWithImpl<$Res, $Val extends StartExerciseParams>
    implements $StartExerciseParamsCopyWith<$Res> {
  _$StartExerciseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFreeWorkout = null,
    Object? exercise = freezed,
    Object? user = null,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      isFreeWorkout: null == isFreeWorkout
          ? _value.isFreeWorkout
          : isFreeWorkout // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
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

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BleEntityCopyWith<$Res>? get device {
    if (_value.device == null) {
      return null;
    }

    return $BleEntityCopyWith<$Res>(_value.device!, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartExerciseParamsImplCopyWith<$Res>
    implements $StartExerciseParamsCopyWith<$Res> {
  factory _$$StartExerciseParamsImplCopyWith(_$StartExerciseParamsImpl value,
          $Res Function(_$StartExerciseParamsImpl) then) =
      __$$StartExerciseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFreeWorkout,
      ExerciseEntity? exercise,
      UserEntity user,
      BleEntity? device});

  @override
  $ExerciseEntityCopyWith<$Res>? get exercise;
  @override
  $UserEntityCopyWith<$Res> get user;
  @override
  $BleEntityCopyWith<$Res>? get device;
}

/// @nodoc
class __$$StartExerciseParamsImplCopyWithImpl<$Res>
    extends _$StartExerciseParamsCopyWithImpl<$Res, _$StartExerciseParamsImpl>
    implements _$$StartExerciseParamsImplCopyWith<$Res> {
  __$$StartExerciseParamsImplCopyWithImpl(_$StartExerciseParamsImpl _value,
      $Res Function(_$StartExerciseParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFreeWorkout = null,
    Object? exercise = freezed,
    Object? user = null,
    Object? device = freezed,
  }) {
    return _then(_$StartExerciseParamsImpl(
      isFreeWorkout: null == isFreeWorkout
          ? _value.isFreeWorkout
          : isFreeWorkout // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as BleEntity?,
    ));
  }
}

/// @nodoc

class _$StartExerciseParamsImpl implements _StartExerciseParams {
  const _$StartExerciseParamsImpl(
      {required this.isFreeWorkout,
      required this.exercise,
      required this.user,
      required this.device});

  @override
  final bool isFreeWorkout;
  @override
  final ExerciseEntity? exercise;
  @override
  final UserEntity user;
  @override
  final BleEntity? device;

  @override
  String toString() {
    return 'StartExerciseParams(isFreeWorkout: $isFreeWorkout, exercise: $exercise, user: $user, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartExerciseParamsImpl &&
            (identical(other.isFreeWorkout, isFreeWorkout) ||
                other.isFreeWorkout == isFreeWorkout) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isFreeWorkout, exercise, user, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartExerciseParamsImplCopyWith<_$StartExerciseParamsImpl> get copyWith =>
      __$$StartExerciseParamsImplCopyWithImpl<_$StartExerciseParamsImpl>(
          this, _$identity);
}

abstract class _StartExerciseParams implements StartExerciseParams {
  const factory _StartExerciseParams(
      {required final bool isFreeWorkout,
      required final ExerciseEntity? exercise,
      required final UserEntity user,
      required final BleEntity? device}) = _$StartExerciseParamsImpl;

  @override
  bool get isFreeWorkout;
  @override
  ExerciseEntity? get exercise;
  @override
  UserEntity get user;
  @override
  BleEntity? get device;
  @override
  @JsonKey(ignore: true)
  _$$StartExerciseParamsImplCopyWith<_$StartExerciseParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
