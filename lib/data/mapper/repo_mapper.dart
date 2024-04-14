import 'package:flutter_git_blog/data/dto/repo_dto/repo_dto.dart';
import 'package:flutter_git_blog/data/model/repo.dart';

extension ToPost on RepoDto {
  Repo toPost() {
    return Repo(
      id: id ?? 0,
      name: name ?? '',
      fullName: fullName ?? '',
      htmlUrl: htmlUrl ?? '',
    );
  }
}
