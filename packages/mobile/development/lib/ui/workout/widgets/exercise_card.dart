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
      height: Dimens.height128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.radius15),
          bottomRight: Radius.circular(Dimens.radius15),
        ),
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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: Dimens.height48),
            Text(
              exercise!.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: Dimens.height8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  devices!.name,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(width: Dimens.width8),
                Text(
                  devices!.address,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
