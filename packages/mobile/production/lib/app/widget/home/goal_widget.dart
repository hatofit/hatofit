import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

class GoalWidget extends StatelessWidget {
  final double width;
  final double height;
  const GoalWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final BluetoothService _bCon = Get.find<BluetoothService>();
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorConstants.darkContainer
              : ColorConstants.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Free Workout',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Center(
              child: SizedBox(
                  height: height * 0.4,
                  width: width * 0.85,
                  child: TextButton(
                    onPressed: () {
                      if (_bCon.isConnectedDevice.value == true) {
                        Get.toNamed(AppRoutes.freeWorkout);
                      } else {
                        Get.snackbar(
                          'No Device Connected',
                          'Please connect to a device to start a workout',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          colorText: Colors.black,
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorConstants.crimsonRed),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Start Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  )),
            )
          ],
        ));
  }
}
