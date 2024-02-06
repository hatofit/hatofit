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

  di.registerLazySingleton<ImagePickerClient>(() => ImagePickerClient());
  di.registerLazySingleton<PolarClient>(() => PolarClient());
  di.registerLazySingleton<CommonClient>(() => CommonClient());
  di.registerSingleton<NativeMethods>(NativeMethodsImpl());

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
  await NetworkInfo.initNetworkInfo();
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

  /// [Bluetooth - Polar]
  di.registerLazySingleton(() => ConnectPolarBLEUsecase(di()));
  di.registerLazySingleton(() => DisconnectPolarBLEUsecase(di()));
  di.registerLazySingleton(() => GetServicesPolarBLEUsecase(di()));
  di.registerLazySingleton(() => StreamHrPolarBLEUsecase(di()));

  /// [Image]
  ///
  di.registerLazySingleton(() => ImageFromCameraUsecase(di()));
  di.registerLazySingleton(() => ImageFromGalleryUsecase(di()));
  di.registerLazySingleton(() => DownloadImageUsecase(di()));

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
  di.registerLazySingleton(() => GetMoodUsecase(di()));
  di.registerLazySingleton(() => GetTokenUsecase(di()));
  di.registerLazySingleton(() => UpdateUserUsecase(di()));
  di.registerLazySingleton(() => UpdateTokenUsecase(di()));
  di.registerLazySingleton(() => UpdateMoodUsecase(di()));
  di.registerLazySingleton(() => ClearMoodUsecase(di()));
  di.registerLazySingleton(() => ClearTokenUsecase(di()));
  di.registerLazySingleton(() => ClearUserUsecase(di()));

  /// [Report]
  ///
  di.registerLazySingleton(() => GetReportsUsecase(di()));

  /// [Firebase]
  ///
  di.registerLazySingleton(() => GetStringFirebaseUsecase(di()));

  /// [App Config]
  ///
  di.registerLazySingleton(() => GetActiveThemeUsecase(di()));
  di.registerLazySingleton(() => GetLanguageUsecase(di()));
  di.registerLazySingleton(() => GetOfflineModeUsecase(di()));
  di.registerLazySingleton(() => UpdateActiveThemeUsecase(di()));
  di.registerLazySingleton(() => UpdateLanguageUsecase(di()));
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
      ));
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
        di(),
        di(),
        di(),
        di(),
        di(),
      ));
}
