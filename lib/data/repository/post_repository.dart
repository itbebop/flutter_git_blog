import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';

abstract interface class PostRepository {
  Future<List<Repo>> getRepo(String owner);
  Future<Post> getPost({required String owner, required String repo, required String dir, required String file});
}
