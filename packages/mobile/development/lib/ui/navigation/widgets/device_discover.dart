import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';
import 'package:hatofit/utils/utils.dart';

class DeviceDiscover extends StatefulWidget {
  const DeviceDiscover({super.key});

  @override
  State<DeviceDiscover> createState() => _DeviceDiscoverState();
}

class _DeviceDiscoverState extends State<DeviceDiscover> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.width8),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return state.fDevices != null
              ? const FoundDevices()
              : const Center(
                  child: NoDevice(),
                );
        },
      ),
    );
  }
}

class FoundDevices extends StatelessWidget {
  const FoundDevices({
    super.key,
  });

  void onConnectPressed(
    BuildContext context,
    int index,
    NavigationState state,
  ) {
    context.read<NavigationCubit>().connectToDevice(state.fDevices[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listenWhen: (p, c) => p.cDevice != c.cDevice,
      listener: (context, state) {
        if (state.cDevice != null) {
          context.dismiss();
          context.pop();
          Strings.of(context)!.successConnectToDevice.toToastSuccess(context);
        } else {
          context.dismiss();
          Strings.of(context)!.disconnectedFromDevice.toToastSuccess(context);
        }
        if (state.bleFailure != null) {
          context.dismiss();
          Strings.of(context)!.failedConnectToDevice.toToastError(context);
        }
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.fDevices.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .extension<AppColors>()!
                    .subtitle!
                    .withOpacity(0.4),
                borderRadius: BorderRadius.circular(Dimens.height16),
              ),
              height: Dimens.height104,
              padding: EdgeInsets.only(
                left: Dimens.width8,
                bottom: Dimens.width8,
                top: Dimens.height8,
                right: Dimens.width12,
              ),
              margin: EdgeInsets.only(
                bottom: Dimens.height8,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimens.width8),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).extension<AppColors>()!.subtitle!,
                      borderRadius: BorderRadius.circular(Dimens.height16),
                    ),
                    child: Image.asset(
                      state.fDevices[index].name.imageDeviceAssetDecision(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: Dimens.width8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(state.fDevices[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ID : ${state.fDevices[index].address}",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    "RSSI : ${state.fDevices[index].rssi}",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.width4,
                                    vertical: Dimens.height2),
                                decoration: BoxDecoration(
                                    color: state.fDevices[index].isConnectable
                                        ? Theme.of(context)
                                            .extension<AppColors>()!
                                            .green!
                                            .withOpacity(0.3)
                                        : Theme.of(context)
                                            .extension<AppColors>()!
                                            .red!
                                            .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(
                                      Dimens.radius8,
                                    )),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.bluetooth,
                                      color:
                                          state.fDevices[index].isConnectable
                                              ? Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .green
                                              : Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .red,
                                      size: Dimens.width12,
                                    ),
                                    Text(
                                        state.fDevices[index].isConnectable
                                            ? Strings.of(context)!.connectable
                                            : Strings.of(context)!
                                                .unconnectable,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          state.fDevices[index].address !=
                                  state.cDevice?.address
                              ? ElevatedButton(
                                  onPressed: state.cDevice == null &&
                                          state
                                              .fDevices[index].isConnectable &&
                                          !state.isLoading
                                      ? () => onConnectPressed(
                                          context, index, state)
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .extension<AppColors>()!
                                        .blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(Dimens.radius8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      state.isLoading
                                          ? SizedBox(
                                              height: Dimens.width16,
                                              width: Dimens.width16,
                                              child:
                                                  const CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Icon(
                                              Icons.rocket_launch_rounded,
                                              color: Colors.white,
                                            ),
                                      SizedBox(
                                        width: Dimens.width8,
                                      ),
                                      Text(
                                        Strings.of(context)!.connect,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () => context
                                      .read<NavigationCubit>()
                                      .disconnectDevice(state.fDevices[index]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.bluetooth_disabled_rounded,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: Dimens.width8,
                                      ),
                                      Text(
                                        Strings.of(context)!.disconnect,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
