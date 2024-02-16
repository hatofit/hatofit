import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class AppCard extends StatelessWidget {
  final DataHelper state;
  const AppCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final setCub = context.watch<SettingsCubit>();
    return ContainerWrapper(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.width16, vertical: Dimens.height8),
      margin: EdgeInsets.symmetric(horizontal: Dimens.width16),
      child: Column(
        children: [
          DropDown<ActiveTheme>(
            key: const Key("dropdown_theme"),
            hintIsVisible: false,
            value: state.activeTheme,
            prefixIcon: const Icon(Icons.light),
            items: ActiveTheme.values
                .map(
                  (data) => DropdownMenuItem(
                    value: data,
                    child: Text(
                      _getThemeName(data, context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              context
                  .read<SettingsCubit>()
                  .updateTheme(value ?? ActiveTheme.system);
            },
          ),
          Divider(
            color: Theme.of(context).extension<AppColors>()!.subtitle,
          ),
          DropDown<DataHelper>(
            key: const Key("dropdown_language"),
            hintIsVisible: false,
            value: state.sLang ?? setCub.listLanguage[0],
            prefixIcon: const Icon(Icons.language_outlined),
            items: setCub.listLanguage
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
              state.sLang = value ?? setCub.listLanguage[0];

              context.read<SettingsCubit>().updateLanguage(value?.type ?? "en");
            },
          ),
        ],
      ),
    );
  }

  String _getThemeName(ActiveTheme activeTheme, BuildContext context) {
    if (activeTheme == ActiveTheme.system) {
      return Strings.of(context)!.themeSystem;
    } else if (activeTheme == ActiveTheme.dark) {
      return Strings.of(context)!.themeDark;
    } else {
      return Strings.of(context)!.themeLight;
    }
  }
}
