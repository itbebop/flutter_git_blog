import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_screen.dart';

class PostListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  PostListViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  Repo? repo;
  List<Repo> repos = [];
  List<Post> posts = [];

  void onSearch(String value, context) async {
    if (value.contains('/')) {
      // 바로 repo 선택
      onSelectRepo(context, value);
    } else {
      // repo만 서치
      repos = await _postRepositoryImpl.getRepo(value);
    }
    notifyListeners();
  }

  void onSelectRepo(context, value) async {
    List keys = value.split('/');
    posts = await _postRepositoryImpl.getDir(owner: keys[0], repo: keys[1]);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostListScreen(
                  repo: keys[1],
                )));
  }
}
