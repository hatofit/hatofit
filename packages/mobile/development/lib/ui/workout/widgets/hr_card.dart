import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class HrCard extends StatelessWidget {
  final int hr;
  const HrCard({super.key, required this.hr});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.width8),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            color: Theme.of(context).primaryColor,
            size: Dimens.width64,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  hr.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(width: Dimens.width8),
                Text(
                  'BPM',
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
