import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ConnectedDevice extends StatelessWidget {
  final NavigationState nState;
  final int age;
  const ConnectedDevice({super.key, required this.nState, required this.age});

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
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
                          color: thm.extension<AppColors>()!.red!,
                        ),
                        SizedBox(width: Dimens.width8),
                        Text(
                          Strings.of(context)!.currentHeartRate,
                          style: thm.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimens.height8),
                    ContainerWrapper(
                      color: thm
                          .extension<AppColors>()!
                          .subtitle!
                          .withOpacity(0.1),
                      child: Row(
                        children: [
                          nState.cDevice != null
                              ? Container(
                                  padding: EdgeInsets.all(Dimens.width8),
                                  decoration: BoxDecoration(
                                    color: thm
                                        .extension<AppColors>()!
                                        .subtitle!
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                      Dimens.radius8,
                                    ),
                                  ),
                                  child: Image.asset(
                                    nState.cDevice!.name
                                        .imageDeviceAssetDecision(),
                                    width: Dimens.width48,
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(width: Dimens.width8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nState.cDevice?.brand ?? '',
                                style: thm.textTheme.bodyMedium,
                              ),
                              SizedBox(height: Dimens.height4),
                              Text(
                                nState.cDevice?.name ?? '',
                                style: thm.textTheme.bodySmall,
                              ),
                              SizedBox(height: Dimens.height4),
                              Text(
                                nState.cDevice?.address ?? '',
                                style: thm.textTheme.bodySmall!.copyWith(
                                  color: context.isDarkMode
                                      ? Palette.card
                                      : Palette.cardDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimens.height8),
                    Row(
                      children: [
                        Expanded(
                            child: ContainerWrapper(
                          color: thm
                              .extension<AppColors>()!
                              .subtitle!
                              .withOpacity(0.1),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconWrapper(
                                    icon: Icons.favorite_outline_rounded,
                                    color: thm.primaryColor,
                                    size: Dimens.width16,
                                    width: Dimens.width24,
                                    height: Dimens.width24,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius4),
                                  ),
                                  SizedBox(width: Dimens.width8),
                                  Text(
                                    Strings.of(context)!.now,
                                    style: thm.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimens.height4),
                              Text(
                                nState.hrSample!.hr.toString(),
                                style: thm.textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "bpm",
                                style: thm.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )),
                        SizedBox(width: Dimens.width8),
                        Expanded(
                            child: ContainerWrapper(
                          color: thm
                              .extension<AppColors>()!
                              .subtitle!
                              .withOpacity(0.1),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconWrapper(
                                    icon: Icons.percent_outlined,
                                    color: thm.primaryColor,
                                    size: Dimens.width16,
                                    width: Dimens.width24,
                                    height: Dimens.width24,
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius4),
                                  ),
                                  SizedBox(width: Dimens.width8),
                                  Text(
                                    Strings.of(context)!.percentage,
                                    style: thm.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimens.height4),
                              Text(
                                "${nState.hrSample!.hr.hrPercent(age)} %",
                                style: thm.textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                Strings.of(context)!.ofMaxHeartRate,
                                style: thm.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimens.height4),
              Divider(color: thm.extension<AppColors>()!.subtitle!),
              SizedBox(height: Dimens.height4),
            ],
          )
        : Container();
  }
}
