import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/dependecy_injection.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class PreferenceView extends StatefulWidget {
  const PreferenceView({super.key});

  @override
  State<PreferenceView> createState() => _PreferenceViewState();
}

class _PreferenceViewState extends State<PreferenceView> with MainBoxMixin {
  late final ActiveTheme _selectedTheme = di<SettingsCubit>().getActiveTheme();
  late final List<DataHelper> _listLanguage = [
    DataHelper(
        title: Constants.get.english,
        type: "en",
        iconPath: 'assets/images/icons/united-kingdom.png'),
    DataHelper(
        title: Constants.get.bahasa,
        type: "id",
        iconPath: 'assets/images/icons/indonesia.png'),
  ];
  late DataHelper _selectedLanguage =
      (getData(MainBoxKeys.locale) ?? "en") == "en"
          ? _listLanguage[0]
          : _listLanguage[1];
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Parent(
        child: Padding(
          padding: EdgeInsets.all(Dimens.width16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.of(context)!.appPreferences,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    height: Dimens.height4,
                  ),
                  Text(
                    Strings.of(context)!.adjustPreferences,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: Dimens.height16,
                  ),
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
                      onPageChangeCallback: (activePageIndex) {
                        if (activePageIndex == 0) {
                          context
                              .read<SettingsCubit>()
                              .updateTheme(ActiveTheme.light);
                        } else {
                          context
                              .read<SettingsCubit>()
                              .updateTheme(ActiveTheme.dark);
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
                    value: _selectedLanguage,
                    prefixIcon: const Icon(Icons.language_outlined),
                    items: _listLanguage
                        .map(
                          (data) => DropdownMenuItem(
                            value: data,
                            child: Row(
                              children: [
                                Text(
                                  data.title ?? "-",
                                  style: Theme.of(context).textTheme.bodyMedium,
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
                      _selectedLanguage = value ?? _listLanguage[0];

                      /// Reload theme
                      if (!mounted) return;
                      context
                          .read<SettingsCubit>()
                          .updateLanguage(value?.type ?? "en");
                    },
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.pushNamed(Routes.userInfo.name),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Palette.redLatte,
                    padding: EdgeInsets.symmetric(vertical: Dimens.height16),
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
      ),
    );
  }
}
