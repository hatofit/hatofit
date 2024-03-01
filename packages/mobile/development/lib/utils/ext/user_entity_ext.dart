import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/entities/entities.dart';
import 'package:hatofit/utils/ext/ext.dart';

extension UserEntExt on UserEntity {
  static const String basePath = 'assets/images/avatar';
  Widget determinePhoto(String? photo, String? gender) {
    final h = Dimens.height48;
    if (photo != null) {
      if (photo.isNotEmpty) {
        if (photo.length > 100) {
          return Image.memory(
            photo.toImage(),
            height: h,
          );
        }
        final api = APIConstant.get;
        return CachedNetworkImage(
          imageUrl: "${api.baseUrl}${api.image}/$photo",
          height: h,
          imageBuilder: (context, imageProvider) => Container(
            width: h,
            height: h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Icon(Icons.person, size: h),
        );
      }
      switch (gender) {
        case 'male':
          return Image.asset('$basePath/male.png', height: h);
        case 'female':
          return Image.asset('$basePath/female.png', height: h);
        default:
          return Icon(Icons.person, size: h);
      }
    } else {
      return Icon(Icons.person, size: h);
    }
  }
}
