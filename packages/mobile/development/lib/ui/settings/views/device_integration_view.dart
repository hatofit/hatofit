import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class DeviceIntegrationView extends StatelessWidget {
  const DeviceIntegrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(Strings.of(context)!.deviceIntegration),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: const DeviceDiscover(),
    );
  }
}
