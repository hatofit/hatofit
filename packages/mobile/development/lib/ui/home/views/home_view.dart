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
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getData(),
      child: Parent(
        appBar: AppBar(
          title: Text('Hi, ${homeCubit.userName} 👋'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          actions: [
            BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                return state.state != BluetoothAdapterState.off
                    ? IconButton(
                        icon: Icon(
                          Icons.bluetooth,
                          color: state.hrSample != null
                              ? Colors.blue
                              : Colors.white,
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
                      );
              },
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.width8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ConnectedDevice(),
                const ExerciseNow(),
                SizedBox(height: Dimens.height16),
                const HrBarChart(),
                SizedBox(height: Dimens.height8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: CalorieGauge()),
                    SizedBox(width: Dimens.width8),
                    const Expanded(child: BMIGauge()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
