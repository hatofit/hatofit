import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/polar_device.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/utils/snackbar.dart';

class DeviceIntegrationPage extends StatefulWidget {
  const DeviceIntegrationPage({super.key});

  @override
  State<DeviceIntegrationPage> createState() => _DeviceIntegrationPageState();
}

class _DeviceIntegrationPageState extends State<DeviceIntegrationPage> {
  final bleService = Get.find<BluetoothService>();
  @override
  void initState() {
    bleService.scanPolarDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Discoverable Devices',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: Get.height / 2,
        width: Get.width,
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
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
                        child: Image.asset(
                            bleService.detectedDevices[index].imageAsset),
                      ),
                      title: Text(
                        bleService.detectedDevices[index].info.name,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            'ID :${bleService.detectedDevices[index].info.deviceId}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Obx(
                            () => Text(
                              ' RSSI : ${bleService.detectedDevices[index].info.rssi}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      trailing:
                          _handleButton(bleService.detectedDevices[index]),
                    );
                  },
                );
              }
            }
            return SizedBox(
                height: Get.height / 2, width: Get.width, child: _noDevice());
          },
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
