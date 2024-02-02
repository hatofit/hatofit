import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/dependecy_injection.dart';
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
                buildWhen: (previous, current) =>
                    previous.isBleOn != current.isBleOn,
                builder: (context, state) {
                  return state.isBleOn!
                      ? IconButton(
                          icon: Icon(
                            Icons.bluetooth,
                            color:
                                state.hr != null ? Colors.blue : Colors.white,
                          ),
                          onPressed: () {
                            di<NavigationCubit>().scanDevices();
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
                            di<NativeMethods>().turnOnBluetooth();
                          },
                        );
                },
              ),
            ]
          : null,
    );
  }
}
