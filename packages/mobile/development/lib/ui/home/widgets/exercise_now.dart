import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class ExerciseNow extends StatelessWidget {
  const ExerciseNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.heroUrl == null
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
                                color: Theme.of(context)
                                    .extension<AppColors>()!
                                    .red!,
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
                                color: Theme.of(context)
                                    .extension<AppColors>()!
                                    .red!,
                              ),
                            ],
                          ),
                          SizedBox(height: Dimens.height16),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimens.radius8)),
                            child: CachedNetworkImage(
                              imageUrl: state.heroUrl!,
                              width: Dimens.width200,
                            ),
                          ),
                          SizedBox(height: Dimens.height16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                                  context.watch<NavigationCubit>().state.hr ==
                                          null
                                      ? null
                                      : () {},
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
                        state.dateNow ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              );
      },
    );
  }
}
