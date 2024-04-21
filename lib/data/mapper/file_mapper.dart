import 'package:flutter_git_blog/data/dto/file_dto/file_dto.dart';
import 'package:flutter_git_blog/data/model/file_info.dart';

extension ToFile on FileDto {
  FileInfo toFile() {
    return FileInfo(
      name: name ?? '',
      path: path ?? '',
      size: size ?? 0,
      htmlUrl: htmlUrl ?? '',
      type: type ?? '',
      content: content ?? '',
      encoding: encoding ?? '',
      downloadUrl: downloadUrl ?? '',
    );
  }
}
