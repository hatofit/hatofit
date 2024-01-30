import 'package:get_it/get_it.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

GetIt di = GetIt.instance;

Future<void> mainInjection() async {
  await _initHiveBoxes();
  di.registerSingleton<DioClient>(DioClient());
  di.registerSingleton<ImagePickerClient>(ImagePickerClient());
  di.registerSingleton<BleClient>(BleClient());

  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  log?.i("Dependency Injection Done");
}

Future<void> _initHiveBoxes() async {
  await MainBoxMixin.initHive();
  di.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

void _dataSources() {
  di.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(di()),
  );
  di.registerLazySingleton<ImageLocalDataSource>(
    () => ImageLocalDataSourceImpl(di()),
  );
}

void _repositories() {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di(), di()),
  );
  di.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(di()),
  );
  di.registerLazySingleton<BluetoothRepository>(
    () => BluetoothRepositoryImpl(di()),
  );
}

void _useCase() {
  di.registerLazySingleton(() => LoginUsecase(di()));
  di.registerLazySingleton(() => RegisterUsecase(di()));
  di.registerLazySingleton(() => MeUseCase(di()));
  di.registerLazySingleton(() => ForgotPasswordUsecase(di()));
  di.registerLazySingleton(() => ImageFromCameraUsecase(di()));
  di.registerLazySingleton(() => ImageFromGalleryUsecase(di()));
  di.registerLazySingleton(() => VerifyCodeUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordUsecase(di()));
  di.registerLazySingleton(() => ConnectBluetoothUsecase(di()));
  di.registerLazySingleton(() => ScanBluetoothUsecase(di()));
  di.registerLazySingleton(() => RequestBluetoothUsecase(di()));
}

void _cubit() {
  di.registerFactory(() => SplashCubit(di()));
  di.registerFactory(() => AuthCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => IntroCubit());
  di.registerFactory(() => HomeCubit(
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => SettingsCubit());
  di.registerFactory(() => WorkoutCubit());
  di.registerFactory(() => ActivityCubit());
}
