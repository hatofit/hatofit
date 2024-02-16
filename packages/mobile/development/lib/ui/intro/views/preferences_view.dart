import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PreferenceView extends StatefulWidget {
  const PreferenceView({super.key});

  @override
  State<PreferenceView> createState() => _PreferenceViewState();
}

class _PreferenceViewState extends State<PreferenceView> {
  final pages = [
    Container(
      height: Dimens.menuContainer / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Palette.background,
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/icons/sun.svg',
          fit: BoxFit.cover,
          height: Dimens.height64,
        ),
      ),
    ),
    Container(
      height: Dimens.menuContainer / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Palette.backgroundDark,
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/images/icons/moon.svg',
          fit: BoxFit.cover,
          height: Dimens.height64,
        ),
      ),
    )
  ];

  bool? initialized;

  @override
  Widget build(BuildContext context) {
    if (context.isDarkMode && initialized == null) {
      final temp = List.from(pages);
      pages[0] = temp[1];
      pages[1] = temp[0];
      initialized ??= true;
    }

    final intrCub = context.watch<IntroCubit>();
    return Parent(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              Strings.of(context)!.appPreferences,
            ),
            SizedBox(
              height: Dimens.height4,
            ),
            Text(
              Strings.of(context)!.adjustPreferences,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
        centerTitle: true,
        toolbarHeight: Dimens.height84,
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimens.width16),
        child: BlocBuilder<IntroCubit, IntroState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Dimens.menuContainer / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.width8),
                          border: Border.all(
                            color: context.isDarkMode
                                ? Colors.white30
                                : Colors.black38,
                          ),
                        ),
                        child: LiquidSwipe(
                          pages: pages,
                          onPageChangeCallback: (activePageIndex) async {
                            if (initialized == null) {
                              if (activePageIndex == 0) {
                                await context
                                    .read<SettingsCubit>()
                                    .updateTheme(ActiveTheme.light);
                              } else {
                                await context
                                    .read<SettingsCubit>()
                                    .updateTheme(ActiveTheme.dark);
                              }
                            } else {
                              if (activePageIndex == 0) {
                                await context
                                    .read<SettingsCubit>()
                                    .updateTheme(ActiveTheme.dark);
                              } else {
                                await context
                                    .read<SettingsCubit>()
                                    .updateTheme(ActiveTheme.light);
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: Dimens.height16,
                      ),
                      Text(
                        "<< ${Strings.of(context)!.swipeToChangeTheme} <<",
                      ),
                      SizedBox(
                        height: Dimens.height16,
                      ),
                      DropDown<DataHelper>(
                        key: const Key("dropdown_language"),
                        hint: Strings.of(context)!.chooseLanguage,
                        value: state.sLang ?? intrCub.listLanguage[0],
                        prefixIcon: const Icon(Icons.language_outlined),
                        items: intrCub.listLanguage
                            .map(
                              (data) => DropdownMenuItem(
                                value: data,
                                child: Row(
                                  children: [
                                    Text(
                                      data.title ?? "-",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    SizedBox(
                                      width: Dimens.width8,
                                    ),
                                    Image.asset(
                                      data.iconPath ?? "",
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (DataHelper? value) async {
                          state.sLang = value ?? intrCub.listLanguage[0];

                          if (!mounted) return;
                          context
                              .read<SettingsCubit>()
                              .updateLanguage(value?.type ?? "en");
                        },
                      ),
                      SizedBox(
                        height: Dimens.height16,
                      ),
                      DropDown<DataHelper>(
                        key: const Key("energy_metric"),
                        hint: Strings.of(context)!.energyUnit,
                        value: state.sEUnit ?? intrCub.listEnergyUnit[0],
                        prefixIcon: const Icon(Icons.bolt_outlined),
                        items: intrCub.listEnergyUnit
                            .map(
                              (data) => DropdownMenuItem(
                                value: data,
                                child: Text(
                                  data.title ?? "-",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (DataHelper? value) {
                          state.sEUnit = value ?? intrCub.listEnergyUnit[0];

                          if (!mounted) return;
                          context.read<IntroCubit>().uEUnit(value?.type ?? "kcal");
                        },
                      ),
                      SizedBox(height: Dimens.height16),
                      DropDown<DataHelper>(
                        key: const Key("height_metric"),
                        hint: Strings.of(context)!.heightUnit,
                        value: state.sHUnit ?? intrCub.listHeightUnit[0],
                        prefixIcon: const Icon(Icons.rule_outlined),
                        items: intrCub.listHeightUnit
                            .map(
                              (data) => DropdownMenuItem(
                                value: data,
                                child: Text(
                                  data.title ?? "-",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (DataHelper? value) {
                          state.sHUnit = value ?? intrCub.listHeightUnit[0];

                          if (!mounted) return;
                          intrCub.uHUnit(value?.type ?? "cm");
                        },
                      ),
                      SizedBox(height: Dimens.height16),
                      DropDown<DataHelper>(
                        key: const Key("weight_metric"),
                        hint: Strings.of(context)!.weightUnit,
                        value: state.sWUnit ?? intrCub.listWeightUnit[0],
                        prefixIcon: const Icon(Icons.line_weight_outlined),
                        items: intrCub.listWeightUnit
                            .map(
                              (data) => DropdownMenuItem(
                                value: data,
                                child: Text(
                                  data.title ?? "-",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (DataHelper? value) {
                          state.sWUnit = value ?? intrCub.listWeightUnit[0];

                          if (!mounted) return;
                          intrCub.uWUnit(value?.type ?? "kg");
                        },
                      ),
                      SizedBox(
                        height: Dimens.height16,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context.read<SettingsCubit>().updateAll(
                              context.read<SettingsCubit>().state.activeTheme,
                              state.sLang?.type ?? "en",
                              state.sHUnit?.type ?? "cm",
                              state.sWUnit?.type ?? "kg",
                              state.sEUnit?.type ?? "kcal",
                            );
                        context.pushNamed(Routes.userInfo.name);
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
            );
          },
        ),
      ),
    );
  }
}
