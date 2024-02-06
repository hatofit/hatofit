import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_image_params.freezed.dart';

@freezed
class DownloadImageParams with _$DownloadImageParams {
  const factory DownloadImageParams({
    @Default("") String url,
    @Default("") String fileName,
  }) = _DownloadImageParams;
}
