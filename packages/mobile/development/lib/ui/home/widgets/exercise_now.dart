import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ExerciseNow extends StatelessWidget {
  final HomeState hState;
  const ExerciseNow({super.key, required this.hState});

  @override
  Widget build(BuildContext context) {
    return hState.heroUrl == null
        ? Container()
        : Column(
            children: [
              ContainerWrapper(
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconWrapper(
                            icon: Icons.fitness_center_rounded,
                            color:
                                Theme.of(context).extension<AppColors>()!.red!,
                          ),
                          SizedBox(width: Dimens.width8),
                          Text(
                            Strings.of(context)!.exerciseNow,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(width: Dimens.width8),
                          IconWrapper(
                            icon: Icons.fitness_center_rounded,
                            color:
                                Theme.of(context).extension<AppColors>()!.red!,
                          ),
                        ],
                      ),
                      SizedBox(height: Dimens.height16),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.radius8)),
                        child: CachedNetworkImage(
                          imageUrl: hState.heroUrl!,
                          width: Dimens.width200,
                        ),
                      ),
                      SizedBox(height: Dimens.height16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<NavigationCubit>().state.hrSample ==
                                    null
                                ? Strings.of(context)!
                                    .toUseThisFeatureYouNeedToConnectYourDevice
                                    .toToastError(context,
                                        textAlign: TextAlign.center)
                                : context.pushNamed(Routes.freeWorkout.name);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: Dimens.width8,
                              ),
                              Text(
                                Strings.of(context)!.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimens.height16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Strings.of(context)!.todayActivity,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    hState.dateNow ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          );
  }
}
