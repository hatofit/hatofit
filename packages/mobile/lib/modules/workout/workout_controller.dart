import 'package:get/get.dart';
import 'package:polar_hr_devices/models/workout_model.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_page.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start.dart';

class WorkoutController extends GetxController {
  final String title = 'Workout';

  goToWorkoutDetail(WorkoutModel workout) {
    Get.to(() => WorkoutDetailsPage(workout));
  }

  startWorkout(WorkoutModel workout) {
    Get.to(() => WorkoutStart(
          workout: workout,
        ));
  }

  final List<WorkoutModel> todayGoalWorkouts = [
    WorkoutModel(
      name: '5-Min Yoga',
      image:
          'https://images.unsplash.com/photo-1447452001602-7090c7ab2db3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8NSUyME1pbiUyMFlvZ2F8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
      duration: '5 min',
      level: 'Beginner',
      videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
      excerciseCount: 15,
      type: 'Yoga',
    ),
    WorkoutModel(
        name: 'Breathwork',
        image:
            'https://images.unsplash.com/photo-1591343395902-1adcb454c4e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 12,
        type: 'Abs'),
    WorkoutModel(
        name: 'Liberty Walk',
        image:
            'https://images.unsplash.com/photo-1585473233369-14a97aa923df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8am9nZ2luZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 10,
        type: 'Abs'),
    WorkoutModel(
        name: 'Abs quickie',
        image:
            'https://images.unsplash.com/photo-1520787497953-1985ca467702?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QWJzJTIwcXVpY2tpZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 18,
        type: 'Abs'),
    WorkoutModel(
      name: 'Cardio',
      image:
          'https://images.unsplash.com/photo-1608138278545-366680accc66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Q2FyZGlvfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      duration: '5 min',
      level: 'Beginner',
      videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
      excerciseCount: 20,
      type: 'Cardio',
    ),
  ];

  final List<WorkoutModel> topCollectionWorkouts = [
    WorkoutModel(
        name: '5-Min Yoga',
        image:
            'https://images.unsplash.com/photo-1447452001602-7090c7ab2db3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8NSUyME1pbiUyMFlvZ2F8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 15,
        type: 'Yoga'),
    WorkoutModel(
        name: 'Breathwork',
        image:
            'https://images.unsplash.com/photo-1591343395902-1adcb454c4e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 12,
        type: 'Abs'),
    WorkoutModel(
        name: 'Liberty Walk',
        image:
            'https://images.unsplash.com/photo-1585473233369-14a97aa923df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8am9nZ2luZ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 10,
        type: 'Abs'),
    WorkoutModel(
        name: 'Abs quickie',
        image:
            'https://images.unsplash.com/photo-1520787497953-1985ca467702?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8QWJzJTIwcXVpY2tpZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
        duration: '5 min',
        level: 'Beginner',
        videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
        excerciseCount: 18,
        type: 'Abs'),
    WorkoutModel(
      name: 'Cardio',
      image:
          'https://images.unsplash.com/photo-1608138278545-366680accc66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Q2FyZGlvfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60',
      duration: '5 min',
      level: 'Beginner',
      videoUrl: 'https://www.youtube.com/watch?v=LXuVHYAfyGU',
      excerciseCount: 20,
      type: 'Cardio',
    ),
  ];
}
