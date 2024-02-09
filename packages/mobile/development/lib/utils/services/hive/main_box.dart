

// mixin class MainBoxMixin {
//   static late Box? mainBox;

//   static Future<void> entitiesRegister() async {
//     Hive.registerAdapter(UserEntityAdapter());
//     Hive.registerAdapter(MetricUnitsEntityAdapter());
//   }

//   static Future<void> initHive() async {
//     await Hive.initFlutter();
//     await entitiesRegister();
//     mainBox = await Hive.openBox('hatofit');
//   }

//   Future<void> addData<T>(MainBoxKeys key, T value) async {
//     await mainBox?.put(key.name, value);
//   }

//   Future<void> removeData(MainBoxKeys key) async {
//     await mainBox?.delete(key.name);
//   }

//   T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

//   Future<void> logoutBox() async {
//     /// Clear the box
//     removeData(MainBoxKeys.user);
//     removeData(MainBoxKeys.token);
//   }

//   Future<void> closeBox() async {
//     try {
//       if (mainBox != null) {
//         await mainBox?.close();
//         await mainBox?.deleteFromDisk();
//       }
//     } catch (e, stackTrace) {
//       FirebaseCrashLogger().nonFatalError(error: e, stackTrace: stackTrace);
//     }
//   }
// }
