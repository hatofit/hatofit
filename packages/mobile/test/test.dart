import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/models/session_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

/// Example app
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const deviceId = 'C16E3B2F';

  final polar = Polar();
  final logs = ['Service started'];
  var sessionModel =
      SessionModel('exerciseId', DateTime.now(), DateTime.now(), [], []);
  List<DataModel> dataModel = [];
  List<DeviceModel> deviceModelList = [];
  PolarExerciseEntry? exerciseEntry;

  @override
  void initState() {
    super.initState();

    // polar
    //     .searchForDevice()
    //     .listen((e) => log('Found device in scan: ${e.deviceId}'));
    polar.batteryLevel.listen((e) => log('Battery: ${e.level}'));
    polar.deviceConnecting.listen((_) => log('Device connecting'));
    polar.deviceConnected.listen((_) => log('Device connected'));
    polar.deviceDisconnected.listen((_) => log('Device disconnected'));
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stress Test'),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => RecordingAction.values
                  .map((e) => PopupMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onSelected: handleRecordingAction,
              child: const IconButton(
                icon: Icon(Icons.fiber_manual_record),
                disabledColor: Colors.white,
                onPressed: null,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.stop),
              onPressed: () {
                log('Disconnecting from device: $deviceId');
                polar.disconnectFromDevice(deviceId);
              },
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                log('Connecting to device: $deviceId');
                polar.connectToDevice(deviceId);
                streamWhenReady();
              },
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          children: logs.reversed.map(Text.new).toList(),
        ),
      ),
    );
  }

  void streamWhenReady() async {
    final startStream = DateTime.now();
    var counter = 0;
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availabletypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);

    debugPrint('available types: $availabletypes');

    if (availabletypes.contains(PolarDataType.hr)) {
      polar.startHrStreaming(deviceId).listen((hrData) =>
          deviceModelList.add(DeviceModel('PolarDataType.hr', deviceId, [
            {
              'hr': hrData.samples.first.hr,
              'rrsMs': hrData.samples.first.rrsMs,
            }
          ])));
    }
    if (availabletypes.contains(PolarDataType.ecg)) {
      polar.startEcgStreaming(deviceId).listen((e) => log('ECG data received'));
    }
    if (availabletypes.contains(PolarDataType.acc)) {
      polar.startAccStreaming(deviceId).listen((e) => log('ACC data received'));
    }
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print('Date Time: ${DateTime.now()}');
      dataModel.add(DataModel(0, DateTime.now(), deviceModelList));
      sessionModel = SessionModel(
          'exerciseId', DateTime.now(), DateTime.now(), [], dataModel);
      if (counter == 60) {
        saveToJSON(deviceId, startStream);
        timer.cancel();
      }
      counter++;
    });
  }

  saveToJSON(String deviceId, DateTime startStream) async {
    var json = sessionModel.toJson();
    JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    var stringJson = prettyPrint.convert(json);
    debugPrint(stringJson);

    String jsonString = jsonEncode(sessionModel);

    // save to file to local storage
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      String path = '${directory.path}/log-$deviceId-$startStream.json';
      await File(path).writeAsString(jsonString);
    }
  }

  void log(String log) {
    // ignore: avoid_print
    print(log);
    setState(() {
      logs.add(log);
    });
  }

  Future<void> handleRecordingAction(RecordingAction action) async {
    switch (action) {
      case RecordingAction.start:
        log('Starting recording');
        await polar.startRecording(
          deviceId,
          exerciseId: const Uuid().v4(),
          interval: RecordingInterval.interval_1s,
          sampleType: SampleType.rr,
        );
        log('Started recording');
        break;
      case RecordingAction.stop:
        log('Stopping recording');
        await polar.stopRecording(deviceId);
        log('Stopped recording');
        break;
      case RecordingAction.status:
        log('Getting recording status');
        final status = await polar.requestRecordingStatus(deviceId);
        log('Recording status: $status');
        break;
      case RecordingAction.list:
        log('Listing recordings');
        final entries = await polar.listExercises(deviceId);
        log('Recordings: $entries');
        // H10 can only store one recording at a time
        exerciseEntry = entries.first;
        break;
      case RecordingAction.fetch:
        log('Fetching recording');
        if (exerciseEntry == null) {
          log('Exercises not yet listed');
          await handleRecordingAction(RecordingAction.list);
        }
        final entry = await polar.fetchExercise(deviceId, exerciseEntry!);
        log('Fetched recording: $entry');
        break;
      case RecordingAction.remove:
        log('Removing recording');
        if (exerciseEntry == null) {
          log('No exercise to remove. Try calling list first.');
          return;
        }
        await polar.removeExercise(deviceId, exerciseEntry!);
        log('Removed recording');
        break;
    }
  }
}

enum RecordingAction {
  start,
  stop,
  status,
  list,
  fetch,
  remove,
}
