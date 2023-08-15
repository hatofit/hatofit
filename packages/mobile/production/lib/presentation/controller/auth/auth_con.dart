import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_uc.dart';
import '../../../domain/usecases/register_uc.dart';

class AuthCon extends GetxController {
  final RegisterUC _registerUC;
  final LoginUC _loginUC;
  AuthCon(this._registerUC, this._loginUC);

  Future<void> register(User user) async {
    await _registerUC.execute(user);
  }

  login({required String email, required String password}) async {
    try {
      final res = await _loginUC.execute(Tuple2(email, password));
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) {
        final user = User.fromJson(success.data['user']);
        Get.snackbar(
            'Welcome back', 'Glade to see you again, ${user.firstName} :)');
      });
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}
