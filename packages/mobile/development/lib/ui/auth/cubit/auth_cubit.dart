import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final ImageFromCameraUsecase _imageFromCameraUsecase;
  final ImageFromGalleryUsecase _imageFromGalleryUsecase;
  final VerifyCodeUseCase _verifyCodeUseCase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  final ReadUserUsecase _readUserUsecase;
  final GetBoolFirebaseUsecase _getBoolFirebaseUsecase;
  final UpsertUserUsecase _upsertUserUsecase;

  AuthCubit(
    this._loginUsecase,
    this._forgotPasswordUsecase,
    this._verifyCodeUseCase,
    this._resetPasswordUsecase,
    this._imageFromCameraUsecase,
    this._registerUsecase,
    this._imageFromGalleryUsecase,
    this._readUserUsecase,
    this._getBoolFirebaseUsecase,
    this._upsertUserUsecase,
  ) : super(const _Initial());

  void init() {
    checkGoogleOauthAvailability();
  }

  bool isGoogleOauthAvailable = false;

  void checkGoogleOauthAvailability() async {
    final res = await _getBoolFirebaseUsecase
        .call(FirebaseConstant.get.isGoogleFitAvailable);
    res.fold((l) {
      if (l is ServerFailure) {
        isGoogleOauthAvailable = false;
      }
    }, (r) {
      isGoogleOauthAvailable = r;
    });
  }

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

      if (res != null) {
        emit(const _Initial());
      }
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? res = await _googleSignIn.signIn();

      if (res != null) {
        emit(_Success(res.displayName));
      }
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  void signInWithRestAPI(LoginParams params) async {
    emit(const _Loading());
    try {
      final Either<Failure, AuthResponseEntity> res =
          await _loginUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.user?.firstName));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  void signUpWithRestAPI(RegisterParams params) async {
    emit(const _Loading());
    final user =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: true));
    user.fold((l) => null, (r) async {
      try {
        final res = await _registerUsecase.call(RegisterParams(
          firstName: params.firstName,
          lastName: params.lastName,
          gender: r.gender ?? "male",
          email: params.email,
          password: params.password,
          confirmPassword: params.confirmPassword,
          photo: pickedImage,
          dateOfBirth: r.dateOfBirth.toString(),
          height: r.height ?? 150,
          weight: r.weight ?? 125,
          metricUnits: {
            "energyUnits": r.metricUnits?.energyUnits ?? "kcal",
            "heightUnits": r.metricUnits?.heightUnits ?? "cm",
            "weightUnits": r.metricUnits?.weightUnits ?? "kg",
          },
        ));

        res.fold((l) {
          if (l is ServerFailure) {
            emit(_Failure(l.message ?? ""));
          }
        }, (r) {
          _readUserUsecase
              .call(const ByLimitParams(showFromLocal: false))
              .then((_) => emit(_Success(r.user?.firstName)));
        });
      } catch (e, stackTrace) {
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
    });
  }

  void updateUserRestApi(RegisterParams params) async {
    emit(const _Loading());
    final user =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: true));
    user.fold((l) => null, (r) async {
      try {
        final res = await _upsertUserUsecase.call(RegisterParams(
          forLocal: false,
          firstName: params.firstName,
          lastName: params.lastName,
          gender: r.gender ?? "male",
          email: params.email,
          password: params.password,
          confirmPassword: params.confirmPassword,
          photo: pickedImage,
          dateOfBirth: r.dateOfBirth.toString(),
          height: r.height ?? 150,
          weight: r.weight ?? 125,
          metricUnits: {
            "energyUnits": r.metricUnits?.energyUnits ?? "kcal",
            "heightUnits": r.metricUnits?.heightUnits ?? "cm",
            "weightUnits": r.metricUnits?.weightUnits ?? "kg",
          },
        ));

        res.fold((l) {
          if (l is ServerFailure) {
            emit(_Failure(l.message ?? ""));
          }
        }, (r) {
          _readUserUsecase
              .call(const ByLimitParams(showFromLocal: false))
              .then((_) => emit(_Success(r.firstName)));
        });
      } catch (e, stackTrace) {
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
    });
  }

  void forgotPassword(ForgotPasswordParams params) async {
    emit(const _Loading());
    try {
      final res = await _forgotPasswordUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.message ?? ""));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  bool isCodeVerified = false;

  void verifyCode(ResetPasswordParams params) async {
    try {
      final res = await _verifyCodeUseCase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        isCodeVerified = true;
        emit(const _Initial());
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  void resetPassword(ResetPasswordParams params) async {
    emit(const _Loading());
    try {
      final res = await _resetPasswordUsecase.call(params);

      res.fold((l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      }, (r) {
        emit(_Success(r.user?.firstName));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
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
          emit(_Failure(l.message ?? ""));
        }
      }, (r) async {
        pickedImage = r;
        emit(ImagePicked(r));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }

  void getImageFromGallery(
    BuildContext context,
  ) async {
    try {
      final Either<Failure, File> res = await _imageFromGalleryUsecase.call();

      res.fold((l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        }
      }, (r) async {
        pickedImage = r;
        emit(ImagePicked(r));
      });
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
    }
  }
}
