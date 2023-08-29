import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';

class ExerciseNowWidget extends StatelessWidget {
  const ExerciseNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BluetoothService bCon = Get.find<BluetoothService>();
    final height = MediaQuery.of(context).size.height * 0.12;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconWrapper(
              icon: Icons.start,
              iconColor: ColorConstants.crimsonRed,
              backgroundColor: ColorConstants.crimsonRed.withOpacity(0.35),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Exercise Now',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
              width: 16,
            ),
            IconWrapper(
              icon: Icons.start,
              iconColor: ColorConstants.crimsonRed,
              backgroundColor: ColorConstants.crimsonRed.withOpacity(0.35),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: SizedBox(
              height: height * 0.5,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (bCon.isConnectedDevice.value == true) {
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
                  'Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
