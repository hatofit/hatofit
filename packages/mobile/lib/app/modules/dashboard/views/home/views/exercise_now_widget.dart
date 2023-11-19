import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';
import 'package:hatofit/utils/snackbar.dart';

class ExerciseNowWidget extends StatelessWidget {
  const ExerciseNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.3;
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
            const SizedBox(
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
          height: 16,
        ),
        SvgPicture.asset(
          'assets/images/icons8-yoga.svg',
          height: height * 0.65,
          colorFilter: ColorFilter.mode(
              Get.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: SizedBox(
              height: height * 0.2,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  final bleSrvice = Get.find<BluetoothService>();
                  if (bleSrvice.detectedDevices.isEmpty) {
                    MySnackbar.error(
                        'No Device Detected', 'Please connect a device');
                  } else {
                    final devices = bleSrvice.detectedDevices.firstWhere(
                        (element) => element.isConnect.value == true);

                    if (devices.isConnect.value == true) {
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
