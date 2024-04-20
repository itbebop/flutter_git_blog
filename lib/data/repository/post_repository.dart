import 'package:flutter_git_blog/data/model/file.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';

abstract interface class PostRepository {
  Future<List<Repo>> getRepo(String owner);
  Future<List<Post>> getDir({required String owner, required String repo});
  Future<File> getFile({required String owner, required String repo, required dir});
}
