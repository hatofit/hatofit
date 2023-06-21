import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';

class MoodController extends GetxController {
  RxString selectedMood = ''.obs;

  void selectMood(String mood) {
    selectedMood.value = mood;
  }
}

class MoodPickerWidget extends StatelessWidget {
  const MoodPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildMoodItem('😄', 'happy'),
          buildMoodItem('😊', 'good'),
          buildMoodItem('😐', 'neutral'),
          buildMoodItem('😔', 'sad'),
          buildMoodItem('😢', 'awful'),
        ],
      ),
    );
  }

  Widget buildMoodItem(String emoji, String mood) {
    final MoodController moodController = Get.put(MoodController());
    final isSelected = moodController.selectedMood.value == mood;

    return GestureDetector(
      onTap: () {
        moodController.selectMood(mood);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(left: 8, right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? ColorPalette.royalBlue50 : null,
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
