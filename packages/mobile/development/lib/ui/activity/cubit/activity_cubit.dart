import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/domain/domain.dart';

part 'activity_cubit.freezed.dart';
part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final GetSessionsUsecase _getSessionsUsecase;
  ActivityCubit(
    this._getSessionsUsecase,
  ) : super(const _Loading());

  Future<void> init() async {
    await getSessions();
  }

  Future<void> getSessions() async {
    emit(const _Loading());
    final res = await _getSessionsUsecase.call(const GetSessionsParams());
    res.fold(
      (failure) => emit(_Failure(failure.toString())),
      (session) => emit(_Success(session)),
    );
  }
}
