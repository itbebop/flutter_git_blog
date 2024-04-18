import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
import 'package:flutter_git_blog/data/mapper/user_mapper.dart';
import 'package:flutter_git_blog/data/model/user.dart';
import 'package:flutter_git_blog/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final GitDataSource _api;
  UserRepositoryImpl(this._api);

  @override
  Future<User> getUser(String user) async {
    final res = await _api.getUser(user);
    return res.toUser();
  }
}
