import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/models/report/report_model.dart';
import 'package:hatofit/utils/ext/ext.dart';

class SessionDeviceCard extends StatelessWidget {
  final List<ReportDeviceModel>? devices;
  const SessionDeviceCard({super.key, this.devices});

  @override
  Widget build(BuildContext context) {
    final str = Strings.of(context)!;
    final thm = Theme.of(context);
    final cardColor = thm.extension<AppColors>()!.subtitle!;
    return devices == null || (devices ?? []).isEmpty
        ? const SizedBox()
        : ContainerWrapper(
            margin: EdgeInsets.symmetric(horizontal: Dimens.width8),
            child: Column(
              children: [
                Row(
                  children: [
                    IconWrapper(
                      icon: Icons.devices,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: Dimens.width8),
                    Text(Strings.of(context)!.device,
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                SizedBox(height: Dimens.height8),
                Column(
                  children: devices!
                      .map(
                        (e) => ContainerWrapper(
                          color: cardColor.withOpacity(0.2),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Dimens.radius8),
                                    color: cardColor.withOpacity(0.4)),
                                child: Image.asset(
                                  (e.name ?? "").imageDeviceAssetDecision(),
                                  width: Dimens.width84,
                                ),
                              ),
                              SizedBox(width: Dimens.width8),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(str.brand),
                                      Text(str.name),
                                      Text(str.identifier),
                                    ],
                                  ),
                                  SizedBox(width: Dimens.width8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          ": ${(e.brand ?? 'Unknown').limitBrandName()}"),
                                      Text(
                                          ": ${(e.name ?? 'Unknown').limitBrandName()}"),
                                      Text(": ${(e.identifier ?? 'Unknown')}"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          );
  }
}
