import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final _prefs = PreferencesService();
  final title = 'Hi'.obs;
  final String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());

  final store = Get.find<PreferencesService>();

  UserModel? user;

  @override
  void onInit() async {
    user = store.user;
    final f = store.user!.firstName!;
    final l =  store.user!.lastName!;
    title.value = 'Hi, $f $l 👋';
    super.onInit();
  }
}
