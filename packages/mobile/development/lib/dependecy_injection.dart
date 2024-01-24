import 'package:get_it/get_it.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

GetIt di = GetIt.instance;

Future<void> dependencyInjection() async {
  await _initHiveBoxes();
  di.registerSingleton<DioClient>(DioClient());

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
}

void _repositories() {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di(), di()),
  );
}

void _useCase() {
  di.registerLazySingleton(() => LoginUsecase(di()));
  di.registerLazySingleton(() => RegisterUsecase(di()));
  di.registerLazySingleton(() => MeUseCase(di()));
}

void _cubit() {
  di.registerFactory(() => SplashCubit(di()));
  di.registerFactory(() => AuthCubit());
  di.registerFactory(() => IntroCubit());
  di.registerFactory(() => HomeCubit());
  di.registerFactory(() => SettingsCubit());
  di.registerFactory(() => WorkoutCubit());
  di.registerFactory(() => ActivityCubit());
}
