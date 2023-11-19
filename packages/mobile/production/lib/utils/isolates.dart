import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/models/session_model.dart';

List<ExerciseModel> exerciseModelFromJson(List<dynamic> data) =>
    data.map<ExerciseModel>((json) {
      return ExerciseModel.fromJson(json);
    }).toList();

List<SessionModel> sessionModelFromJson(List<dynamic> data) =>
    data.map<SessionModel>((json) {
      return SessionModel.fromJson(json);
    }).toList();