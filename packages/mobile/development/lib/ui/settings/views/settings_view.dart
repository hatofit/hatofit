import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: const Text('Settings'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: Column(
        children: [
          Text("Settings"),
        ],
      ),
    );
  }
}
