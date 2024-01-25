part of 'intro_cubit.dart';

@unfreezed
class IntroState with _$IntroState {
  factory IntroState({
    String? selectedGender,
    String? selectedHeigtUnit,
    String? selectedWeightUnit,
    int? height,
    int? weight,
  }) = _IntroState;
}
