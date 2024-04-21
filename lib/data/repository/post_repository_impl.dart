import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
import 'package:flutter_git_blog/data/dto/file_dto/file_dto.dart';
import 'package:flutter_git_blog/data/dto/post_dto/post_dto.dart';
import 'package:flutter_git_blog/data/mapper/file_mapper.dart';
import 'package:flutter_git_blog/data/mapper/post_mapper.dart';
import 'package:flutter_git_blog/data/mapper/repo_mapper.dart';
import 'package:flutter_git_blog/data/model/file_info.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final GitDataSource _postDataSource;

  PostRepositoryImpl({required GitDataSource postDataSource}) : _postDataSource = postDataSource;

  @override
  Future<List<Repo>> getRepo(String owner) async {
    final repos = await _postDataSource.getRepo(owner);
    return repos.map((e) => e.toRepo()).toList();
  }

  @override
  Future<List<Post>> getDir({required String owner, required String repo, String? path}) async {
    final List<PostDto> dto = await _postDataSource.getPath(owner: owner, repo: repo, path: path);
    return dto.map((e) => e.toPost()).toList();
  }

  @override
  Future<FileInfo> getFile({required String owner, required String repo, required dir}) async {
    final FileDto content = await _postDataSource.getPost(owner: owner, repo: repo, dir: dir);

    return content.toFile();
  }
}
