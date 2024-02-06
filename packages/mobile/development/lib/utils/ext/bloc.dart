import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocExtensions on BlocBase {
  void safeEmit<T>(
    T state, {
    bool isClosed = false,
    required void Function(T) emit,
  }) {
    if (isClosed) {
      return;
    } else {
      emit(state);
    }
  }
}
