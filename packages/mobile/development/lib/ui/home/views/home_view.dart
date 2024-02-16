import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, nState) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, hState) {
            return Parent(
              appBar: AppBar(
                title: Text('Hi, ${hState.user?.firstName ?? "User"} 👋'),
                titleTextStyle: Theme.of(context).textTheme.titleLarge,
                actions: [
                  nState.state != BluetoothAdapterState.off
                      ? IconButton(
                          icon: Icon(
                            Icons.bluetooth,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            // context.read<NavigationCubit>().startScan();
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
                        ConnectedDevice(nState: nState),
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
