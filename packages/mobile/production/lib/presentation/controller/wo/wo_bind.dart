import 'package:get/get.dart';
import 'package:hatofit/data/repos/session_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/sesion/save_session_api_uc.dart';
import 'package:hatofit/presentation/controller/wo/wo_con.dart';

class WoBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SessionRepoIml());
    Get.lazyPut(() => SaveSessionApiUc(Get.find<SessionRepoIml>()));
     Get.lazyPut(() =>WoCon(Get.find<SaveSessionApiUc>()));
  }
}
