import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final MeUseCase _meUseCase;
  final ReqBLEPermUsecase _reqBLEPermUsecase;
  final GetUserUsecase _getUserUsecase;
  final GetMoodUsecase _getMoodUsecase;
  final ClearMoodUsecase _clearMoodUsecase;
  final UpdateOfflineModeUsecase _updateOfflineModeUsecase;

  SplashCubit(
    this._meUseCase,
    this._reqBLEPermUsecase,
    this._getUserUsecase,
    this._getMoodUsecase,
    this._clearMoodUsecase,
    this._updateOfflineModeUsecase,
  ) : super(const _Initial());

  Future<void> init() async {
    await requestPermissions();
    await checkAuth();
    checkMood();
  }

  Future<void> requestPermissions() async {
    await _reqBLEPermUsecase.call();
  }

  Future<void> checkAuth() async {
    final res = await _meUseCase.call();
    res.fold(
      (l) {
        if (l is NoInternetFailure) {
          safeEmit(
            const _Offline(),
            emit: emit,
            isClosed: isClosed,
          );
        } else if (l is ServerFailure) {
          if (l.exception?.type == DioExceptionType.connectionTimeout) {
            safeEmit(
              const _Offline(),
              emit: emit,
              isClosed: isClosed,
            );
          } else {
            safeEmit(
              const _Unauthorized("Unauthorized"),
              isClosed: isClosed,
              emit: emit,
            );
          }
        }
      },
      (r) {
        safeEmit(
          const _Authorized("Authorized"),
          isClosed: isClosed,
          emit: emit,
        );
      },
    );
  }

  Future<void> checkMood() async {
    final res = await _getMoodUsecase.call();
    res.fold((l) async => await _clearMoodUsecase.call(), (r) {
      if (r.isNotEmpty) {
        final date = DateFormat('d MMMM yyyy').format(DateTime.now());
        if (r != date) {
          _clearMoodUsecase.call();
        }
      }
    });
  }

  Future<UserEntity?> getLocalUser() async {
    final res = await _getUserUsecase.call();
    return res.fold((l) => null, (r) => r);
  }

  Future<void> setOfflineMode(bool value) async {
    await _updateOfflineModeUsecase.call(value);
  }
}
