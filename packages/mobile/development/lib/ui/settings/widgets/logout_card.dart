import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SettingsCubit>().logout();
        context.goNamed(Routes.splashScreen.name);
      },
      child: ContainerWrapper(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.width16, vertical: Dimens.height8),
          margin: EdgeInsets.symmetric(horizontal: Dimens.width16),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimens.width4),
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Theme.of(context).extension<AppColors>()!.subtitle!,
                ),
                SizedBox(width: Dimens.width16),
                Text(
                  Strings.of(context)!.logout,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).extension<AppColors>()!.subtitle!,
                ),
              ],
            ),
          )),
    );
  }
}
