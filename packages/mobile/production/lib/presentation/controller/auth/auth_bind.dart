import 'package:get/get.dart';
import 'package:hatofit/data/repos/auth_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/auth/login_uc.dart';
import 'package:hatofit/domain/usecases/api/auth/register_uc.dart';
import 'package:hatofit/presentation/controller/auth/auth_con.dart';

class AuthBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUC(Get.find<AuthRepoIml>()));
    Get.lazyPut(() => LoginUC(Get.find<AuthRepoIml>()));
    Get.put(AuthCon(Get.find<RegisterUC>(), Get.find<LoginUC>()));
  }
}
