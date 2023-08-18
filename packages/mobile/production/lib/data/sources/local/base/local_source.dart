import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/data/models/exercise.dart';
import 'package:hatofit/data/sources/local/local_repo_iml.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../app/core/domain/failure.dart';
import '../../../../app/core/domain/success.dart';
import '../../../models/session.dart';

enum LocalType { fetchWorkout, saveWorkout, fetchSession, saveSession }

class LocalSource {
  static final _singleton = LocalSource();
  static LocalSource get instance => _singleton;

  Future<Either<Failure, Success<dynamic>>> request(
      LocalPayloadRepoAbs request) async {
    switch (request.type) {
      case LocalType.fetchWorkout:
        return await fetchWorkouts(request);
      case LocalType.saveWorkout:
        return await saveWorkouts(request);
      case LocalType.fetchSession:
        return await fetchSession(request);
      case LocalType.saveSession:
        return await saveSession(request);
    }
  }

  Future<Either<Failure, Success<List<Exercise>>>> fetchWorkouts(
      LocalPayloadRepoAbs request) async {
    try {
      final Directory? dir = await getExternalStorageDirectory();
      final String path = '${dir!.path}/${request.path}/workout.json';
      final jsonFile = File(path);
      if (jsonFile.existsSync()) {
        final json = jsonDecode(jsonFile.readAsStringSync());
        final exercises = <Exercise>[];
        for (var item in json['exercises']) {
          exercises.add(Exercise.fromJson(item));
        }
        return Right(
            Success(code: 'OK', message: 'Using local data', data: exercises));
      } else {
        return Left(Failure(
            code: 'ERROR', message: 'No local data found', details: ''));
      }
    } catch (e) {
      return Left(Failure(
          code: 'ERROR', message: 'Cant access local data', details: ''));
    }
  }

  Future<Either<Failure, Success<String>>> saveWorkouts(
      LocalPayloadRepoAbs request) async {
    try {
      final Directory? dir = await getExternalStorageDirectory();
      final String path = '${dir!.path}/${request.path}/workout.json';
      final json = jsonEncode(request.body);
      final file = File(path);
      if (file.existsSync()) {
        file.deleteSync();
        file.createSync(recursive: true);
        file.writeAsStringSync(json);
        return Right(Success(
            code: 'OK', message: 'Workout saved', data: 'Workout saved'));
      } else {
        file.createSync(recursive: true);
        file.writeAsStringSync(json);
        return Right(Success(
            code: 'OK', message: 'Workout saved', data: 'Workout saved'));
      }
    } catch (e) {
      return Left(
          Failure(code: 'ERROR', message: 'Failed to save', details: ''));
    }
  }

  Future<Either<Failure, Success<List<Session>>>> fetchSession(
      LocalPayloadRepoAbs request) async {
    try {
      final Directory? dir = await getExternalStorageDirectory();
      final String targetDir = '${dir!.path}/${request.path}';
      //read all json files in the directory using loop
      final read = await Directory(targetDir).list().toList();
      final sessions = <Session>[];
      for (var item in read) {
        final jsonFile = File(item.path);
        if (jsonFile.existsSync()) {
          final json = jsonDecode(jsonFile.readAsStringSync());
          sessions.add(Session.fromJson(json));
        }
      }
      return Right(
          Success(code: 'OK', message: 'Using local data', data: sessions));
    } catch (e) {
      return Left(
          Failure(code: 'ERROR', message: 'No local data found', details: ''));
    }
  }

  Future<Either<Failure, Success<bool>>> saveSession(
      LocalPayloadRepoAbs request) async {
    try {
      final Directory? dir = await getExternalStorageDirectory();
      final String targetDir = '${dir!.path}/${request.path}';
      print('==========**********==========\n'
          'local_source.dart\n'
          'saveSession\n'
          '==========**********==========\n'
          'targetDir: $targetDir\n'
          'request.body: ${request.body}\n'
          '==========**********==========\n');
      final jsonFile = File('$targetDir/${request.body}.json');
      if (jsonFile.existsSync()) {
        return Right(
            Success(code: 'OK', message: 'Session already exists', data: true));
      } else {
        jsonFile.createSync(recursive: true);
        jsonFile.writeAsStringSync(jsonEncode(request.body));
        return Right(Success(code: 'OK', message: 'Session saved', data: true));
      }
    } catch (e) {
      return Left(
          Failure(code: 'ERROR', message: 'No local data found', details: ''));
    }
  }
}
