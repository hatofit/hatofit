part of 'intro_cubit.dart';

@unfreezed
class IntroState with _$IntroState {
  factory IntroState({
    UserEntity? user,
    DataHelper? sLang,
    DataHelper? sEUnit,
    DataHelper? sHUnit,
    DataHelper? sWUnit,
  }) = _IntroState;
}
