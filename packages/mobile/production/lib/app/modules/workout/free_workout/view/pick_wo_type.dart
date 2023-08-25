import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/workout/free_workout/free_workout_controller.dart';
import 'package:hatofit/app/routes/app_routes.dart';

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
  const PickWoType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: WorkoutType.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final WorkoutType type = WorkoutType.values[index];
          return InkWell(
            onTap: () {
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
    );
  }
}
