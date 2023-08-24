import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../app/services/bluetooth_service.dart';
import '../../../app/themes/app_theme.dart';
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
        IconButton(
          icon: const Icon(CupertinoIcons.bell_fill),
          onPressed: () {},
        ),
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
                height: ThemeManager().screenHeight / 2,
                width: ThemeManager().screenWidth,
                child: FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 3)),
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
                              leading: Image.asset(
                                  bleService.detectedDevices[index].imageAsset),
                              title: Text(
                                bleService.detectedDevices[index].name,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'ID :${bleService.detectedDevices[index].deviceId}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    ' RSSI : ${bleService.detectedDevices[index].rssi}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              trailing: bleService.isConnectedDevice.value
                                  ? TextButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorConstants.crimsonRed)),
                                      child: const Text('Disconnect'),
                                      onPressed: () {
                                        bleService.disconnectDevice(bleService
                                            .detectedDevices[index].deviceId);
                                        Get.back();
                                      },
                                    )
                                  : TextButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  ColorConstants.ceruleanBlue)),
                                      child: const Text('Connect'),
                                      onPressed: () {
                                        bleService.connectDevice(bleService
                                            .detectedDevices[index].deviceId);
                                        Get.back();
                                        Get.dialog(
                                          connecting(
                                              deviceName: bleService
                                                  .detectedDevices[index].name,
                                              deviceId: bleService
                                                  .detectedDevices[index]
                                                  .deviceId),
                                          transitionCurve:
                                              Curves.easeInOutCubic,
                                        );
                                      },
                                    ),
                            );
                          },
                        );
                      }
                    }
                    return SizedBox(
                        height: ThemeManager().screenHeight / 2,
                        width: ThemeManager().screenWidth,
                        child: _noDevice());
                  },
                ))
          ],
        ),
      ),
    );
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
