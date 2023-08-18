import 'package:get/get.dart';

import 'wo_con.dart';

class WoBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WoCon>(() => WoCon());
  }
}
