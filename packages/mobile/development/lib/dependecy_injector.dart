import 'package:get_it/get_it.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/repositories/auth_repository.dart';
import 'package:hatofit/utils/utils.dart';

GetIt di = GetIt.instance;

Future<void> dependencyInjection() async {
  await _initHiveBoxes();
  _repositories();
}

Future<void> _initHiveBoxes() async {
  await MainBoxMixin.initHive();
  di.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

void _repositories() {
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(di(), di()),
  );
}
