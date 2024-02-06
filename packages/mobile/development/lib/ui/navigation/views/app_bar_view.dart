import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';
import 'package:hatofit/utils/services/native_methods.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
    this.title,
    this.centerTitle,
    this.titleTextStyle,
    this.showActions = true,
  });
  final Widget? title;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle ?? Theme.of(context).textTheme.titleMedium,
      actions: showActions
          ? [
              BlocBuilder<NavigationCubit, NavigationState>(
                builder: (context, state) {
                  return state.state != BluetoothAdapterState.off
                      ? IconButton(
                          icon: Icon(
                            Icons.bluetooth,
                            color:
                                state.hr != null ? Colors.blue : Colors.white,
                          ),
                          onPressed: () {
                            context.read<NavigationCubit>().startScan();
                            showModalBottomSheet(
                              showDragHandle: true,
                              // isScrollControlled: true,
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
                          onPressed: () {
                            context.read<NativeMethods>().turnOnBluetooth();
                          },
                        );
                },
              ),
            ]
          : null,
    );
  }
}
