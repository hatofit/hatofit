import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/controller/dashboard_controller.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class DetectedDevicesModal {
  var controller = Get.find<DashboardController>();
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
              width: controller.screenWidth / 3,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(124)),
            ),
            GetBuilder<DashboardController>(
              builder: (controller) => SizedBox(
                height: controller.screenHeight / 5,
                width: controller.screenWidth,
                child: ListView.builder(
                  itemCount: controller.detectedDevices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: controller.imageDictList[index],
                        height: 50,
                        width: 50,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: CustomText(
                        text: controller.deviceNameList[index],
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: Row(
                        children: [
                          CustomText(
                            text:
                                'ID :${controller.detectedDevices[index].deviceId}',
                            fontSize: 12,
                          ),
                          CustomText(
                            text:
                                '\tDistance : ± ${controller.distanceList[index]} m',
                            fontSize: 12,
                          ),
                        ],
                      ),
                      trailing: controller.storage
                                  .read('lastConnectedDeviceID') ==
                              controller.detectedDevices[index].deviceId
                          ? TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.redAccent),
                              ),
                              onPressed: () => controller.disconnectDevice(
                                  controller.detectedDevices[index].deviceId),
                              child: const Text('Disconnect'))
                          : TextButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blueAccent),
                              ),
                              onPressed: () =>
                                  controller.connectToDevice(index),
                              child: const Text('Connect'),
                            ),
                      // trailing: controller.isConnectedDevice.value
                      //     ? TextButton(
                      //         style: ButtonStyle(
                      //             backgroundColor:
                      //                 MaterialStateProperty.all<Color>(
                      //                     Colors.blue)),
                      //         child: const Text('Connect'),
                      //         onPressed: () {
                      //           controller.connectToDevice(index);
                      //         },
                      //       )
                      //     : Text(
                      //         'Connected\n ID: ${}}'),
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
}
