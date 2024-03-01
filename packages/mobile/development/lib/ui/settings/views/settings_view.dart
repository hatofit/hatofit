import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    context.read<SettingsCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(Strings.of(context)!.setting),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: BlocBuilder<SettingsCubit, DataHelper>(
        buildWhen: (p, c) => p.user != c.user,
        builder: (context, state) { 
          return Column(
            children: [
              UserCard(user: state.user),
              SizedBox(height: Dimens.height16),
              const DeviceCard(),
              SizedBox(height: Dimens.height16),
              AppCard(state: state),
              SizedBox(height: Dimens.height16),
              const LogoutCard(),
            ],
          );
        },
      ),
    );
  }
}
