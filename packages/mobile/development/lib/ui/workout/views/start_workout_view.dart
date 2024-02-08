import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/ext/context.dart';
import 'package:hatofit/utils/helper/logger.dart';

class StartWorkoutView extends StatelessWidget {
  final bool isFreeWorkout;
  final ExerciseEntity? exercise;
  final UserEntity? user;
  const StartWorkoutView(
      {super.key, required this.isFreeWorkout, this.exercise, this.user});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          log.i('didPop: $didPop');
          if (didPop) {
            return;
          }
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text(
                  'Are you sure you want to leave this page?',
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Nevermind'),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Leave'),
                    onPressed: () {
                      context.dismiss();
                      context.goNamed(Routes.home.name);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Parent(
          child: Padding(
            padding: EdgeInsets.all(Dimens.width8),
            child: BlocConsumer<NavigationCubit, NavigationState>(
                listenWhen: (p, c) => p.hrSample != c.hrSample,
                listener: (context, state) {
                  context.read<WorkoutCubit>().receiveStreamData(
                      HrSample(
                        timestamp: DateTime.now(),
                        hr: state.hrSample!.hr,
                        rrsMs: state.hrSample!.rrsMs,
                        contactStatus: state.hrSample!.contactStatus,
                        contactStatusSupported:
                            state.hrSample!.contactStatusSupported,
                      ),
                      user);
                },
                builder: (context, state) {
                  final ses = context.read<WorkoutCubit>().ses;
                  return state.hrSample != null
                      ? SingleChildScrollView(
                          child: Column(children: [
                            ExerciseCard(
                              exercise: exercise,
                              devices: state.cDevice,
                            ),
                            SizedBox(height: Dimens.height8),
                            DurationBox(duration: ses.duration),
                            SizedBox(height: Dimens.height8),
                            Row(
                              children: [
                                Expanded(child: HrCard(hr: state.hrSample!.hr)),
                                SizedBox(width: Dimens.width8),
                                Expanded(
                                    child: CaloriesCard(
                                  calories: ses.calories,
                                  unit: user?.metricUnits?.energyUnits,
                                )),
                              ],
                            ),
                            SizedBox(height: Dimens.height8),
                            Row(
                              children: [
                                Expanded(
                                  child: HrPercentGauge(
                                    percent: ses.hrPecentage,
                                    zoneType:
                                        ses.hrZoneType ?? HrZoneType.VERYLIGHT,
                                  ),
                                ),
                                SizedBox(width: Dimens.width8),
                                Expanded(
                                    child: HrZoneGauge(
                                  percent: ses.hrPecentage,
                                  zoneType:
                                      ses.hrZoneType ?? HrZoneType.VERYLIGHT,
                                )),
                              ],
                            ),
                            SizedBox(height: Dimens.height8),
                            HrChart(session: ses),
                          ]),
                        )
                      : Container();
                }),
          ),
        ));
  }
}
