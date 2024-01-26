import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/utils/utils.dart';

part 'intro_cubit.freezed.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> with MainBoxMixin {
  IntroCubit() : super(IntroState());

  void updateGender(String gender) {
    addData(MainBoxKeys.gender, gender);
    getState();
  }

  void updateHeight(int height) {
    addData(MainBoxKeys.height, height);
    getState();
  }

  void updateWeight(int weight) {
    addData(MainBoxKeys.weight, weight);
    getState();
  }

  void updateDateOfBirth(String dateOfBirth) {
    addData(MainBoxKeys.dateOfBirth, dateOfBirth);
    getState();
  }

  void updateAll() {
    int height = getData(MainBoxKeys.height) ?? 150;
    int weight = getData(MainBoxKeys.weight) ?? 125;
    String gender = getData(MainBoxKeys.gender) ?? "male";

    addData(MainBoxKeys.height, height);
    addData(MainBoxKeys.weight, weight);
    addData(MainBoxKeys.gender, gender);
  }

  void getState() {
    safeEmit(
      IntroState(
        selectedGender: getData(MainBoxKeys.gender),
        selectedHeigtUnit: getData(MainBoxKeys.heightUnit),
        selectedWeightUnit: getData(MainBoxKeys.weightUnit),
        height: getData(MainBoxKeys.height),
        weight: getData(MainBoxKeys.weight),
      ),
      emit: emit,
      isClosed: isClosed,
    );
  }
}
