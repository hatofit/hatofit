import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class StartWorkoutView extends StatefulWidget {
  final bool isFreeWorkout;
  final UserEntity user;
  final BleEntity? device;
  final ExerciseEntity? exercise;
  const StartWorkoutView({
    super.key,
    required this.isFreeWorkout,
    required this.user,
    required this.device,
    this.exercise,
  });

  @override
  State<StartWorkoutView> createState() => _StartWorkoutViewState();
}

class _StartWorkoutViewState extends State<StartWorkoutView> {
  int second = 0;
  BleEntity? device;
  Timer? timer;
  @override
  void initState() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        second++;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  _finishWorkout(BuildContext ctx) {
    return showDialog<bool>(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.of(context)!.endTraining),
          content: Text(Strings.of(context)!.areYouSureYouWantToEndWorkout),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: Text(Strings.of(context)!.no),
              onPressed: () {
                final navigator = Navigator.of(context, rootNavigator: true);
                navigator.pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge),
              child: Text(Strings.of(context)!.yes),
              onPressed: () async {
                final navigator = Navigator.of(context, rootNavigator: true);
                navigator.pop();
                _showEmojiPicker(ctx);
              },
            ),
          ],
        );
      },
    );
  }

  String mood = 'neutral';
  _showEmojiPicker(BuildContext ctx) {
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              Strings.of(context)!.whatMoodAreYouIn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            content: EmojiPicker(
              onEmojiSelected: (p0) {
                mood = p0;
                final navigator = Navigator.of(context, rootNavigator: true);
                navigator.pop();
              },
            ),
          );
        }).then((_) {
      ctx.show();
      try {
        final nCub = ctx.read<NavigationCubit>();
        final wCub = ctx.read<WorkoutCubit>();
        ctx
            .read<WorkoutCubit>()
            .endWorkout(
              isFreeWorkout: widget.isFreeWorkout,
              session: wCub.ses,
              user: widget.user,
              ble: widget.device ?? nCub.state.cDevice!,
              mood: mood,
              exercise: widget.exercise,
            )
            .then((value) {
          final navigator = Navigator.of(context, rootNavigator: true);
          navigator.pop();
          if (value) {
            ctx.pushReplacementNamed(Routes.home.name);
          } else {
            Strings.of(ctx)!
                .somethingWentWrong
                .toToastError(ctx, textAlign: TextAlign.center);
          }
        });
      } catch (e) {
        Strings.of(ctx)!.somethingWentWrong.toToastError(ctx);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) return;
        _finishWorkout(context);
      },
      child: Parent(
        floatingButton: FloatingActionButton.extended(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            _finishWorkout(context);
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.stop,
                color: Colors.white,
              ),
              SizedBox(
                width: Dimens.width8,
              ),
              Text(
                Strings.of(context)!.endExercise,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        child: BlocConsumer<NavigationCubit, NavigationState>(
            listenWhen: (p, c) => p.hrSample != c.hrSample,
            listener: (context, state) {
              device = state.cDevice;
              context.read<WorkoutCubit>().receiveStreamData(
                    hr: state.hrSample,
                    user: widget.user,
                    ecg: state.ecgSample,
                    acc: state.accSample,
                    gyro: state.gyroSample,
                    magnetometer: state.magnetometerSample,
                    ppg: state.ppgSample,
                    second: second,
                    timeStamp: DateTime.now(),
                  );
            },
            builder: (context, state) {
              final ses = context.read<WorkoutCubit>().ses;

              return state.hrSample != null
                  ? SingleChildScrollView(
                      child: Column(children: [
                        ExerciseCard(
                          exercise: widget.exercise,
                          devices: state.cDevice,
                        ),
                        SizedBox(height: Dimens.height8),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimens.width16,
                                vertical: Dimens.height8),
                            child: Column(
                              children: [
                                DurationBox(duration: ses.duration),
                                SizedBox(height: Dimens.height8),
                                Row(
                                  children: [
                                    Expanded(
                                        child: HrCard(hr: state.hrSample!.hr)),
                                    SizedBox(width: Dimens.width8),
                                    Expanded(
                                        child: CaloriesCard(
                                      calories: ses.calories,
                                      unit:
                                          widget.user.metricUnits?.energyUnits,
                                    )),
                                  ],
                                ),
                                SizedBox(height: Dimens.height8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: HrPercentGauge(
                                        percent: ses.hrPecentage,
                                        zoneType: ses.hrZoneType ??
                                            HrZoneType.veryLight,
                                      ),
                                    ),
                                    SizedBox(width: Dimens.width8),
                                    Expanded(
                                        child: HrZoneGauge(
                                      percent: ses.hrPecentage,
                                      zoneType: ses.hrZoneType ??
                                          HrZoneType.veryLight,
                                    )),
                                  ],
                                ),
                                SizedBox(height: Dimens.height8),
                                HrChart(session: ses),
                                SizedBox(height: Dimens.height8),
                              ],
                            )),
                      ]),
                    )
                  : Container();
            }),
      ),
    );
  }
}
