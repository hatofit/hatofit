import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:intl/intl.dart';

class MoodController extends GetxController {
  final store = Get.find<PreferencesService>();
  RxString selectedMood = ''.obs;

  void selectMood(String mood) {
    store.todayMood = {
      'mood': mood,
      'date': DateFormat('d MMMM yyyy').format(DateTime.now()),
    };
    selectedMood.value = mood;
   }

  @override
  void onInit() {
    if (store.todayMood != null) {
      selectedMood.value = store.todayMood!['mood']!;
    }
    super.onInit();
  }
}

class MoodPickerWidget extends GetView<MoodController> {
  const MoodPickerWidget({Key? key}) : super(key: key); // Corrected here

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width:
            MediaQuery.of(context).size.width * 0.92, // Corrected to MediaQuery
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorConstants.darkContainer
              : ColorConstants.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildMoodItem('😄', 'happy'),
            buildMoodItem('😊', 'good'),
            buildMoodItem('😐', 'neutral'),
            buildMoodItem('😔', 'sad'),
            buildMoodItem('😢', 'awful'),
          ],
        ),
      ),
    );
  }

  Widget buildMoodItem(String emoji, String mood) {
    final isSelected = controller.selectedMood.value == mood;

    return GestureDetector(
      onTap: () {
        controller.selectMood(mood);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(left: 8, right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? ColorConstants.royalBlue.withOpacity(0.5) : null,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
