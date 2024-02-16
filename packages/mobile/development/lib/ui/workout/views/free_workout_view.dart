import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class FreeWorkoutView extends StatelessWidget {
  const FreeWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutCubit, WorkoutState>(
      buildWhen: (p, c) => p != c,
      builder: (context, state) => state.when(
        loading: () => const Center(child: Loading()),
        failure: (message) {
          if (message is CacheFailure) {
            return Center(child: Text(Strings.of(context)!.noWorkoutMenuFound));
          }
          return Center(child: Text(message.toString()));
        },
        success: (exercises) {
          exercises = exercises.where((e) => e.type!.isEmpty).toList();
          return successView(context, exercises);
        },
      ),
    );
  }

  Widget successView(BuildContext context, List<ExerciseEntity> exercises) {
    return RefreshIndicator(
      onRefresh: () {
        return context.read<WorkoutCubit>().getExercises();
      },
      child: Parent(
        appBar: AppBar(
          title: Text(Strings.of(context)!.freeTraining),
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
        ),
        child: GridView.builder(
          itemCount: exercises.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // add gap between items
            mainAxisSpacing: Dimens.width8,
            crossAxisSpacing: Dimens.width8,
          ),
          padding: EdgeInsets.all(Dimens.height8),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              final wCubit = context.read<WorkoutCubit>();
              final nCubit = context.read<NavigationCubit>();
              final res = wCubit.startWorkout(true, exercises[index]);
              if (!res) {
                Strings.of(context)!
                    .failedToStartWorkout
                    .toToastError(context, textAlign: TextAlign.center);
              } else if (wCubit.user != null && nCubit.state.cDevice != null) {
                context.pushNamed(Routes.startWorkout.name,
                    extra: StartExerciseParams(
                        isFreeWorkout: true,
                        exercise: exercises[index],
                        user: wCubit.user ?? const UserEntity(),
                        device: nCubit.state.cDevice));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    exercises[index].thumbnail ??
                        Constants.get.placeholderImage,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.75),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      exercises[index].name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
