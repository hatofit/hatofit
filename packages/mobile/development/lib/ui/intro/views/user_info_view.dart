import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class UserInfoView extends StatelessWidget with MainBoxMixin {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    late final List<DataHelper> listGender = [
      DataHelper(
        title: Strings.of(context)!.male,
        iconPath: 'assets/images/avatar/male.png',
        color: Palette.male,
      ),
      DataHelper(
        title: Strings.of(context)!.female,
        iconPath: 'assets/images/avatar/female.png',
        color: Palette.female,
      ),
    ];
    return Parent(
      appBar: AppBar(
        title: Text(
          Strings.of(context)!.userPreferences,
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      child: BlocBuilder<IntroCubit, IntroState>(
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: Dimens.height16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Dimens.width16,
                    ),
                    Text(
                      Strings.of(context)!.selectYourGender,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.height16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listGender
                      .map((e) => _buildGenderItem(
                            context,
                            e.iconPath ?? "",
                            e.title ?? "",
                            e.color!,
                            state,
                          ))
                      .toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.width16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimens.height8,
                      ),
                      Text(
                        Strings.of(context)!.pickYourHeight,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      HorizontalPicker(
                        minValue: 0,
                        maxValue: 300,
                        divisions: 300,
                        height: Dimens.height100,
                        showCursor: true,
                        initialItem: state.height ?? 150,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        activeItemTextColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          context
                              .read<IntroCubit>()
                              .updateHeight(value.toInt());
                        },
                      ),
                      SizedBox(
                        height: Dimens.height8,
                      ),
                      Text(
                        Strings.of(context)!.pickYourWeight,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      HorizontalPicker(
                        minValue: 0,
                        maxValue: 250,
                        divisions: 250,
                        height: Dimens.height100,
                        showCursor: true,
                        initialItem: state.weight ?? 125,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        activeItemTextColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          context
                              .read<IntroCubit>()
                              .updateWeight(value.toInt());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(Dimens.width16),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  context.read<IntroCubit>().updateAll();
                  context.pushNamed(Routes.login.name);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Palette.primary,
                  padding: EdgeInsets.symmetric(vertical: Dimens.height8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.radius8),
                  ),
                ),
                child: Text(
                  Strings.of(context)!.next,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderItem(
    BuildContext context,
    String svgAsset,
    String gender,
    Color genderColor,
    IntroState state,
  ) {
    final isSelected = gender.toLowerCase() == state.selectedGender;
    return GestureDetector(
      onTap: () {
        context.read<IntroCubit>().updateGender(gender.toLowerCase());
      },
      child: AnimatedContainer(
        width: Dimens.width150,
        height: Dimens.height150,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: Dimens.width8),
        padding: EdgeInsets.all(Dimens.radius8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? genderColor : Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.radius15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              svgAsset,
              width: Dimens.width84,
              height: Dimens.height84,
            ),
            Text(
              gender.capitalizeFirst!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
