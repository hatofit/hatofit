class WorkoutModel {
  final String name;
  final String image;
  final String duration;
  final String level;
  final String type;
  final int excerciseCount;
  final String videoUrl;

  WorkoutModel( {
    required this.name,
    required this.image,
    required this.duration,
    required this.level,
    required this.excerciseCount,
    required this.type,
    required this.videoUrl,
  });
}
