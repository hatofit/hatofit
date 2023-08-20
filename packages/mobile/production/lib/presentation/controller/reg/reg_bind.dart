import 'package:get/get.dart';
import 'package:hatofit/data/repos/image_repo_iml.dart';
import 'package:hatofit/domain/usecases/image_camera_uc.dart';

import 'reg_con.dart';

class RegBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImageCameraUC(Get.put(ImageRepoIml())));
    Get.put(RegCon(Get.find<ImageCameraUC>()));
  }
}
