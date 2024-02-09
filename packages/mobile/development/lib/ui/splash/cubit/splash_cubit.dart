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
  final ReadUserUsecase _readUserUsecase;
  final ReadMoodUsecase _getMoodUsecase;
  final DeleteMoodUsecase _clearMoodUsecase;
  final UpdateOfflineModeUsecase _updateOfflineModeUsecase;

  SplashCubit(
    this._meUseCase,
    this._reqBLEPermUsecase,
    this._readUserUsecase,
    this._getMoodUsecase,
    this._clearMoodUsecase,
    this._updateOfflineModeUsecase,
  ) : super(const _Initial());

  Future<void> init() async {
    await getLocalUser();
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
        log.e("Check Auth Error: $l");
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

  bool _isInitialized = false;
  UserEntity? _user;

  bool get isInitialized => _isInitialized;
  UserEntity? get user => _user;

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

  Future<void> getLocalUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: false));
    return res.fold((l) {
      _isInitialized = false;
      _user = null;
    }, (r) {
      _isInitialized = true;
      _user = r;
    });
  }

  Future<void> upsertOfflineMode(bool value) async {
    await _updateOfflineModeUsecase.call(value);
  }
}
