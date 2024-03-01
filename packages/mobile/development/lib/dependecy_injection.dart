import 'package:get_it/get_it.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';

GetIt di = GetIt.instance;

Future<void> mainInjection() async {
  await _initHiveBoxes();
  await _initNetwork();

  di.registerLazySingleton<ImagePickerClient>(() => ImagePickerClient());
  di.registerLazySingleton<PolarClient>(() => PolarClient());
  di.registerLazySingleton<CommonClient>(() => CommonClient());

  _remoteDataSources();
  _localDataSources();
  _repositories();
  _useCase();
  _cubit();
}

Future<void> _initHiveBoxes() async {
  // await MainBoxMixin.initHive();
  await BoxClient.initHive();
  // di.registerSingleton<MainBoxMixin>(MainBoxMixin());
  di.registerSingleton<BoxClient>(BoxClient());
}

Future<void> _initNetwork() async {
  // await NetworkInfo.initNetworkInfo();
  di.registerSingleton<NetworkInfo>(NetworkInfo());
  di.registerSingleton<DioClient>(DioClient(
    di(),
  ));
  await RemoteConfig.init();
  di.registerSingleton<RemoteConfig>(RemoteConfig());
}

void _remoteDataSources() {
  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<ImageRemoteDataSource>(
    () => ImageRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<ExerciseRemoteDataSource>(
    () => ExerciseRemoteDataSourceImpl(di()),
  );
  di.registerLazySingleton<SessionRemoteDataSource>(
    () => SessionRemoteDataSourceImpl(di()),
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
  di.registerLazySingleton<AppConfigLocalDataSource>(
    () => AppConfigLocalDataSourceImpl(di()),
  );
}

void _repositories() {
  di.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(di(), di(), di()),
  );
  di.registerLazySingleton<PolarBLERepo>(
    () => PolarBLERepoImpl(di()),
  );
  di.registerLazySingleton<CommonBLERepo>(
    () => CommonBLERepoImpl(di()),
  );
  di.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(
      di(),
      di(),
      di(),
    ),
  );

  di.registerLazySingleton<ExerciseRepo>(
    () => ExerciseRepoImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<SessionRepo>(
    () => SessionRepoImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<ReportRepo>(
    () => ReportRepoImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<FirebaseRemoteConfigRepo>(
    () => FirebaseRemoteConfigRepoImpl(
      di(),
      di(),
      di(),
    ),
  );
  di.registerLazySingleton<AppConfigRepo>(
    () => AppConfigRepoImpl(
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

  /// [Bluetooth - Common]
  di.registerLazySingleton(() => ReqBLEPermUsecase(di()));
  di.registerLazySingleton(() => AdapterStateBLEUsecase(di()));
  di.registerLazySingleton(() => ConnectCommonBLEUsecase(di()));
  di.registerLazySingleton(() => DisconnectCommonBleUsecase(di()));
  di.registerLazySingleton(() => GetServicesCommonBLEUsecase(di()));
  di.registerLazySingleton(() => IsScanningBLEUsecase(di()));
  di.registerLazySingleton(() => ScanCommonBLEUsecase(di()));
  di.registerLazySingleton(() => ScanResultsBLEUsecase(di()));
  di.registerLazySingleton(() => StopScanBLEUsecase(di()));
  di.registerLazySingleton(() => StreamCommonBLEUsecase(di()));
  di.registerLazySingleton(() => ReadCommonBLEUsecase(di()));

  /// [Bluetooth - Polar]
  di.registerLazySingleton(() => ConnectPolarBLEUsecase(di()));
  di.registerLazySingleton(() => DisconnectPolarBLEUsecase(di()));
  di.registerLazySingleton(() => GetServicesPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StatePolarBleUsecase(di()));
  di.registerLazySingleton(() => StreamHrPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamEcgPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamAccPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamGyroPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamMagnetometerPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamPpgPolarBLEUsecase(di()));

  /// [Image]
  ///
  di.registerLazySingleton(() => ImageFromCameraUsecase(di()));
  di.registerLazySingleton(() => ImageFromGalleryUsecase(di()));
  di.registerLazySingleton(() => DownloadImageUsecase(di()));

  /// [Exercise]
  ///
  di.registerLazySingleton(() => ExerciseByIdUsecase(di()));
  di.registerLazySingleton(() => ExerciseAllUsecase(di()));

  /// [Session]
  ///
  di.registerLazySingleton(() => SessionAllUsecase(di()));
  di.registerLazySingleton(() => SessionByIdUsecase(di()));
  di.registerLazySingleton(() => CreateSessionUsecase(di()));
  di.registerLazySingleton(() => SessionDeleteAllUsecase(di()));

  /// [User]
  ///
  di.registerLazySingleton(() => ReadUserUsecase(di()));
  di.registerLazySingleton(() => ReadMoodUsecase(di()));
  di.registerLazySingleton(() => ReadTokenUsecase(di()));
  di.registerLazySingleton(() => UpsertUserUsecase(di()));
  di.registerLazySingleton(() => UpdateTokenUsecase(di()));
  di.registerLazySingleton(() => UpdateMoodUsecase(di()));
  di.registerLazySingleton(() => DeleteMoodUsecase(di()));
  di.registerLazySingleton(() => DeleteTokenUsecase(di()));
  di.registerLazySingleton(() => DeleteUserUsecase(di()));

  /// [Report]
  ///
  di.registerLazySingleton(() => ReportAllUsecase(di()));
  di.registerLazySingleton(() => ReportByIdUsecase(di()));

  /// [Firebase]
  ///
  di.registerLazySingleton(() => GetStringFirebaseUsecase(di()));
  di.registerLazySingleton(() => GetBoolFirebaseUsecase(di()));

  /// [App Config]
  ///
  di.registerLazySingleton(() => ReadActiveThemeUsecase(di()));
  di.registerLazySingleton(() => ReadLanguageUsecase(di()));
  di.registerLazySingleton(() => GetOfflineModeUsecase(di()));
  di.registerLazySingleton(() => UpdateActiveThemeUsecase(di()));
  di.registerLazySingleton(() => UpesertLanguageUsecase(di()));
  di.registerLazySingleton(() => UpdateOfflineModeUsecase(di()));
}

void _cubit() {
  di.registerFactory(() => SplashCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => AuthCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => IntroCubit(
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => HomeCubit(
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => SettingsCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => WorkoutCubit(
        di(),
        di(),
        di(),
      ));
  di.registerFactory(() => ActivityCubit(
        di(),
      ));
  regNavCubit();
}

void regNavCubit() {
  di.registerFactory(() => NavigationCubit(
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        di(),
        // di(),
      ));
}
