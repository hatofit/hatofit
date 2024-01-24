import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Column(
        children: [
          Text(
            Strings.of(context)!.loading,
            style: context.textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
