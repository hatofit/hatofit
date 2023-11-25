import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/polar_device.dart';
import 'package:hatofit/utils/snackbar.dart';

import '../../../app/services/bluetooth_service.dart';
import '../../../app/themes/colors_constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchBar;
  final bool isSubPage;
  final Color screenColor;
  const CustomAppBar({
    this.title = '',
    this.isSubPage = false,
    this.showSearchBar = false,
    this.screenColor = Colors.transparent,
    Key? key,
  }) : super(key: key);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final bleService = Get.put(BluetoothService());
  final isDarkMode = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isSubPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: widget.isSubPage
          ? null
          : Text(widget.title, style: Theme.of(context).textTheme.displaySmall),
      actions: [
        Obx(
          () => IconButton(
            icon: bleService.isBluetoothOn.value
                ? Icon(
                    FontAwesomeIcons.bluetooth,
                    color: bleService.isConnectedDevice.value
                        ? Colors.blueAccent
                        : Theme.of(context).iconTheme.color,
                  )
                : const Icon(Icons.bluetooth_disabled),
            onPressed: () {
              if (bleService.isBluetoothOn.value) {
                bleService.scanPolarDevices();
                showModal();
              } else {
                Get.snackbar('Turning on Bluetooth', 'Allow Turn on Bluetooth',
                    duration: const Duration(seconds: 5),
                    colorText: isDarkMode ? Colors.white : Colors.black,
                    backgroundColor: isDarkMode
                        ? ColorConstants.darkContainer.withOpacity(0.9)
                        : ColorConstants.lightContainer.withOpacity(0.9));
                bleService.turnOnBluetooth().then((value) {
                  bleService.scanPolarDevices();
                });
              }
            },
          ),
        ),
        // IconButton(
        //   icon: Icon(
        //       Get.isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon),
        //   onPressed: () {
        //     final isDarkMode = Get.isDarkMode;
        //     debugPrint('before isDarkMode $isDarkMode');

        //     if (isDarkMode) {
        //       Get.changeThemeMode(ThemeMode.light);
        //       Get.find<PreferencesService>().isDarkMode = false;
        //     } else {
        //       Get.changeThemeMode(ThemeMode.dark);
        //       Get.find<PreferencesService>().isDarkMode = true;
        //     }

        //     debugPrint(
        //         'isDarkMode ${Get.find<PreferencesService>().isDarkMode}');
        //   },
        // ),
      ],
    );
  }

  Widget _noDevice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't see any device🤔",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Make sure your device is turn on',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 32,
        ),
        TextButton(
          onPressed: () {
            bleService.scanPolarDevices();
            Get.back();
            showModal();
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  ColorConstants.ceruleanBlue)),
          child: const Text('Try Again'),
        )
      ],
    );
  }

  Future<void> showModal() {
    return Get.bottomSheet(
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
            SizedBox(
                height: Get.height / 2,
                width: Get.width,
                child: FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (bleService.detectedDevices.isEmpty) {
                        return _noDevice();
                      } else {
                        return ListView.builder(
                          itemCount: bleService.detectedDevices.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Image.asset(bleService
                                    .detectedDevices[index].imageAsset),
                              ),
                              title: Text(
                                bleService.detectedDevices[index].info.name,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'ID :${bleService.detectedDevices[index].info.deviceId}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Obx(
                                    () => Text(
                                      ' RSSI : ${bleService.detectedDevices[index].info.rssi}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: _handleButton(
                                  bleService.detectedDevices[index]),
                            );
                          },
                        );
                      }
                    }
                    return SizedBox(
                        height: Get.height / 2,
                        width: Get.width,
                        child: _noDevice());
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget _handleButton(PolarDevice device) {
    final deviceId = device.info.deviceId;
    final isConnect = device.isConnect;
    // check if is another device is connected ,return disable grey button

    if (isConnect.value == true) {
      return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.crimsonRed)),
        child: const Text('Disconnect'),
        onPressed: () {
          bleService.disconnectDevice(device);
          Get.back();
        },
      );
    } else if (bleService.detectedDevices
        .where((element) => element.isConnect.value == true)
        .isNotEmpty) {
      return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade400)),
        child: const Text('Connect'),
        onPressed: () {
          MySnackbar.error(
              'Another Device Connected', 'Please disconnect the device first');
        },
      );
    } else {
      return TextButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(ColorConstants.ceruleanBlue)),
        child: const Text('Connect'),
        onPressed: () {
          bleService.connectDevice(device);
          Get.back();
          Get.dialog(
            connecting(
                deviceName: bleService.detectedDevices
                    .firstWhere((element) => element.info.deviceId == deviceId)
                    .info
                    .name,
                deviceId: bleService.detectedDevices
                    .firstWhere((element) => element.info.deviceId == deviceId)
                    .info
                    .deviceId),
            transitionCurve: Curves.easeInOutCubic,
          );
        },
      );
    }
  }

  Dialog connecting({required String deviceName, required String deviceId}) {
    return Dialog(
        child: SizedBox(
      height: 300,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Connecting to', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 32,
          ),
          const CupertinoActivityIndicator(
            radius: 48,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(deviceName, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(
            height: 4,
          ),
          Text('Device ID : $deviceId',
              style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    ));
  }
}
