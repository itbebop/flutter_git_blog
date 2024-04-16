import 'package:flutter_git_blog/data/model/repo.dart';

abstract interface class PostRepository {
  Future<List<Repo>> getRepo(String owner);
  //Future<List<Post>> getDir({required String owner, required String repo});
}
