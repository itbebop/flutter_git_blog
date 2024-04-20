import 'package:flutter_git_blog/data/dto/file_dto/file_dto.dart';
import 'package:flutter_git_blog/data/model/file.dart';

extension ToFile on FileDto {
  File toFile() {
    return File(
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
