// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'intro_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/utils/ext/bloc.dart';
import 'package:hatofit/utils/helper/logger.dart';

class IntroState {
  double dxState = 0;
  double dyState = 0;
}

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroState());

  void updateDxState(double dx) {
    log?.d("dx: $dx ");
    safeEmit(
      IntroState()..dxState = dx,
      emit: emit,
      isClosed: isClosed,
    );
  }
}
