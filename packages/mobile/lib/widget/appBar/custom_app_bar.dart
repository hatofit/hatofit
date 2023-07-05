import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/services/bluetooth_service.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchBar;
  final bool isSubPage;
  final Color screenColor;
  CustomAppBar({
    this.title = '',
    this.isSubPage = false,
    this.showSearchBar = false,
    this.screenColor = ColorPalette.backgroundColor,
    Key? key,
  }) : super(key: key);
  final bluetoothService = Get.put(BluetoothService());
  final polarService = Get.put(PolarService());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
      ),
      color: screenColor,
      child: Material(
        color: screenColor,
        borderRadius: BorderRadius.circular(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isSubPage)
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
                    title,
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
                    icon: bluetoothService.isConnectedDevice.value
                        ? const Icon(Icons.bluetooth_connected)
                        : const Icon(Icons.bluetooth_disabled),
                    onPressed: () {
                      if (bluetoothService.isBluetoothOn.value) {
                        polarService.scanPolarDevices();
                        showModal();
                      } else {
                        bluetoothService.turnOnBluetooth();
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

  void showModal() {
    Get.bottomSheet(
      Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(32),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 5,
              width: Get.height / 3,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(124)),
            ),
            GetBuilder<PolarService>(
              builder: (polarService) => SizedBox(
                height: polarService.screenHeight / 5,
                width: polarService.screenWidth,
                child: ListView.builder(
                  itemCount: polarService.detectedDevices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: polarService.detectedDevices[index]
                            ['imageURL'],
                        height: 50,
                        width: 50,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: CustomText(
                        text: polarService.detectedDevices[index]['name'],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: Row(
                        children: [
                          CustomText(
                            text:
                                'ID :${polarService.detectedDevices[index]['deviceId']}',
                            fontSize: 12,
                          ),
                          CustomText(
                            text:
                                ' RSSI : ${polarService.detectedDevices[index]['rssi']}',
                            fontSize: 12,
                          ),
                        ],
                      ),
                      trailing: Obx(
                        () => bluetoothService.isConnectedDevice.value
                            ? TextButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorPalette.black00),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorPalette.crimsonRed)),
                                child: const Text('Disconnect'),
                                onPressed: () {
                                  polarService.disconnectDevice(polarService
                                      .detectedDevices[index]['deviceId']);
                                  Get.back();
                                },
                              )
                            : TextButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorPalette.black00),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            ColorPalette.ceruleanBlue)),
                                child: const Text('Connect'),
                                onPressed: () {
                                  polarService.connectDevice(polarService
                                      .detectedDevices[index]['deviceId']);
                                  Get.back();
                                },
                              ),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
