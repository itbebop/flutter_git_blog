import 'package:flutter_git_blog/data/dto/post_dto/post_dto.dart';
import 'package:flutter_git_blog/data/model/post.dart';

extension ToPost on PostDto {
  Post toPost() {
    return Post(
      title: name ?? '',
      path: path ?? '',
      type: type ?? '',
      url: downloadUrl ?? '',
      createdAt: date ?? '',
      updatedAt: date ?? '',
    );
  }
}
