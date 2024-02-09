import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ConnectedDevice extends StatelessWidget {
  const ConnectedDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return state.hrSample != null
            ? Column(
                children: [
                  ContainerWrapper(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconWrapper(
                              icon: Icons.favorite,
                              color: Theme.of(context)
                                  .extension<AppColors>()!
                                  .red!,
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
                                state.cDevice != null
                                    ? Image.asset(
                                        state.cDevice!.name
                                            .imageDeviceAssetDecision(),
                                        width: Dimens.width40,
                                      )
                                    : const SizedBox(),
                                SizedBox(width: Dimens.width8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.cDevice?.name ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      state.cDevice?.address ?? '',
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
                                    state.hrSample!.hr.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    " bpm",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                      color:
                          Theme.of(context).extension<AppColors>()!.subtitle!),
                  SizedBox(height: Dimens.height4),
                ],
              )
            : Container();
      },
    );
  }
}
