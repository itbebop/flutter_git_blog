import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
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

  // @override
  // Future<List<Post>> getDir(
  //     {required String owner, required String repo}) async {
  //   final List<PostDto> dto =
  //       await _postDataSource.getDir(owner: owner, repo: repo);
  //   return dto.map((e) => e.toPost()).toList();
  // }
}
