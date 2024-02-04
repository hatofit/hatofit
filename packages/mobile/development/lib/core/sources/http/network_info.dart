import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/services/firebase/firebase_crashlogger.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfo with FirebaseCrashLogger {
  static late InternetConnection? _internetConnectionChecker;

  static Future<void> iniNetworkInfo() async {
    _internetConnectionChecker = _createInstance();
  }

  NetworkInfo() {
    try {
      _internetConnectionChecker = _createInstance();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
  }

  InternetConnection get instance {
    try {
      _internetConnectionChecker = _createInstance();
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
    }
    return _internetConnectionChecker!;
  }

  static InternetConnection _createInstance() =>
      InternetConnection.createInstance(
        customCheckOptions: [
          InternetCheckOption(
            uri: Uri.parse(APIConstant.get.baseUrl),
          ),
        ],
        useDefaultOptions: false,
      );

  Future<bool> get isConnected => instance.hasInternetAccess;
}
