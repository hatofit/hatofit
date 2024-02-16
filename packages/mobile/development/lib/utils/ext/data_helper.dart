import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/utils/utils.dart';

extension DataHelperExt on DataHelper {
  Widget buildGenderItem({
    required BuildContext context,
    required String svgAsset,
    required String gender,
    required Color genderColor,
    required void Function()? onTap,
    required String selected,
    required String type,
  }) {
    final isSelected = type.toLowerCase() == selected.toLowerCase();
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: Dimens.width128,
        height: Dimens.height128,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: Dimens.width8),
        padding: EdgeInsets.all(Dimens.radius8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? genderColor : Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.radius15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              svgAsset,
              width: Dimens.width84,
              height: Dimens.height84,
            ),
            Text(
              gender.capitalizeFirst!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
