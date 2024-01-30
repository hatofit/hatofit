import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/ui/navigation/cubit/navigation_cubit.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
    this.title,
    this.centerTitle,
    this.titleTextStyle,
    this.showActions = true,
  });
  final Widget? title;
  final bool? centerTitle;
  final TextStyle? titleTextStyle;
  final bool showActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      titleTextStyle: titleTextStyle ?? Theme.of(context).textTheme.titleMedium,
      actions: showActions
          ? [
              IconButton(
                icon: context.watch<NavigationCubit>().isBleOn
                    ? Icon(
                        Icons.bluetooth,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.bluetooth_disabled,
                        color: Colors.red,
                      ),
                onPressed: () {},
              ),
            ]
          : null,
    );
  }
}
