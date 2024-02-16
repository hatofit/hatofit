import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ConnectedDevice extends StatelessWidget {
  final NavigationState nState;
  const ConnectedDevice({super.key, required this.nState});

  @override
  Widget build(BuildContext context) {
    return nState.hrSample != null
        ? Column(
            children: [
              ContainerWrapper(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconWrapper(
                          icon: Icons.favorite,
                          color: Theme.of(context).extension<AppColors>()!.red!,
                        ),
                        SizedBox(width: Dimens.width8),
                        Text(
                          Strings.of(context)!.currentHeartRate,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimens.height8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            nState.cDevice != null
                                ? Image.asset(
                                    nState.cDevice!.name
                                        .imageDeviceAssetDecision(),
                                    width: Dimens.width40,
                                  )
                                : const SizedBox(),
                            SizedBox(width: Dimens.width8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nState.cDevice?.name ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  nState.cDevice?.address ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: context.isDarkMode
                                            ? Palette.card
                                            : Palette.cardDark,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(children: [
                          Row(
                            children: [
                              Text(
                                nState.hrSample!.hr.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                " bpm",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimens.height4),
              Divider(
                  color: Theme.of(context).extension<AppColors>()!.subtitle!),
              SizedBox(height: Dimens.height4),
            ],
          )
        : Container();
  }
}
