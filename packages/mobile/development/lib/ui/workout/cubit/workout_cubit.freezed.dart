// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutStateCopyWith<$Res> {
  factory $WorkoutStateCopyWith(
          WorkoutState value, $Res Function(WorkoutState) then) =
      _$WorkoutStateCopyWithImpl<$Res, WorkoutState>;
}

/// @nodoc
class _$WorkoutStateCopyWithImpl<$Res, $Val extends WorkoutState>
    implements $WorkoutStateCopyWith<$Res> {
  _$WorkoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'WorkoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements WorkoutState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ExerciseEntity> exercises});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exercises = null,
  }) {
    return _then(_$SuccessImpl(
      null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseEntity>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<ExerciseEntity> exercises)
      : _exercises = exercises;

  final List<ExerciseEntity> _exercises;
  @override
  List<ExerciseEntity> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutState.success(exercises: $exercises)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) {
    return success(exercises);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) {
    return success?.call(exercises);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(exercises);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements WorkoutState {
  const factory _Success(final List<ExerciseEntity> exercises) = _$SuccessImpl;

  List<ExerciseEntity> get exercises;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final Failure message;

  @override
  String toString() {
    return 'WorkoutState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements WorkoutState {
  const factory _Failure(final Failure message) = _$FailureImpl;

  Failure get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartImplCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool freeTraining, ExerciseEntity? exercise, UserEntity? user});

  $ExerciseEntityCopyWith<$Res>? get exercise;
  $UserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freeTraining = null,
    Object? exercise = freezed,
    Object? user = freezed,
  }) {
    return _then(_$StartImpl(
      freeTraining: null == freeTraining
          ? _value.freeTraining
          : freeTraining // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseEntityCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseEntityCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$StartImpl implements _Start {
  const _$StartImpl({this.freeTraining = true, this.exercise, this.user});

  @override
  @JsonKey()
  final bool freeTraining;
  @override
  final ExerciseEntity? exercise;
  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'WorkoutState.start(freeTraining: $freeTraining, exercise: $exercise, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartImpl &&
            (identical(other.freeTraining, freeTraining) ||
                other.freeTraining == freeTraining) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, freeTraining, exercise, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      __$$StartImplCopyWithImpl<_$StartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) {
    return start(freeTraining, exercise, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) {
    return start?.call(freeTraining, exercise, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(freeTraining, exercise, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements WorkoutState {
  const factory _Start(
      {final bool freeTraining,
      final ExerciseEntity? exercise,
      final UserEntity? user}) = _$StartImpl;

  bool get freeTraining;
  ExerciseEntity? get exercise;
  UserEntity? get user;
  @JsonKey(ignore: true)
  _$$StartImplCopyWith<_$StartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishImplCopyWith<$Res> {
  factory _$$FinishImplCopyWith(
          _$FinishImpl value, $Res Function(_$FinishImpl) then) =
      __$$FinishImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool freeTraining, ExerciseEntity? exercise, SessionEntity session});

  $ExerciseEntityCopyWith<$Res>? get exercise;
  $SessionEntityCopyWith<$Res> get session;
}

/// @nodoc
class __$$FinishImplCopyWithImpl<$Res>
    extends _$WorkoutStateCopyWithImpl<$Res, _$FinishImpl>
    implements _$$FinishImplCopyWith<$Res> {
  __$$FinishImplCopyWithImpl(
      _$FinishImpl _value, $Res Function(_$FinishImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? freeTraining = null,
    Object? exercise = freezed,
    Object? session = null,
  }) {
    return _then(_$FinishImpl(
      freeTraining: null == freeTraining
          ? _value.freeTraining
          : freeTraining // ignore: cast_nullable_to_non_nullable
              as bool,
      exercise: freezed == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as ExerciseEntity?,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as SessionEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExerciseEntityCopyWith<$Res>? get exercise {
    if (_value.exercise == null) {
      return null;
    }

    return $ExerciseEntityCopyWith<$Res>(_value.exercise!, (value) {
      return _then(_value.copyWith(exercise: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionEntityCopyWith<$Res> get session {
    return $SessionEntityCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$FinishImpl implements _Finish {
  const _$FinishImpl(
      {this.freeTraining = true,
      this.exercise,
      this.session = const SessionEntity()});

  @override
  @JsonKey()
  final bool freeTraining;
  @override
  final ExerciseEntity? exercise;
  @override
  @JsonKey()
  final SessionEntity session;

  @override
  String toString() {
    return 'WorkoutState.finish(freeTraining: $freeTraining, exercise: $exercise, session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishImpl &&
            (identical(other.freeTraining, freeTraining) ||
                other.freeTraining == freeTraining) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, freeTraining, exercise, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishImplCopyWith<_$FinishImpl> get copyWith =>
      __$$FinishImplCopyWithImpl<_$FinishImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ExerciseEntity> exercises) success,
    required TResult Function(Failure message) failure,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)
        start,
    required TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)
        finish,
  }) {
    return finish(freeTraining, exercise, session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ExerciseEntity> exercises)? success,
    TResult? Function(Failure message)? failure,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult? Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
  }) {
    return finish?.call(freeTraining, exercise, session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ExerciseEntity> exercises)? success,
    TResult Function(Failure message)? failure,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, UserEntity? user)?
        start,
    TResult Function(
            bool freeTraining, ExerciseEntity? exercise, SessionEntity session)?
        finish,
    required TResult orElse(),
  }) {
    if (finish != null) {
      return finish(freeTraining, exercise, session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Start value) start,
    required TResult Function(_Finish value) finish,
  }) {
    return finish(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Start value)? start,
    TResult? Function(_Finish value)? finish,
  }) {
    return finish?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    TResult Function(_Start value)? start,
    TResult Function(_Finish value)? finish,
    required TResult orElse(),
  }) {
    if (finish != null) {
      return finish(this);
    }
    return orElse();
  }
}

abstract class _Finish implements WorkoutState {
  const factory _Finish(
      {final bool freeTraining,
      final ExerciseEntity? exercise,
      final SessionEntity session}) = _$FinishImpl;

  bool get freeTraining;
  ExerciseEntity? get exercise;
  SessionEntity get session;
  @JsonKey(ignore: true)
  _$$FinishImplCopyWith<_$FinishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
