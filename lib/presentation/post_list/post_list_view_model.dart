import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  PostListViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  List<Post> posts = []; // 화면 처음에 뿌려줄 list
  List<Post> selectedPosts = []; // 화면 처음에 뿌려줄 list
  String totalPath = '';
  String prevPath = '';

  void onFetch({required String owner, required String repo, String? path}) async {
    if (path != null) {
      final repoPath = path.split('/');
      switch (repoPath.length) {
        case < 3:
          path = '';
          totalPath = '$owner/$repo/$path';
      }
    } else {
      path = '';
    }

    posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: path);
    notifyListeners();
  }

  void onSelectDir(context, String path, String dir) async {
    final repoPath = path.split('/');
    // 경로 하나 추가해주고
    totalPath = totalPath != '' ? '$totalPath/$dir' : dir; // 경로 하나 추가해주고
    prevPath = prevPath != '' ? '$prevPath/$dir' : dir; // 경로 하나 추가해주고

    final owner = repoPath[0];
    final repo = repoPath[1];

    posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: prevPath);
    notifyListeners();
  }

  void onSelectFile(context, String path, String fileName) {}
}
