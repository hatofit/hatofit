import 'package:flutter/widgets.dart';
import 'package:hatofit/core/core.dart';

class WorkoutDetailView extends StatelessWidget {
  const WorkoutDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Parent(
      child: SafeArea(
        child: Text("Workout Detail"),
      ),
    );
  }
}
