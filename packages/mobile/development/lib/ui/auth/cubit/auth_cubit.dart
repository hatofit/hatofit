import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._loginUsecase,
    this._forgotPasswordUsecase,
  ) : super(_Initial());
  final LoginUsecase _loginUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;

  bool? isPasswordHide = true;
  void showHidePassword() {
    emit(const _Initial());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHide());
  }

  static const List<String> _scopes = <String>[
    "email",
    "profile",
    "https://www.googleapis.com/auth/fitness.heart_rate.read",
    "https://www.googleapis.com/auth/fitness.heart_rate.write",
    "https://www.googleapis.com/auth/fitness.sleep.read",
    "https://www.googleapis.com/auth/fitness.sleep.write",
    "https://www.googleapis.com/auth/fitness.activity.read",
    "https://www.googleapis.com/auth/fitness.activity.write",
    "https://www.googleapis.com/auth/fitness.body.read",
    "https://www.googleapis.com/auth/fitness.body.write",
  ];
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: _scopes,
  );

  void signOut() async {
    try {
      final res = await _googleSignIn.signOut();
      log?.i(res);
      if (res != null) {
        emit(const _Initial());
      }
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? res = await _googleSignIn.signIn();
      log?.i(res);
      if (res != null) {
        emit(_Success(res.displayName));
      }
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  void signInWithRestAPI(LoginParams params) async {
    emit(const _Loading());
    try {
      final Either<Failure, AuthResponseEntity> res =
          await _loginUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.user!.firstName));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  void forgotPassword(ForgotPasswordParams params) async {
    emit(const _Loading());
    try {
      final Either<Failure, AuthResponseEntity> res =
          await _forgotPasswordUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.user!.firstName));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }
}
