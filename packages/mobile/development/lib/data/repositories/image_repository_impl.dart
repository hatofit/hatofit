import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hatofit/core/error/failure.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageLocalDataSource _local;

  ImageRepositoryImpl(this._local);

  @override
  Future<Either<Failure, File>> getImageFromCamera() async {
    final res = await _local.getImageFromCamera();
    return res.fold((l) => Left(l), (r) => Right(File(r.path)));
  }

  @override
  Future<Either<Failure, File>> getImageFromSource() async {
    final res = await _local.getImageFromSource();
    return res.fold((l) => Left(l), (r) => Right(File(r.path)));
  }
}
