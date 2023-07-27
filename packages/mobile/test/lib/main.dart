import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/constants/style.dart';
import 'package:hatofit/routes/routes.dart';
import 'package:polar/polar.dart';

import 'controller/bluetooth_controller.dart';
import 'controller/calc_con.dart';
import 'controller/polar_controller.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BluetoothController>(() => BluetoothController());
    Get.lazyPut<PolarController>(() => PolarController());
    Get.lazyPut<CalcCon>(() => CalcCon());
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'HatoFit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      getPages: AppPages.pages,
      initialBinding: Binder(),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HatoFit'),
        centerTitle: true,
      ),
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            Polar().requestPermissions();
            if (snapshot.data == BluetoothState.on) {
              return OnScreen(adapterState: snapshot.data!);
            }
            return OffScreen(adapterState: snapshot.data!);
          }),
    );
  }
}

class OnScreen extends StatelessWidget {
  final BluetoothState adapterState;
  const OnScreen({super.key, required this.adapterState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bluetooth,
            size: 200,
            color: Colors.blue,
          ),
          const SizedBox(height: defaultMargin),
          Text(
            'Bluetooth adapter is ${adapterState.toString().substring(15)}',
            style: Theme.of(context).primaryTextTheme.headlineSmall,
          ),
          const SizedBox(height: defaultMargin),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.findDevices);
            },
            child: const Text('Find Devices'),
          ),
        ],
      ),
    );
  }
}

class OffScreen extends StatelessWidget {
  const OffScreen({super.key, required this.adapterState});

  final BluetoothState adapterState;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.bluetooth_disabled,
          size: 200,
          color: Colors.red,
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Bluetooth adapter is ${adapterState.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.headlineSmall,
        ),
        const SizedBox(height: defaultMargin),
        ElevatedButton(
          onPressed: () => FlutterBluePlus.instance.turnOn(),
          child: const Text('Enable Bluetooth'),
        ),
      ],
    ));
  }
}
