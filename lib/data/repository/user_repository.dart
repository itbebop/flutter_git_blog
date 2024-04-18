import 'package:flutter_git_blog/data/model/user.dart';

abstract interface class UserRepository {
  Future<User> getUser(String user);
}
