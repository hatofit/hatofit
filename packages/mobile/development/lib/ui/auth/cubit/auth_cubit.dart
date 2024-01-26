import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with MainBoxMixin {
  AuthCubit(
    this._loginUsecase,
    this._forgotPasswordUsecase,
    this._verifyCodeUseCase,
    this._resetPasswordUsecase,
    this._imageFromCameraUsecase,
    this._registerUsecase,
    this._imageFromGalleryUsecase,
  ) : super(_Initial());
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final ImageFromCameraUsecase _imageFromCameraUsecase;
  final ImageFromGalleryUsecase _imageFromGalleryUsecase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResetPasswordUsecase _resetPasswordUsecase;

  bool? isPasswordHide = true;
  bool? isPasswordRepeatHide = true;
  void showHidePassword() {
    emit(const _Initial());
    isPasswordHide = !(isPasswordHide ?? false);
    emit(const _ShowHide());
  }

  void showHidePasswordRepeat() {
    emit(const _Initial());
    isPasswordRepeatHide = !(isPasswordRepeatHide ?? false);
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
    forceCodeForRefreshToken: true,
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

  void signUpWithRestAPI(RegisterParams params) async {
    emit(const _Loading());
    try {
      final Either<Failure, AuthResponseEntity> res =
          await _registerUsecase.call(RegisterParams(
        firstName: params.firstName,
        lastName: params.lastName,
        gender: getData(MainBoxKeys.gender),
        email: params.email,
        password: params.password,
        confirmPassword: params.confirmPassword,
        photo: pickedImage,
        dateOfBirth: getData(MainBoxKeys.dateOfBirth),
        height: getData(MainBoxKeys.height),
        weight: getData(MainBoxKeys.weight),
        metricUnits: {
          "energyUnits": getData(MainBoxKeys.energyUnit),
          "heightUnits": getData(MainBoxKeys.heightUnit),
          "weightUnits": getData(MainBoxKeys.weightUnit),
        },
      ));

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
      final res = await _forgotPasswordUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.message ?? ""));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  bool isCodeVerified = false;

  void verifyCode(ResetPasswordParams params) async {
    try {
      final res = await _verifyCodeUseCase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        isCodeVerified = true;
        emit(_Initial());
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  void resetPassword(ResetPasswordParams params) async {
    emit(const _Loading());
    try {
      final res = await _resetPasswordUsecase.call(params);

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

  File? pickedImage;

  void getImageFromCamera(
    BuildContext context,
  ) async {
    try {
      final Either<Failure, File> res = await _imageFromCameraUsecase.call();

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) async {
        pickedImage = r;
        emit(ImagePicked(r));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }

  void getImageFromGallery(
    BuildContext context,
  ) async {
    try {
      final Either<Failure, File> res = await _imageFromGalleryUsecase.call();

      res.fold((l) {
        if (l is ServerFailure) {
          log?.i(l.message);
          emit(_Failure(l.message ?? ""));
        }
      }, (r) async {
        pickedImage = r;
        emit(ImagePicked(r));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      log?.e(e);
    }
  }
}
