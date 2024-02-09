import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/ext/ext.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Parent(
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.whenOrNull(
            initial: () async =>
                await context.read<SplashCubit>().requestPermissions(),
            authorized: (message) {
              context.read<SplashCubit>().upsertOfflineMode(false);
              context.goNamed(Routes.root.name);
            },
            unauthorized: (message) {
              if (context.read<SplashCubit>().isInitialized) {
                Strings.of(context)!.sessionExpired.toToastError(context);
              }
              context.read<SplashCubit>().upsertOfflineMode(false);
              final user = context.read<SplashCubit>().user;
              if (user != null &&
                  user.metricUnits != null &&
                  user.height != null &&
                  user.weight != null &&
                  user.dateOfBirth != null) {
                context.goNamed(Routes.login.name);
              } else {
                context.goNamed(Routes.greeting.name);
              }
            },
            offline: () {
              Strings.of(context)!.failedConnectToServer.toToastError(context);
              context.read<SplashCubit>().upsertOfflineMode(true);
              Future.delayed(Durations.long3, () {
                if (context.read<SplashCubit>().user != null) {
                  context.goNamed(Routes.home.name);
                } else {
                  context.goNamed(Routes.greeting.name);
                }
              });
            },
          );
        },
        child: ColoredBox(
          color: theme.extension<AppColors>()!.background!,
          child: Center(
            child: Image.asset(
              context.isDarkMode
                  ? 'assets/images/logo/dark.png'
                  : 'assets/images/logo/light.png',
              width: Dimens.menuContainer,
            ),
          ),
        ),
      ),
    );
  }
}
