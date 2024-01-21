import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/utils/utils.dart';

extension BlocExtensions on BlocBase {
  void safeEmit<T>(
    T state, {
    bool isClosed = false,
    required void Function(T) emit,
  }) {
    if (isClosed) {
      log?.e('Bloc is closed');
      return;
    } else {
      emit(state);
    }
  }
}
