import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';

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

  static const platform = MethodChannel('com.hatofit.hatofit/method');
  Future<void> _turnOnBluetooth() async {
    try {
      await platform.invokeMethod('turnOnBluetooth');
    } on PlatformException catch (e) {
      print("Failed to turn on Bluetooth: ${e.message}");
    }
  }

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
                  return state.isBleOn!
                      ? IconButton(
                          icon: const Icon(
                            Icons.bluetooth,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return DeviceDiscover(
                                  state: state,
                                );
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
                            _turnOnBluetooth();
                          },
                        );
                },
              ),
            ]
          : null,
    );
  }
}
