part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.authorized(String? message) = _Authorized;
  const factory SplashState.unauthorized(String message) = _Unauthorized;
  const factory SplashState.offline() = _Offline;
}
