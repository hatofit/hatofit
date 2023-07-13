import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/settings/user_info/user_info_controller.dart';

class UserInfoPage extends GetView<UserInfoController> {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 48),
      child: Column(children: [
        Center(
          child: Column(
            children: [
              Text(
                'User Info',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              SvgPicture.asset(
                controller.storage.read('genderAsset'),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
