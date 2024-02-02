import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';
import 'package:hatofit/utils/helper/logger.dart';

String imageDecision(String name) {
  if (name.contains("Polar H10")) {
    return 'assets/images/polar/polar-h10.webp';
  } else if (name.contains("Polar Sense")) {
    return 'assets/images/polar/polar-verity-sense.webp';
  } else if (name.contains("Polar H9")) {
    return 'assets/images/polar/polar-h9.webp';
  } else if (name.contains("Polar OH1")) {
    return 'assets/images/polar/polar-oh1.webp';
  } else {
    return 'assets/images/icons/hatofit.png';
  }
}

class DeviceDiscover extends StatefulWidget {
  const DeviceDiscover({
    super.key,
  });

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
          log?.i("DeviceDiscover: ${state.state}");
          return state.devices != null
              ? ListView.builder(
                  itemCount: state.devices!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .extension<AppColors>()!
                            .subtitle!
                            .withOpacity(0.4),
                        borderRadius: BorderRadius.circular(Dimens.height16),
                      ),
                      height: Dimens.height100,
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
                              color: Theme.of(context)
                                  .extension<AppColors>()!
                                  .subtitle!,
                              borderRadius:
                                  BorderRadius.circular(Dimens.height16),
                            ),
                            child: Image.asset(
                              imageDecision(state.devices![index].common!.name),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: Dimens.width8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.devices![index].common!.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "ID : ${state.devices![index].commonId}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          Text(
                                            "RSSI : ${state.devices![index].common!.rssi}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () => context
                                        .read<NavigationCubit>()
                                        .connectToDevice(state.devices![index]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
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
                                              .bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: NoDevice(),
                );
        },
      ),
    );
  }
}
