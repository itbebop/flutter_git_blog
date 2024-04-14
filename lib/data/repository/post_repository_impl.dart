import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
import 'package:flutter_git_blog/data/mapper/post_mapper.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final GitDataSource _postDataSource;

  PostRepositoryImpl({required GitDataSource postDataSource}) : _postDataSource = postDataSource;

  @override
  Future<List<Repo>> getRepo(String owner) async {
    final repos = await _postDataSource.getRepo(owner);
    return repos;
  }

  @override
  Future<Post> getPost({required String owner, required String repo, required String dir, required String file}) async {
    final dto = await _postDataSource.getPost(owner: owner, repo: repo, dir: dir, file: file);
    return dto.toPost();
  }
}
