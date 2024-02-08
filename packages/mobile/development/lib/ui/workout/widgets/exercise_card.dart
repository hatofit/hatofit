import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';

class ExerciseCard extends StatelessWidget {
  final ExerciseEntity? exercise;
  final BleEntity? devices;
  const ExerciseCard({super.key, required this.exercise, this.devices});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimens.height100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            exercise!.thumbnail ?? Constants.get.placeholderImage,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.75),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              exercise!.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  devices!.name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(width: Dimens.width8),
                Text(
                  devices!.address,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
