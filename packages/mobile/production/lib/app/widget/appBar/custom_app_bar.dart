import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';

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
  final bluetoothService = Get.put(BluetoothService());
  final polarService = Get.put(PolarService());
  final isDarkMode = Get.isDarkMode;
  @override
  void initState() {
    super.initState();
    polarService.polar.deviceConnecting
        .listen((event) => debugPrint('Device connecting'));
    polarService.polar.batteryLevel.listen((e) {
      debugPrint('ID : ${e.identifier}\nBattery: ${e.level}');
    });
    polarService.polar.deviceConnected.listen((event) {
      polarService.connectedDeviceId = event.deviceId;
      bluetoothService.isConnectedDevice.value = true;
      debugPrint(
          'Device connected to ${event.deviceId} ${bluetoothService.isConnectedDevice.value}');
    });
    polarService.polar.deviceDisconnected.listen((event) {
      polarService.connectedDeviceId = 'Device disconnected';
      polarService.heartRate.value = '--';
      bluetoothService.isConnectedDevice.value = false;
      debugPrint(
          'Device disconnected from ${event.deviceId} ${bluetoothService.isConnectedDevice.value}');
    });
  }

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
            icon: bluetoothService.isBluetoothOn.value
                ? Icon(
                    FontAwesomeIcons.bluetooth,
                    color: bluetoothService.isConnectedDevice.value
                        ? Colors.blueAccent
                        : Theme.of(context).iconTheme.color,
                  )
                : const Icon(Icons.bluetooth_disabled),
            onPressed: () {
              if (bluetoothService.isBluetoothOn.value) {
                polarService.scanPolarDevices();
                showModal();
              } else {
                Get.snackbar('Turning on Bluetooth', 'Allow Turn on Bluetooth',
                    duration: const Duration(seconds: 5),
                    colorText: isDarkMode ? Colors.white : Colors.black,
                    backgroundColor: isDarkMode
                        ? ColorConstants.darkContainer.withOpacity(0.9)
                        : ColorConstants.lightContainer.withOpacity(0.9));
                bluetoothService.turnOnBluetooth().then((value) {
                  polarService.scanPolarDevices();
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
                height: ThemeManager().screenHeight / 5,
                width: ThemeManager().screenWidth,
                child: FutureBuilder(
                  future: polarService.detectedDevices.isEmpty
                      ? Future.delayed(const Duration(seconds: 3))
                      : null,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        width: 20,
                        height: 20,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error:${snapshot.error}'),
                      );
                    } else if (polarService.detectedDevices.isEmpty) {
                      return const Center(
                        child: Text(
                            "Didn't see any device🫣,\nmake sure your device is turn on"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: polarService.detectedDevices.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset(
                              polarService.detectedDevices[index]['imageURL'],
                              height: 50,
                              width: 50,
                            ),
                            title: Text(
                              polarService.detectedDevices[index]['name'],
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'ID :${polarService.detectedDevices[index]['deviceId']}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  ' RSSI : ${polarService.detectedDevices[index]['rssi']}',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            trailing: Obx(
                              () => bluetoothService.isConnectedDevice.value
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
                                        polarService.disconnectDevice(
                                            polarService.detectedDevices[index]
                                                ['deviceId']);
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
                                        bluetoothService.getBluetoothStatus();
                                        polarService.connectDevice(
                                            polarService.detectedDevices[index]
                                                ['deviceId']);
                                        Get.back();
                                        Get.dialog(
                                          Obx(
                                            () => Center(
                                                child: bluetoothService
                                                            .isConnectedDevice
                                                            .value ==
                                                        false
                                                    ? Dialog(
                                                        child: SizedBox(
                                                        height: 300,
                                                        width: 150,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                                'Connecting to',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyLarge),
                                                            const SizedBox(
                                                              height: 32,
                                                            ),
                                                            const CupertinoActivityIndicator(
                                                              radius: 48,
                                                            ),
                                                            const SizedBox(
                                                              height: 32,
                                                            ),
                                                            Text(
                                                                '${polarService.detectedDevices[index]['name']}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displaySmall),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),
                                                            Text(
                                                                'Device ID : ${polarService.detectedDevices[index]['deviceId']}',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium),
                                                          ],
                                                        ),
                                                      ))
                                                    : FutureBuilder(
                                                        future: Future.delayed(
                                                            const Duration(
                                                                seconds: 3),
                                                            () {
                                                          Get.back();
                                                        }),
                                                        builder: (context,
                                                                snapshot) =>
                                                            const Dialog(
                                                                child: Text(
                                                                    'Connected')),
                                                      )),
                                          ),
                                          transitionCurve:
                                              Curves.easeInOutCubic,
                                        );
                                      },
                                    ),
                            ),
                            onTap: () {},
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
