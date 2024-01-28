import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Dimens.height32),
              TextButton(
                onPressed: () => context.read<HomeCubit>().req(),
                child: Text("Request Bluetooth"),
              ),
              SizedBox(height: Dimens.height32),
            ],
          ),
        ),
      ),
    );
  }
}
