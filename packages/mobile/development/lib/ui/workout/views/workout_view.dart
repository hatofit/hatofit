import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: SafeArea(
        child: Column(
          children: [
            Text("Workout"),
            TextButton(
              onPressed: () => context.pushNamed(Routes.workoutDetail.name),
              child: Text("Detail"),
            ),
          ],
        ),
      ),
    );
  }
}
