import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';

part 'splash_cubit.freezed.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> with MainBoxMixin {
  final MeUseCase _meUseCase;

  SplashCubit(this._meUseCase) : super(const _Initial());

  Future<void> checkAuth() async {
    final res = await _meUseCase.call();
    res.fold(
      (l) {
        if (l is ServerFailure) {
          emit(const _Unauthorized("Unauthorized"));
        }
      },
      (r) {
        emit(_Authorized("Authorized"));
      },
    );
  }

  void checkMood() {
    final mood = getData<MoodEntity?>(MainBoxKeys.todayMood);
    if (mood != null) {
      final date = DateFormat('d MMMM yyyy').format(DateTime.now());
      if (mood.date != date) {
        removeData(MainBoxKeys.todayMood);
      }
    }
  }
}
