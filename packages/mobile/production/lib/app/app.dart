import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_pages.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/services/storage_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/presentation/controller/auth/auth_bind.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hato Fit',
      initialRoute: AppRoutes.splash,
      initialBinding: AuthBind(),
      getPages: AppPages.list,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
    );
  }
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => StorageService().init());
}
