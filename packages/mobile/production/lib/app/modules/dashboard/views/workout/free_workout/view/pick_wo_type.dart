import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/free_workout/free_workout_controller.dart';

enum WorkoutType { other, walking, running, cycling, swimming }

extension WorkoutTypeExtension on WorkoutType {
  String get name {
    switch (this) {
      case WorkoutType.walking:
        return 'Walking';
      case WorkoutType.running:
        return 'Running';
      case WorkoutType.cycling:
        return 'Cycling';
      case WorkoutType.swimming:
        return 'Swimming';
      default:
        return 'Other';
    }
  }

  IconData get icon {
    switch (this) {
      case WorkoutType.walking:
        return Icons.directions_walk;
      case WorkoutType.running:
        return Icons.directions_run;
      case WorkoutType.cycling:
        return Icons.directions_bike;
      case WorkoutType.swimming:
        return Icons.pool;
      default:
        return Icons.directions;
    }
  }
}

class PickWoType extends GetView<FreeWorkoutController> {
  const PickWoType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text('Pick Workout Type',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: WorkoutType.values.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      final WorkoutType type = WorkoutType.values[index];
                      return InkWell(
                        onTap: controller.isLoading.value == true
                            ? () {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            : () {
                                controller.saveWorkout(type.name);
                              },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                type.icon,
                                size: 48,
                              ),
                              Text(type.name),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
