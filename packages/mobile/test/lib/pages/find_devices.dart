import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/constants/style.dart';
import 'package:polar/polar.dart';

import '../controller/polar_controller.dart';
import '../routes/routes.dart';

class FindDevicesPage extends StatefulWidget {
  const FindDevicesPage({super.key});

  @override
  State<FindDevicesPage> createState() => _FindDevicesPageState();
}

class _FindDevicesPageState extends State<FindDevicesPage> {
  final PolarController controller = Get.put(PolarController());
  @override
  void initState() {
    super.initState();
    controller.polar.deviceDisconnected.listen((event) {
      controller.isConnected.value = false;
      controller.state.value = 'Disconnected from ${event.deviceId}';
      Get.snackbar('Disconnected', controller.state.value);
    });
    controller.polar.deviceConnecting.last.then((value) {
      controller.state.value = 'Connecting to ${value.deviceId}';
      Get.snackbar('Connecting', controller.state.value);
    });
    controller.polar.deviceConnected.last.then((value) {
      controller.isConnected.value = true;
      controller.state.value = 'Connected to ${value.deviceId}';
      Get.snackbar('Connected', controller.state.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Devices'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: controller.searchForDevice(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: const EdgeInsets.all(defaultPadding / 2),
              margin: const EdgeInsets.all(defaultMargin / 2),
              height: 190,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                children: [
                  Center(
                      child: Text(snapshot.data!.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: defaultMargin),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400],
                          ),
                          child: Image(
                            image: controller.getImage(snapshot.data!.name),
                          ),
                        ),
                      ),
                      const SizedBox(width: defaultMargin),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Device ID :'),
                                  const SizedBox(width: defaultMargin / 2),
                                  Text(snapshot.data!.deviceId),
                                ]),
                            const SizedBox(height: defaultMargin / 1.9),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Address   :'),
                                  const SizedBox(width: defaultMargin / 2),
                                  Text(snapshot.data!.address),
                                ]),
                            const SizedBox(height: defaultMargin / 1.9),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('RSSI         :'),
                                  const SizedBox(width: defaultMargin / 2),
                                  Text('${snapshot.data!.rssi} dB'),
                                ]),
                            const SizedBox(height: defaultMargin / 1.9),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Connectable : '),
                                      snapshot.data!.isConnectable
                                          ? const Text('Yes',
                                              style: TextStyle(
                                                  color: Colors.green))
                                          : const Text('No',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        controller
                                            .connectToDevice(snapshot.data!);
                                        Future.delayed(
                                            const Duration(seconds: 5), () {
                                          if (controller.availableTypes
                                              .contains(PolarDataType.hr)) {
                                            Get.toNamed(AppRoutes.deviceDetail);
                                            // _toggleService();
                                          }
                                        });
                                        Get.dialog(
                                          Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              height: 150,
                                              width: 150,
                                              padding: const EdgeInsets.all(
                                                  defaultPadding),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.grey[900],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const CircularProgressIndicator(),
                                                  const SizedBox(
                                                      height: defaultMargin),
                                                  Text(
                                                      'Connecting to ${snapshot.data!.name}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Connect')),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: defaultMargin),
                  Text('Searching for devices...'),
                  SizedBox(height: defaultMargin),
                  Text(
                    'Make sure your device is turned on.',
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Future _toggleService() {
  //   return Get.bottomSheet(
  //       Container(
  //         height: Get.height * 0.8,
  //         padding: const EdgeInsets.all(defaultPadding),
  //         decoration: BoxDecoration(
  //             color: Colors.grey[800],
  //             borderRadius: const BorderRadius.only(
  //               topLeft: Radius.circular(32),
  //               topRight: Radius.circular(32),
  //             )),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     IconButton(
  //                       onPressed: () {},
  //                       icon: const Icon(
  //                         Icons.close,
  //                         color: Colors.transparent,
  //                       ),
  //                     ),
  //                     const Text('Select Initial Streaming',
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.bold,
  //                         )),
  //                     IconButton(
  //                       onPressed: () {
  //                         Get.back();
  //                       },
  //                       icon: const Icon(Icons.close),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Row(
  //                   children: [
  //                     Icon(
  //                       CupertinoIcons.heart,
  //                       color: Colors.redAccent,
  //                     ),
  //                     SizedBox(width: defaultMargin / 2),
  //                     Text('Heart Rate'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.hrStream.value,
  //                       onChanged: (value) {
  //                         controller.hrStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/acc.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Accelerometer'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.accStream.value,
  //                       onChanged: (value) {
  //                         controller.accStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/ppg.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Photoplethysmography'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.ppgStream.value,
  //                       onChanged: (value) {
  //                         controller.ppgStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/ppi.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Pulse to Pulse Interval'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.ppiStream.value,
  //                       onChanged: (value) {
  //                         controller.ppiStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/gyro.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Gyroscope'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.gyroStream.value,
  //                       onChanged: (value) {
  //                         controller.gyroStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/magn.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Magnetometer'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.magnStream.value,
  //                       onChanged: (value) {
  //                         controller.magnStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Divider(
  //               color: Colors.grey[700],
  //               thickness: 1,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       'assets/images/ecg.png',
  //                       height: 24,
  //                       width: 24,
  //                     ),
  //                     const SizedBox(width: defaultMargin / 2),
  //                     const Text('Electrocardiography'),
  //                   ],
  //                 ),
  //                 Transform.scale(
  //                   scale: 0.75,
  //                   child: Obx(
  //                     () => CupertinoSwitch(
  //                       value: controller.ecgStream.value,
  //                       onChanged: (value) {
  //                         controller.ecgStream.value = value;
  //                       },
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             SizedBox(
  //               width: double.infinity,
  //               height: 50,
  //               child: ElevatedButton(
  //                   onPressed: () {
  //                     Get.toNamed(AppRoutes.deviceDetail);
  //                   },
  //                   child: const Text(
  //                     'Start Streaming',
  //                     style:
  //                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                   )),
  //             ),
  //           ],
  //         ),
  //       ),
  //       isScrollControlled: true);
  // }
}
