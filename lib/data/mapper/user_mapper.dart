import 'package:flutter_git_blog/data/dto/user_dto/UserDto.dart';
import 'package:flutter_git_blog/data/model/user.dart';

extension ToUser on UserDto {
  User toUser() {
    return User(
      // Todo : ?? 못쓰는 이유 확인할것, num의 null체크는??
      id: id as int,
      name: name ?? '',
      html_url: htmlUrl ?? '',
      bio: bio ?? '',
      avatarUrl: avatarUrl ?? '',
      followers: followers as int,
      following: following as int,
      blog: blog ?? '',
      company: company ?? '',
      publicRepos: publicRepos as int,
      location: location ?? '',
      email: email ?? '',
      type: type ?? '',
    );
  }
}
