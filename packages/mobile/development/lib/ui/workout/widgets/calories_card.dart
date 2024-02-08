import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class CaloriesCard extends StatelessWidget {
  final double calories;
  final String? unit;
  const CaloriesCard({super.key, required this.calories, this.unit});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color:
              Theme.of(context).extension<AppColors>()!.mauve!.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_fire_department,
            color: Theme.of(context).extension<AppColors>()!.mauve!,
            size: Dimens.width64,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  calories.toStringAsFixed(0),
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(width: Dimens.width8),
                Text(
                  unit ?? 'Calories',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
