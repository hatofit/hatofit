import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.width16, vertical: Dimens.height8),
      margin: EdgeInsets.symmetric(horizontal: Dimens.width16),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.pushNamed(Routes.settingsDeviceIntegration.name);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.width4),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.watch,
                        color:
                            Theme.of(context).extension<AppColors>()!.subtitle!,
                      ),
                      SizedBox(width: Dimens.width16),
                      Text(
                        Strings.of(context)!.deviceIntegration,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).extension<AppColors>()!.subtitle!,
                  ),
                ],
              ),
            ),
          ),
          // Divider(),
          // Row(
          //   children: [
          //     Icon(
          //       Icons.watch,
          //       color: Theme.of(context).extension<AppColors>()!.subtitle!,
          //     ),
          //     SizedBox(width: Dimens.width16),
          //     Text(
          //       Strings.of(context)!.deviceIntegration,
          //       style: Theme.of(context).textTheme.bodyLarge,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
