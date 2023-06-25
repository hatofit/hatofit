import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/widget/appBar/detected_devices_modal.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchBar;
  final bool isSubPage;
  final Color screenColor;

  const CustomAppBar({
    this.title = '',
    this.isSubPage = false,
    this.showSearchBar = false,
    this.screenColor = ColorPalette.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(68);
}

class _CustomAppBarState extends State<CustomAppBar> {
  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
      ),
      color: widget.screenColor,
      child: Material(
        color: widget.screenColor,
        borderRadius: BorderRadius.circular(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.isSubPage)
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            else
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.gps_fixed),
                  onPressed: () {},
                ),
                Obx(
                  () => IconButton(
                    icon: controller.isConnectedDevice.value
                        ? const Icon(Icons.bluetooth_connected)
                        : const Icon(Icons.bluetooth_disabled),
                    onPressed: () {
                      if (controller.isBluetoothOn.value) {
                        DetectedDevicesModal().showModal();
                      } else {
                        controller.turnOnBluetooth();
                        Get.snackbar(
                            'Bluetooth is off', 'Please turn on bluetooth',
                            snackPosition: SnackPosition.TOP);
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
