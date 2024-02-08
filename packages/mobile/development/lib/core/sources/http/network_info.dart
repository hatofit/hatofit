import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/services/firebase/firebase_crashlogger.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfo with FirebaseCrashLogger {
  static late InternetConnection? _hatoftServer;
  static late InternetConnection? _globalServer;

  // static Future<void> initNetworkInfo() async {
  //   try {
  //     _hatoftServer = _createHatofit();
  //     _globalServer = _createGlobal();
  //   } catch (error, stackTrace) {
  //     log.e('NetworkInfo: $error');
  //   }
  // }

  NetworkInfo() {
    try {
      _hatoftServer = _createHatofit();
      _globalServer = _createGlobal();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  InternetConnection get hatofitInstance {
    try {
      _hatoftServer = _createHatofit();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _hatoftServer!;
  }

  InternetConnection get globalInstance {
    try {
      _globalServer = _createGlobal();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _globalServer!;
  }

  static InternetConnection _createHatofit() {
    return InternetConnection.createInstance(
      useDefaultOptions: false,
      customCheckOptions: [
        InternetCheckOption(
          uri: Uri.parse("${APIConstant.get.baseUrl}/api"),
        ),
      ],
    );
  }

  static InternetConnection _createGlobal() =>
      InternetConnection.createInstance();

  Future<bool> get isHatofitConnected => hatofitInstance.hasInternetAccess;
  Future<bool> get isGlobalConnected => globalInstance.hasInternetAccess;
}
