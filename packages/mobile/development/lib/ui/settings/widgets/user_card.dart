import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/ext/ext.dart';

class UserCard extends StatelessWidget {
  final UserEntity? user;
  const UserCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final uCubit = context.read<SettingsCubit>();
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.settingsProfile.name);
      },
      child: ContainerWrapper(
        margin: EdgeInsets.symmetric(horizontal: Dimens.width16),
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.width16, vertical: Dimens.height8),
        child: Row(
          children: [
            user?.determinePhoto(user?.photo, user?.gender) ??
                Icon(Icons.person, size: Dimens.height48),
            SizedBox(width: Dimens.width16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${uCubit.determineUsername(user?.firstName, false)} ${uCubit.determineUsername(user?.lastName, true)}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  "${context.read<SettingsCubit>().getAge(user?.dateOfBirth)} ${Strings.of(context)!.yearsOld}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).extension<AppColors>()!.subtitle,
                      ),
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
    );
  }
}
