import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';

class DurationBox extends StatelessWidget {
  final Duration? duration;
  const DurationBox({super.key, this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.width8),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${Strings.of(context)!.duration}  :",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "${duration?.inHours ?? 0}h ${duration?.inMinutes.remainder(60) ?? 0}m ${duration?.inSeconds.remainder(60) ?? 0}s",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
