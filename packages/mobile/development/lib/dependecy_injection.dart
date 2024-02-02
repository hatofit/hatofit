import 'package:get_it/get_it.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

GetIt di = GetIt.instance;

Future<void> mainInjection() async {
  await _initHiveBoxes();
  await _initNetwork();

  di.registerSingleton<ImagePickerClient>(ImagePickerClient());
  di.registerSingleton<BleClient>(BleClient());
  di.registerSingleton<NativeMethods>(NativeMethodsImpl());

  _remoteDataSources();
  _localDataSources();
  _repositories();
  _useCase();
  _cubit();
  log?.i("Dependency Injection Done");
}

Future<void> _initNetwork() async {
  await NetworkInfo.iniNetworkInfo();
  di.registerSingleton<NetworkInfo>(NetworkInfo());
  di.registerSingleton<DioClient>(DioClient());
}

Future<void> _initHiveBoxes() async {
  await MainBoxMixin.initHive();
  await BoxClient.initHive();
  di.registerSingleton<MainBoxMixin>(MainBoxMixin());
  di.registerSingleton<BoxClient>(BoxClient());
}

void _remoteDataSources() {
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<ExerciseRemoteDataSource>(
    () => ExerciseRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<SessionRemoteDataSource>(
    () => SessionRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<ReportRemoteDataSource>(
    () => ReportRemoteDataSourceImpl(di()),
  );
}

void _localDataSources() {
  di.registerLazySingleton<ImageLocalDataSource>(
    () => ImageLocalDataSourceImpl(di()),
  );
  di.registerLazySingleton<ExerciseLocalDataSource>(
    () => ExerciseLocalDataSourceImpl(di()),
  );
  di.registerLazySingleton<SessionLocalDataSource>(
    () => SessionLocalDataSourceImpl(di()),
  );
  di.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(di()),
  );
  di.registerLazySingleton<ReportLocalDataSource>(
    () => ReportLocalDataSourceImpl(di()),
  );
}

void _repositories() {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di(), di(), di()),
  );
  di.registerLazySingleton<ImageRepository>(
    () => ImageRepositoryImpl(di()),
  );
  di.registerLazySingleton<BluetoothRepository>(
    () => BluetoothRepositoryImpl(di()),
  );
  di.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<SessionRepository>(
    () => SessionRepositoryImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<ReportRepository>(
    () => ReportRepositoryImpl(
      di(),
      di(),
      di(),
    ),
  );
}

void _useCase() {
  /// [Auth]
  ///
  di.registerLazySingleton(() => LoginUsecase(di()));
  di.registerLazySingleton(() => RegisterUsecase(di()));
  di.registerLazySingleton(() => MeUseCase(di()));
  di.registerLazySingleton(() => ForgotPasswordUsecase(di()));
  di.registerLazySingleton(() => VerifyCodeUseCase(di()));
  di.registerLazySingleton(() => ResetPasswordUsecase(di()));

  /// [Bluetooth]
  ///
  di.registerLazySingleton(() => ScanBluetoothUsecase(di()));
  di.registerLazySingleton(() => BleStatusUcecase(di()));
  di.registerLazySingleton(() => RequestBluetoothUsecase(di()));
  di.registerLazySingleton(() => GetCommonServicesUsecase(di()));
  di.registerLazySingleton(() => ReadCharacteristicUsecase(di()));
  di.registerLazySingleton(() => ClearGattCacheUsecase(di()));
  di.registerLazySingleton(() => ConnectCommonBleUsecase(di()));
  di.registerLazySingleton(() => ConnectPolarBleUsecase(di()));
  di.registerLazySingleton(() => GetPolarServicesUsecase(di()));
  di.registerLazySingleton(() => GetHrPolarUsecase(di()));
  di.registerLazySingleton(() => GetHrCommonUsecase(di()));

  /// [Image]
  ///
  di.registerLazySingleton(() => ImageFromCameraUsecase(di()));
  di.registerLazySingleton(() => ImageFromGalleryUsecase(di()));

  /// [Exercise]
  ///
  di.registerLazySingleton(() => GetExercisesUsecase(di()));

  /// [Session]
  ///
  di.registerLazySingleton(() => GetSessionsUsecase(di()));
  di.registerLazySingleton(() => GetSessionUsecase(di()));

  /// [User]
  ///
  di.registerLazySingleton(() => GetUserUsecase(di()));

  /// [Report]
  ///
  di.registerLazySingleton(() => GetReportsUsecase(di()));
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
  di.registerFactory(() => WorkoutCubit(
        di(),
      ));
  di.registerFactory(() => ActivityCubit(
        di(),
      ));

  di.registerFactory(() => NavigationCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
}
