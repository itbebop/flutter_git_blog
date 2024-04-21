import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_info.freezed.dart';
part 'file.g.dart';

@freezed
class FileInfo with _$File {
  const factory FileInfo({
    required String name,
    required String path,
    required num size,
    required String htmlUrl,
    required String downloadUrl,
    required String type,
    required String content,
    required String encoding,
  }) = _File;

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);
}
