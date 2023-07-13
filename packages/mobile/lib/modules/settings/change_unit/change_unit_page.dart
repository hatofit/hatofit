import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/modules/settings/change_unit/change_unit_controller.dart';

import 'package:polar_hr_devices/widget/setting/setting_list_tile_widget.dart';

class ChangeUnitPage extends GetView<ChangeUnitController> {
  const ChangeUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          title: Text(
            'Change Unit',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container()),
    ));
  }
}
