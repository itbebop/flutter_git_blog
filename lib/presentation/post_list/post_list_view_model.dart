import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  PostListViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  List<Post> posts = [];

  void onFetch() async {
    //posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo);
  }
}
