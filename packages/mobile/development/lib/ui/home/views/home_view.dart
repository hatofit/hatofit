import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/dependecy_injection.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int age = 0;
  @override
  void initState() {
    context.read<HomeCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listenWhen: (p, c) {
        return p.bleFailure != c.bleFailure || p.cDevice != c.cDevice;
      },
      listener: (context, state) {
        if (state.bleFailure != null) {
          if (state.bleFailure?.message
                  ?.contains("CONNECTION_FAILED_ESTABLISHMENT") ==
              true) {
            Strings.of(context)!.failedConnectToDevice.toToastError(context);
          }
        }
        if (state.cDevice != null) {
          Strings.of(context)!.successConnectToDevice.toToastSuccess(context);
          final hS = context.read<HomeCubit>().state;
          if (hS.user != null) {
            final now = DateTime.now();
            setState(() {
              age = now.year - (hS.user!.dateOfBirth ?? now).year;
            });
          }
        }
      },
      buildWhen: (p, c) =>
          p.hrSample != c.hrSample ||
          p.cDevice != c.cDevice ||
          p.state != c.state,
      builder: (context, nState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, hState) {
            return Parent(
              appBar: AppBar(
                title: Text('Hi, ${hState.user?.firstName ?? "User"} 👋'),
                titleTextStyle: Theme.of(context).textTheme.titleLarge,
                automaticallyImplyLeading: false,
                actions: [
                  nState.state != BluetoothAdapterState.off
                      ? IconButton(
                          icon: const Icon(
                            Icons.bluetooth,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            if (!di.isRegistered<NavigationCubit>()) {
                              regNavCubit();
                            }
                            context.read<NavigationCubit>().startScan();
                            showModalBottomSheet(
                              showDragHandle: true,
                              context: context,
                              builder: (context) {
                                return const DeviceDiscover();
                              },
                            );
                          },
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.bluetooth_disabled,
                            color: Colors.red,
                          ),
                          onPressed: () async => FlutterBluePlus.turnOn(),
                        )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.width8),
                child: RefreshIndicator(
                  onRefresh: () async => await context.read<HomeCubit>().init(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConnectedDevice(nState: nState, age: age),
                        ExerciseNow(hState: hState),
                        SizedBox(height: Dimens.height16),
                        HrBarChart(hState: hState),
                        SizedBox(height: Dimens.height8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: CalorieGauge(hState: hState)),
                            SizedBox(width: Dimens.width8),
                            Expanded(child: BMIGauge(hState: hState)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
