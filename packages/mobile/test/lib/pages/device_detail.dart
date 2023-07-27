import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/constants/style.dart';
import 'package:hatofit/controller/polar_controller.dart';
import 'package:hatofit/models/streaming_model.dart';
import 'package:intl/intl.dart';
import 'package:polar/polar.dart';

class DeviceDetail extends GetView<PolarController> {
  final int index = 0;

  const DeviceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => saveDialog(context),
          backgroundColor: Colors.blue,
          child: const Icon(Icons.download)),
      appBar: AppBar(
        title: const Text('Streaming Data'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: controller.getPolarType(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (controller.hrStream.value == true) {
                controller.startHrStream();
              }
              if (controller.accStream.value == true) {
                controller.startAccStream();
              }
              if (controller.ppgStream.value == true) {
                controller.startPpgStream();
              }
              if (controller.ppiStream.value == true) {
                controller.startPpiStream();
              }
              if (controller.gyroStream.value == true) {
                controller.startGyroStream();
              }
              if (controller.magnStream.value == true) {
                controller.startMagnStream();
              }
              if (controller.ecgStream.value == true) {
                controller.startEcgStream();
              }

              return Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildPhoneInfo(),
                          _buildDeviceInfo(),
                          if (controller.hrStream.value == true &&
                              snapshot.data!.contains(PolarDataType.hr))
                            _buildHrInfo(),
                          if (controller.accStream.value == true &&
                              snapshot.data!.contains(PolarDataType.acc))
                            _buildAccInfo(),
                          if (controller.ppgStream.value == true &&
                              snapshot.data!.contains(PolarDataType.ppg))
                            _buildPpgInfo(),
                          if (controller.ppiStream.value == true &&
                              snapshot.data!.contains(PolarDataType.ppi))
                            _buildPpiInfo(),
                          if (controller.gyroStream.value == true &&
                              snapshot.data!.contains(PolarDataType.gyro))
                            _buildGyroInfo(),
                          if (controller.magnStream.value == true &&
                              snapshot.data!
                                  .contains(PolarDataType.magnetometer))
                            _buildMagnInfo(),
                          if (controller.ecgStream.value == true &&
                              snapshot.data!.contains(PolarDataType.ecg))
                            _buildEcgInfo(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Container(
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            // datetime just hh:mm:ss:ms:
                            DateTime.now().toString().substring(11, 23),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: defaultMargin / 2),
                    Text('Discovering available services...'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void saveDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter File Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: controller.textEditingController.text);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    ).then((result) {
      if (result != null) {
        controller.calcCon
            .saveData(controller.streamingModel[index], result, index);
      }
    });
  }

  // Future _buildExpanded() {
  //   return Get.bottomSheet(
  //     Container(
  //       height: Get.height * 0.75,
  //       padding: const EdgeInsets.all(defaultPadding),
  //       decoration: BoxDecoration(
  //         color: Colors.grey[800],
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Obx(
  //         () => Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Text(
  //                   'Available Data Type',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 IconButton(
  //                   onPressed: () {
  //                     Get.back();
  //                   },
  //                   icon: const Icon(Icons.close),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: defaultMargin / 2),
  //             Expanded(
  //               child: SingleChildScrollView(
  //                 physics: const BouncingScrollPhysics(),
  //                 child: Column(
  //                   children: [
  //                     _buildAvailableType(controller.availableTypes),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Icon(Icons.favorite),
  //                       'Heart Rate',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.hrStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.hrStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startHrStream();
  //                             } else {
  //                               await controller.hrStrmCon.close();
  //                               await controller.hrSubscription!.cancel();
  //                             }
  //                             controller.hrStream.value = value;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/acc.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'Accelerometer',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.accStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.accStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startAccStream();
  //                             } else {
  //                               await controller.accStrmCon.close();
  //                               await controller.accSubscription!.cancel();
  //                             }
  //                             controller.accStream.value = value;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/ppg.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'PPG',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.ppgStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.ppgStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startPpgStream();
  //                             } else {
  //                               await controller.ppgStrmCon.close();
  //                               await controller.ppgSubscription!.cancel();
  //                             }
  //                             controller.ppgStream.value = value;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/ppi.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'PPI',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.ppiStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.ppiStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startPpiStream();
  //                             } else {
  //                               await controller.ppiStrmCon.close();
  //                               await controller.ppiSubscription!.cancel();
  //                             }
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/gyro.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'Gyroscope',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.gyroStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.gyroStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startGyroStream();
  //                             } else {
  //                               await controller.gyroStrmCon.close();
  //                               await controller.gyroSubscription!.cancel();
  //                             }
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/magn.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'Magnetometer',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.magnStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.magnStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startMagnStream();
  //                             } else {
  //                               await controller.magnStrmCon.close();
  //                               await controller.magnSubscription!.cancel();
  //                             }
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                     _buildHeader(
  //                       Image.asset(
  //                         'assets/images/ecg.png',
  //                         width: 24,
  //                         height: 24,
  //                       ),
  //                       'ECG',
  //                       suffix: Transform.scale(
  //                         scale: 0.75,
  //                         child: CupertinoSwitch(
  //                           value: controller.ecgStream.value,
  //                           onChanged: (value) async {
  //                             if (controller.ecgStream.stream.isBroadcast ==
  //                                 false) {
  //                               controller.startEcgStream();
  //                             } else {
  //                               await controller.ecgStrmCon.close();
  //                               await controller.ecgSubscription!.cancel();
  //                             }
  //                             controller.ecgStream.value = value;
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(height: defaultMargin / 2),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //   );
  // }

  Widget _buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.all(defaultMargin),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _buildHeader(Widget prefix, String label,
      {Widget? suffix, Widget? child}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                prefix,
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            suffix ?? const SizedBox(),
          ],
        ),
        const SizedBox(height: defaultMargin / 2),
        child ?? const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildStatInfo(String label, String value) {
    return Container(
      width: 75,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label),
          const SizedBox(height: defaultMargin / 2),
          Divider(height: 0, thickness: 1, color: Colors.grey[700]),
          const SizedBox(height: defaultMargin / 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
        const SizedBox(height: defaultMargin / 2),
      ],
    );
  }

  Widget _buildPhoneInfo() {
    return _buildContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.phone_android),
              SizedBox(width: 10),
              Text(
                'Phone Info',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultMargin / 2),
          _buildInfoRow('Operating System:',
              Platform.operatingSystem.capitalize.toString()),
          _buildInfoRow('Manufacturer:', controller.phoneInfo['manufacturer']!),
          _buildInfoRow('Type:', controller.phoneInfo['model']!),
          _buildInfoRow('Device ID:', controller.phoneInfo['name']!),
          _buildInfoRow('Total Core:', Platform.numberOfProcessors.toString()),
        ],
      ),
    );
  }

  Widget _buildAvailableType(Set<PolarDataType> dataType) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: dataType
            .map((e) => Container(
                  padding: const EdgeInsets.all(defaultPadding / 3),
                  decoration: BoxDecoration(
                    color: _getRandomCupertinoColor().withOpacity(0.75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(e.toString().substring(14).capitalize.toString()),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildDeviceInfo() {
    return _buildContainer(
      Column(
        children: [
          Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.watch),
                  SizedBox(width: 10),
                  Text(
                    'Device Info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultMargin / 2),
              _buildInfoRow('Name:', controller.connectedDevice!.name),
              _buildInfoRow('Device ID:', controller.connectedDevice!.deviceId),
              _buildInfoRow('Address:', controller.connectedDevice!.address),
              StreamBuilder<Object>(
                stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                      future: controller.getRssi(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return _buildInfoRow(
                              'RSSI:', '${snapshot.data.toString()} dBm');
                        } else {
                          return _buildInfoRow('RSSI:',
                              '${controller.connectedDevice!.rssi.toString()} dBm');
                        }
                      },
                    );
                  } else {
                    return _buildInfoRow('RSSI:',
                        '${controller.connectedDevice!.rssi.toString()} dBm');
                  }
                },
              ),
              StreamBuilder<PolarDisInformationEvent>(
                stream:
                    controller.getDisInfo(controller.connectedDevice!.deviceId),
                builder: (context, snapshot) {
                  return _buildInfoRow(
                    'Firmware Version:',
                    snapshot.hasData ? snapshot.data!.info.toString() : '',
                  );
                },
              ),
              StreamBuilder<PolarBatteryLevelEvent>(
                stream: controller
                    .getBatteryLevel(controller.connectedDevice!.deviceId),
                builder: (context, snapshot) {
                  return _buildInfoRow(
                    'Battery Level:',
                    snapshot.hasData ? '${snapshot.data!.level}%' : '',
                  );
                },
              ),
            ],
          ),
          const Text(
            'Available Data Type:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: defaultMargin / 2),
          _buildAvailableType(controller.availableTypes),
        ],
      ),
    );
  }

  Widget _buildHrInfo() {
    return _buildContainer(
      StreamBuilder(
        stream: controller.hrStrmCon.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.addHrData(
                HrData(
                  timestamp: DateTime.now().microsecondsSinceEpoch,
                  hr: snapshot.data!.samples.last.hr,
                  rrsMs: snapshot.data!.samples.last.rrsMs,
                ),
                index);
            controller.calcCon.calcHr(controller.streamingModel[index], index);
            return FutureBuilder(
                future: Future.microtask(() =>
                    controller.streamingModel[index].hrData.length > 4
                        ? true
                        : false),
                builder: (context, ftr) {
                  if (ftr.data == true) {
                    return _buildHeader(
                        const Icon(Icons.favorite), 'Heart Rate',
                        child: Column(
                          children: [
                            const SizedBox(height: defaultMargin / 2),
                            _buildInfoRow(
                              'First Data Time :',
                              DateTime.fromMicrosecondsSinceEpoch(
                                controller.streamingModel[index].hrData.first
                                    .timestamp,
                              ).toString().substring(11, 23),
                            ),
                            _buildInfoRow(
                              'Last Data Time :',
                              DateTime.fromMicrosecondsSinceEpoch(
                                controller.streamingModel[index].hrData.last
                                    .timestamp,
                              ).toString().substring(11, 23),
                            ),
                            FutureBuilder(
                                future: controller.elapsedTime(
                                    controller.streamingModel[index].hrData
                                        .first.timestamp,
                                    controller.streamingModel[index].hrData.last
                                        .timestamp),
                                builder: (context, snapshot) {
                                  return _buildInfoRow(
                                    'Elapsed Time :',
                                    snapshot.hasData
                                        ? snapshot.data!
                                            .toString()
                                            .split(
                                              '.',
                                            )[0]
                                            .padLeft(8, '0')
                                        : '',
                                  );
                                }),
                            _buildInfoRow('Packet :',
                                snapshot.data!.samples.length.toString()),
                            _buildInfoRow(
                                'Total packet :',
                                controller.streamingModel[index].hrData.length
                                    .toString()),
                            const SizedBox(height: defaultMargin),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller.calcCon.hrStats[index].latestHr
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.hrStats[index].minHr
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.hrStats[index].maxHr
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.hrStats[index].avgHr
                                        .toStringAsFixed(0)),
                              ],
                            ),
                            const SizedBox(height: defaultMargin),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: defaultMargin, bottom: defaultMargin),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AspectRatio(
                                aspectRatio: 2,
                                child: LineChart(
                                  LineChartData(
                                    lineTouchData: LineTouchData(
                                      handleBuiltInTouches: true,
                                      touchTooltipData: LineTouchTooltipData(
                                        tooltipBgColor:
                                            Colors.blueGrey.withOpacity(0.5),
                                      ),
                                    ),
                                    borderData: FlBorderData(
                                      show: true,
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.white),
                                        left: BorderSide(color: Colors.white),
                                        right: BorderSide(
                                            color: Colors.transparent),
                                        top: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    titlesData: FlTitlesData(
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (value, meta) {
                                            String time = DateFormat('mm:ss')
                                                .format(DateTime
                                                    .fromMicrosecondsSinceEpoch(
                                                        value.toInt()));
                                            return bottomTitleWidgets(
                                                time, meta);
                                          },
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                    ),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: controller
                                            .calcCon.hrStats[index].hrSpots,
                                        isCurved: false,
                                        belowBarData:
                                            BarAreaData(applyCutOffY: true),
                                        isStrokeCapRound: false,
                                        isStrokeJoinRound: false,
                                        barWidth: 3,
                                        color: Colors.red,
                                        dotData: const FlDotData(show: false),
                                      ),
                                    ],
                                    minY: 0,
                                    maxY: 200,
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              ),
                            ),
                          ],
                        ));
                  } else {
                    return _buildHeader(
                      const Icon(Icons.favorite),
                      'Heart Rate',
                    );
                  }
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildAccInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.accStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.addAccData(
              AccData(
                timestamp: DateTime.now().microsecondsSinceEpoch,
                x: snapshot.data!.samples.last.x,
                y: snapshot.data!.samples.last.y,
                z: snapshot.data!.samples.last.z,
              ),
              index);
          controller.calcCon.calcAcc(controller.streamingModel[index], index);
          return FutureBuilder(
            future: Future.microtask(() =>
                controller.streamingModel[index].accData.length > 4
                    ? true
                    : false),
            builder: (context, ftr) {
              if (ftr.data == true) {
                return _buildHeader(
                  Image.asset(
                    'assets/images/acc.png',
                    width: 24,
                    height: 24,
                  ),
                  'Accelerometer',
                  child: Column(
                    children: [
                      const SizedBox(height: defaultMargin / 2),
                      _buildInfoRow(
                        'First Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller
                              .streamingModel[index].accData.first.timestamp,
                        ).toString().substring(11, 23),
                      ),
                      _buildInfoRow(
                        'Last Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller
                              .streamingModel[index].accData.last.timestamp,
                        ).toString().substring(11, 23),
                      ),
                      FutureBuilder(
                          future: controller.elapsedTime(
                              controller.streamingModel[index].accData.first
                                  .timestamp,
                              controller.streamingModel[index].accData.last
                                  .timestamp),
                          builder: (context, snapshot) {
                            return _buildInfoRow(
                              'Elapsed Time :',
                              snapshot.hasData
                                  ? snapshot.data!
                                      .toString()
                                      .split(
                                        '.',
                                      )[0]
                                      .padLeft(8, '0')
                                  : '',
                            );
                          }),
                      _buildInfoRow(
                          'Packet :', snapshot.data!.samples.length.toString()),
                      _buildInfoRow(
                          'Total packet :',
                          controller.streamingModel[index].accData.length
                              .toString()),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.accStats[index].latestAcc[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.accStats[index].minAcc[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.accStats[index].maxAcc[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.accStats[index].avgAcc[0]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[1].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'y',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.accStats[index].latestAcc[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.accStats[index].minAcc[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.accStats[index].maxAcc[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.accStats[index].avgAcc[1]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[2].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'z',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.accStats[index].latestAcc[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.accStats[index].minAcc[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.accStats[index].maxAcc[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.accStats[index].avgAcc[2]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.only(
                            top: defaultMargin, bottom: defaultMargin),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor:
                                      Colors.blueGrey.withOpacity(0.5),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      String time = DateFormat('mm:ss').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              value.toInt()));
                                      return bottomTitleWidgets(time, meta);
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.accStats[index].accSpots[0],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[0],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.accStats[index].accSpots[1],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[1],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.accStats[index].accSpots[2],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[2],
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildHeader(
                  Image.asset(
                    'assets/images/acc.png',
                    width: 24,
                    height: 24,
                  ),
                  'Accelerometer',
                );
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildPpgInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.ppgStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.addPpgData(
              PpgData(
                  tS: DateTime.now().microsecondsSinceEpoch,
                  cS: snapshot.data!.samples.last.channelSamples),
              index);
          controller.calcCon.calcPpg(controller.streamingModel[index], index);
          return FutureBuilder(
              future: Future.microtask(() =>
                  controller.streamingModel[index].ppgData.length > 4
                      ? true
                      : false),
              builder: (context, ftr) {
                if (ftr.data == true) {
                  return _buildHeader(
                    Image.asset(
                      'assets/images/ppg.png',
                      width: 24,
                      height: 24,
                    ),
                    'Photoplethysmography',
                    child: Column(
                      children: [
                        const SizedBox(height: defaultMargin / 2),
                        _buildInfoRow(
                          'First Data Time :',
                          DateTime.fromMicrosecondsSinceEpoch(controller
                                  .streamingModel[index].ppgData.first.tS)
                              .toString()
                              .substring(11, 23),
                        ),
                        _buildInfoRow(
                          'Last Data Time :',
                          DateTime.fromMicrosecondsSinceEpoch(controller
                                  .streamingModel[index].ppgData.last.tS)
                              .toString()
                              .substring(11, 23),
                        ),
                        FutureBuilder(
                            future: controller.elapsedTime(
                                controller
                                    .streamingModel[index].ppgData.first.tS,
                                controller
                                    .streamingModel[index].ppgData.last.tS),
                            builder: (context, snapshot) {
                              return _buildInfoRow(
                                'Elapsed Time :',
                                snapshot.hasData
                                    ? snapshot.data!
                                        .toString()
                                        .split(
                                          '.',
                                        )[0]
                                        .padLeft(8, '0')
                                    : '',
                              );
                            }),
                        _buildInfoRow('Packet :',
                            snapshot.data!.samples.length.toString()),
                        _buildInfoRow(
                            'Total packet :',
                            controller.streamingModel[index].ppgData.length
                                .toString()),
                        Container(
                          padding: const EdgeInsets.all(defaultMargin / 4),
                          decoration: BoxDecoration(
                            color: cupertinoColors[0].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Index 0',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: defaultMargin / 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStatInfo(
                                      'Last',
                                      controller
                                          .calcCon.ppgStats[index].latestPpg[0]
                                          .toString()),
                                  _buildStatInfo(
                                      'Min',
                                      controller
                                          .calcCon.ppgStats[index].minPpg[0]
                                          .toString()),
                                  _buildStatInfo(
                                      'Max',
                                      controller
                                          .calcCon.ppgStats[index].maxPpg[0]
                                          .toString()),
                                  _buildStatInfo(
                                      'Avg',
                                      controller
                                          .calcCon.ppgStats[index].avgPpg[0]
                                          .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: defaultMargin),
                        Container(
                          padding: const EdgeInsets.all(defaultMargin / 4),
                          decoration: BoxDecoration(
                            color: cupertinoColors[1].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Index 1',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: defaultMargin / 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStatInfo(
                                      'Last',
                                      controller
                                          .calcCon.ppgStats[index].latestPpg[1]
                                          .toString()),
                                  _buildStatInfo(
                                      'Min',
                                      controller
                                          .calcCon.ppgStats[index].minPpg[1]
                                          .toString()),
                                  _buildStatInfo(
                                      'Max',
                                      controller
                                          .calcCon.ppgStats[index].maxPpg[1]
                                          .toString()),
                                  _buildStatInfo(
                                      'Avg',
                                      controller
                                          .calcCon.ppgStats[index].avgPpg[1]
                                          .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: defaultMargin),
                        Container(
                          padding: const EdgeInsets.all(defaultMargin / 4),
                          decoration: BoxDecoration(
                            color: cupertinoColors[2].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Index 2',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: defaultMargin / 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStatInfo(
                                      'Last',
                                      controller
                                          .calcCon.ppgStats[index].latestPpg[2]
                                          .toString()),
                                  _buildStatInfo(
                                      'Min',
                                      controller
                                          .calcCon.ppgStats[index].minPpg[2]
                                          .toString()),
                                  _buildStatInfo(
                                      'Max',
                                      controller
                                          .calcCon.ppgStats[index].maxPpg[2]
                                          .toString()),
                                  _buildStatInfo(
                                      'Avg',
                                      controller
                                          .calcCon.ppgStats[index].avgPpg[2]
                                          .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: defaultMargin),
                        Container(
                          padding: const EdgeInsets.all(defaultMargin / 4),
                          decoration: BoxDecoration(
                            color: cupertinoColors[3].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Index 3',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: defaultMargin / 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStatInfo(
                                      'Last',
                                      controller
                                          .calcCon.ppgStats[index].latestPpg[3]
                                          .toString()),
                                  _buildStatInfo(
                                      'Min',
                                      controller
                                          .calcCon.ppgStats[index].minPpg[3]
                                          .toString()),
                                  _buildStatInfo(
                                      'Max',
                                      controller
                                          .calcCon.ppgStats[index].maxPpg[3]
                                          .toString()),
                                  _buildStatInfo(
                                      'Avg',
                                      controller
                                          .calcCon.ppgStats[index].avgPpg[3]
                                          .toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: defaultMargin),
                        Container(
                          padding: const EdgeInsets.only(
                              top: defaultMargin, bottom: defaultMargin),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AspectRatio(
                            aspectRatio: 2,
                            child: LineChart(
                              LineChartData(
                                lineTouchData: LineTouchData(
                                  handleBuiltInTouches: true,
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipBgColor:
                                        Colors.blueGrey.withOpacity(0.5),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: const Border(
                                    bottom: BorderSide(color: Colors.white),
                                    left: BorderSide(color: Colors.white),
                                    right:
                                        BorderSide(color: Colors.transparent),
                                    top: BorderSide(color: Colors.transparent),
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        String time = DateFormat('mm:ss')
                                            .format(DateTime
                                                .fromMicrosecondsSinceEpoch(
                                                    value.toInt()));
                                        return bottomTitleWidgets(time, meta);
                                      },
                                    ),
                                  ),
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: controller
                                        .calcCon.ppgStats[index].ppgSpots[0],
                                    isCurved: false,
                                    belowBarData:
                                        BarAreaData(applyCutOffY: true),
                                    isStrokeCapRound: false,
                                    isStrokeJoinRound: false,
                                    barWidth: 3,
                                    color: cupertinoColors[0],
                                    dotData: const FlDotData(show: false),
                                  ),
                                  LineChartBarData(
                                    spots: controller
                                        .calcCon.ppgStats[index].ppgSpots[1],
                                    isCurved: false,
                                    belowBarData:
                                        BarAreaData(applyCutOffY: true),
                                    isStrokeCapRound: false,
                                    isStrokeJoinRound: false,
                                    barWidth: 3,
                                    color: cupertinoColors[1],
                                    dotData: const FlDotData(show: false),
                                  ),
                                  LineChartBarData(
                                    spots: controller
                                        .calcCon.ppgStats[index].ppgSpots[2],
                                    isCurved: false,
                                    belowBarData:
                                        BarAreaData(applyCutOffY: true),
                                    isStrokeCapRound: false,
                                    isStrokeJoinRound: false,
                                    barWidth: 3,
                                    color: cupertinoColors[2],
                                    dotData: const FlDotData(show: false),
                                  ),
                                  LineChartBarData(
                                    spots: controller
                                        .calcCon.ppgStats[index].ppgSpots[3],
                                    isCurved: false,
                                    belowBarData:
                                        BarAreaData(applyCutOffY: true),
                                    isStrokeCapRound: false,
                                    isStrokeJoinRound: false,
                                    barWidth: 3,
                                    color: cupertinoColors[3],
                                    dotData: const FlDotData(show: false),
                                  ),
                                ],
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return _buildHeader(
                    Image.asset(
                      'assets/images/ppg.png',
                      width: 24,
                      height: 24,
                    ),
                    'Photoplethysmography',
                  );
                }
              });
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildPpiInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.ppiStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final PolarPpiSample sample = snapshot.data!.samples.last;
          controller.addPpiData(
              PpiData(
                  tS: DateTime.now().microsecondsSinceEpoch,
                  ppi: sample.ppi,
                  errorEstimate: sample.errorEstimate,
                  hr: sample.hr,
                  blockerBit: sample.blockerBit,
                  skinContactStatus: sample.skinContactStatus,
                  skinContactSupported: sample.skinContactSupported),
              index);
          controller.calcCon.calcPpi(controller.streamingModel[index], index);
          return FutureBuilder(
            future: Future.microtask(() =>
                controller.streamingModel[index].ppiData.length > 4
                    ? true
                    : false),
            builder: (context, ftr) {
              if (ftr.data == true) {
                return _buildHeader(
                  Image.asset(
                    'assets/images/ppi.png',
                    width: 24,
                    height: 24,
                  ),
                  'Pulse-to-Pulse Interval',
                  child: Column(
                    children: [
                      const SizedBox(height: defaultMargin / 2),
                      _buildInfoRow(
                        'First Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].ppiData.first.tS,
                        ).toString().substring(11, 23),
                      ),
                      _buildInfoRow(
                        'Last Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].ppiData.last.tS,
                        ).toString().substring(11, 23),
                      ),
                      FutureBuilder(
                          future: controller.elapsedTime(
                              controller.streamingModel[index].ppiData.first.tS,
                              controller.streamingModel[index].ppiData.last.tS),
                          builder: (context, snapshot) {
                            return _buildInfoRow(
                              'Elapsed Time :',
                              snapshot.hasData
                                  ? snapshot.data!
                                      .toString()
                                      .split(
                                        '.',
                                      )[0]
                                      .padLeft(8, '0')
                                  : '',
                            );
                          }),
                      _buildInfoRow(
                          'Packet :', snapshot.data!.samples.length.toString()),
                      _buildInfoRow(
                          'Total packet :',
                          controller.streamingModel[index].ppiData.length
                              .toString()),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'PPI',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.ppiStats[index].latestPpi[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.ppiStats[index].minPpi[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.ppiStats[index].maxPpi[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.ppiStats[index].avgPpi[0]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[1].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Error Estimate',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.ppiStats[index].latestPpi[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.ppiStats[index].minPpi[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.ppiStats[index].maxPpi[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.ppiStats[index].avgPpi[1]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[2].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'z',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.ppiStats[index].latestPpi[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.ppiStats[index].minPpi[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.ppiStats[index].maxPpi[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.ppiStats[index].avgPpi[2]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.only(
                            top: defaultMargin, bottom: defaultMargin),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor:
                                      Colors.blueGrey.withOpacity(0.5),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      String time = DateFormat('mm:ss').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              value.toInt()));
                                      return bottomTitleWidgets(time, meta);
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.ppiStats[index].ppiSpots[0],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[0],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.ppiStats[index].ppiSpots[1],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[1],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.ppiStats[index].ppiSpots[2],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[2],
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildHeader(
                  Image.asset(
                    'assets/images/acc.png',
                    width: 24,
                    height: 24,
                  ),
                  'Accelerometer',
                );
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildGyroInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.gyroStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.addGyroData(
              GyroData(
                tS: DateTime.now().microsecondsSinceEpoch,
                x: snapshot.data!.samples.last.x,
                y: snapshot.data!.samples.last.y,
                z: snapshot.data!.samples.last.z,
              ),
              index);
          controller.calcCon.calcGyro(controller.streamingModel[index], index);
          return FutureBuilder(
            future: Future.microtask(() =>
                controller.streamingModel[index].gyroData.length > 4
                    ? true
                    : false),
            builder: (context, ftr) {
              if (ftr.data == true) {
                return _buildHeader(
                  Image.asset(
                    'assets/images/gyro.png',
                    width: 24,
                    height: 24,
                  ),
                  'Gyroscope',
                  child: Column(
                    children: [
                      const SizedBox(height: defaultMargin / 2),
                      _buildInfoRow(
                        'First Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].gyroData.first.tS,
                        ).toString().substring(11, 23),
                      ),
                      _buildInfoRow(
                        'Last Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].gyroData.last.tS,
                        ).toString().substring(11, 23),
                      ),
                      FutureBuilder(
                          future: controller.elapsedTime(
                              controller
                                  .streamingModel[index].gyroData.first.tS,
                              controller
                                  .streamingModel[index].gyroData.last.tS),
                          builder: (context, snapshot) {
                            return _buildInfoRow(
                              'Elapsed Time :',
                              snapshot.hasData
                                  ? snapshot.data!
                                      .toString()
                                      .split(
                                        '.',
                                      )[0]
                                      .padLeft(8, '0')
                                  : '',
                            );
                          }),
                      _buildInfoRow(
                          'Packet :', snapshot.data!.samples.length.toString()),
                      _buildInfoRow(
                          'Total packet :',
                          controller.streamingModel[index].gyroData.length
                              .toString()),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.gyroStats[index].latestGyro[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.gyroStats[index].minGyro[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.gyroStats[index].maxGyro[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.gyroStats[index].avgGyro[0]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[1].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'y',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.gyroStats[index].latestGyro[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.gyroStats[index].minGyro[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.gyroStats[index].maxGyro[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.gyroStats[index].avgGyro[1]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[2].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'z',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.gyroStats[index].latestGyro[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.gyroStats[index].minGyro[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.gyroStats[index].maxGyro[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.gyroStats[index].avgGyro[2]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.only(
                            top: defaultMargin, bottom: defaultMargin),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor:
                                      Colors.blueGrey.withOpacity(0.5),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      String time = DateFormat('mm:ss').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              value.toInt()));
                                      return bottomTitleWidgets(time, meta);
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.gyroStats[index].gyroSpots[0],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[0],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.gyroStats[index].gyroSpots[1],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[1],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.gyroStats[index].gyroSpots[2],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[2],
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildHeader(
                  Image.asset(
                    'assets/images/gyro.png',
                    width: 24,
                    height: 24,
                  ),
                  'Gyroscope',
                );
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildMagnInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.magnStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.addMagnData(
              GyroData(
                tS: DateTime.now().microsecondsSinceEpoch,
                x: snapshot.data!.samples.last.x,
                y: snapshot.data!.samples.last.y,
                z: snapshot.data!.samples.last.z,
              ),
              index);
          controller.calcCon.calcMagn(controller.streamingModel[index], index);
          return FutureBuilder(
            future: Future.microtask(
              () => controller.streamingModel[index].magnData.length > 4
                  ? true
                  : false,
            ),
            builder: (context, ftr) {
              if (ftr.data == true) {
                return _buildHeader(
                  Image.asset(
                    'assets/images/magn.png',
                    width: 24,
                    height: 24,
                  ),
                  'Magnetometer',
                  child: Column(
                    children: [
                      const SizedBox(height: defaultMargin / 2),
                      _buildInfoRow(
                        'First Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].magnData.first.tS,
                        ).toString().substring(11, 23),
                      ),
                      _buildInfoRow(
                        'Last Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].magnData.last.tS,
                        ).toString().substring(11, 23),
                      ),
                      FutureBuilder(
                          future: controller.elapsedTime(
                              controller
                                  .streamingModel[index].magnData.first.tS,
                              controller
                                  .streamingModel[index].magnData.last.tS),
                          builder: (context, snapshot) {
                            return _buildInfoRow(
                              'Elapsed Time :',
                              snapshot.hasData
                                  ? snapshot.data!
                                      .toString()
                                      .split(
                                        '.',
                                      )[0]
                                      .padLeft(8, '0')
                                  : '',
                            );
                          }),
                      _buildInfoRow(
                          'Packet :', snapshot.data!.samples.length.toString()),
                      _buildInfoRow(
                          'Total packet :',
                          controller.streamingModel[index].magnData.length
                              .toString()),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.magnStats[index].latestMagn[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.magnStats[index].minMagn[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.magnStats[index].maxMagn[0]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.magnStats[index].avgMagn[0]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[1].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'y',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.magnStats[index].latestMagn[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.magnStats[index].minMagn[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.magnStats[index].maxMagn[1]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.magnStats[index].avgMagn[1]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[2].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'z',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller
                                        .calcCon.magnStats[index].latestMagn[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller
                                        .calcCon.magnStats[index].minMagn[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller
                                        .calcCon.magnStats[index].maxMagn[2]
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller
                                        .calcCon.magnStats[index].avgMagn[2]
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.only(
                            top: defaultMargin, bottom: defaultMargin),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor:
                                      Colors.blueGrey.withOpacity(0.5),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      String time = DateFormat('mm:ss').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              value.toInt()));
                                      return bottomTitleWidgets(time, meta);
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.magnStats[index].magnSpots[0],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[0],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.magnStats[index].magnSpots[1],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[1],
                                  dotData: const FlDotData(show: false),
                                ),
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.magnStats[index].magnSpots[2],
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[2],
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildHeader(
                  Image.asset(
                    'assets/images/magn.png',
                    width: 24,
                    height: 24,
                  ),
                  'Magnetometer',
                );
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildEcgInfo() {
    return _buildContainer(StreamBuilder(
      stream: controller.ecgStrmCon.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.addEcgData(
              EcgData(
                tS: DateTime.now().microsecondsSinceEpoch,
                voltage: snapshot.data!.samples.last.voltage,
              ),
              index);
          controller.calcCon.calcEcg(controller.streamingModel[index], index);
          return FutureBuilder(
            future: Future.microtask(() =>
                controller.streamingModel[index].ecgData.length > 4
                    ? true
                    : false),
            builder: (context, ftr) {
              if (ftr.data == true) {
                return _buildHeader(
                  Image.asset(
                    'assets/images/ecg.png',
                    width: 24,
                    height: 24,
                  ),
                  'Electrocardiogram',
                  child: Column(
                    children: [
                      const SizedBox(height: defaultMargin / 2),
                      _buildInfoRow(
                        'First Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].ecgData.first.tS,
                        ).toString().substring(11, 23),
                      ),
                      _buildInfoRow(
                        'Last Data Time :',
                        DateTime.fromMicrosecondsSinceEpoch(
                          controller.streamingModel[index].ecgData.last.tS,
                        ).toString().substring(11, 23),
                      ),
                      FutureBuilder(
                          future: controller.elapsedTime(
                              controller.streamingModel[index].ecgData.first.tS,
                              controller.streamingModel[index].ecgData.last.tS),
                          builder: (context, snapshot) {
                            return _buildInfoRow(
                              'Elapsed Time :',
                              snapshot.hasData
                                  ? snapshot.data!
                                      .toString()
                                      .split(
                                        '.',
                                      )[0]
                                      .padLeft(8, '0')
                                  : '',
                            );
                          }),
                      _buildInfoRow(
                          'Packet :', snapshot.data!.samples.length.toString()),
                      _buildInfoRow(
                          'Total packet :',
                          controller.streamingModel[index].ecgData.length
                              .toString()),
                      Container(
                        padding: const EdgeInsets.all(defaultMargin / 4),
                        decoration: BoxDecoration(
                          color: cupertinoColors[0].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'ECG',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: defaultMargin / 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatInfo(
                                    'Last',
                                    controller.calcCon.ecgStats[index].latestEcg
                                        .toString()),
                                _buildStatInfo(
                                    'Min',
                                    controller.calcCon.ecgStats[index].minEcg
                                        .toString()),
                                _buildStatInfo(
                                    'Max',
                                    controller.calcCon.ecgStats[index].maxEcg
                                        .toString()),
                                _buildStatInfo(
                                    'Avg',
                                    controller.calcCon.ecgStats[index].avgEcg
                                        .toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultMargin),
                      Container(
                        padding: const EdgeInsets.only(
                            top: defaultMargin, bottom: defaultMargin),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                handleBuiltInTouches: true,
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor:
                                      Colors.blueGrey.withOpacity(0.5),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  bottom: BorderSide(color: Colors.white),
                                  left: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      String time = DateFormat('mm:ss').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              value.toInt()));
                                      return bottomTitleWidgets(time, meta);
                                    },
                                  ),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: controller
                                      .calcCon.ecgStats[index].ecgSpots,
                                  isCurved: false,
                                  belowBarData: BarAreaData(applyCutOffY: true),
                                  isStrokeCapRound: false,
                                  isStrokeJoinRound: false,
                                  barWidth: 3,
                                  color: cupertinoColors[0],
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return _buildHeader(
                  Image.asset(
                    'assets/images/ecg.png',
                    width: 24,
                    height: 24,
                  ),
                  'Electrocardiogram',
                );
              }
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }

  Widget bottomTitleWidgets(String value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Transform(
        transform: Matrix4.identity()..rotateZ(45 * pi / 180),
        child: Text(
          value,
        ),
      ),
    );
  }

  Color _getRandomCupertinoColor() {
    Random random = Random();
    int randomIndex = random.nextInt(cupertinoColors.length);
    Color selectedColor = cupertinoColors[randomIndex];
    return Color.fromARGB(
      selectedColor.alpha,
      (selectedColor.red * 0.8).toInt(),
      (selectedColor.green * 0.8).toInt(),
      (selectedColor.blue * 0.8).toInt(),
    );
  }
}
