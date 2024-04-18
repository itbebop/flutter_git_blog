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
          print(' < 3이다 ');
          path = '';
          totalPath = '$owner/$repo/$path';
        // posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: path);
        // notifyListeners();
        // case == 3:
        //   print(' == 3이다');
        //   totalPath = path;
        //   print('prevpath1 : $totalPath');
        //   path = repoPath[repoPath.length - 1];
        //   print('path1 : $path');
        // // posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: path);
        // // notifyListeners();
        // default: // 이 부분부터는 onSelectDir로 가는듯
        //   print('default 다');
        //   totalPath = '$totalPath/$path'; // 경로 하나 추가해주고
        //   path = repoPath[repoPath.length - 1];
        // posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: path);
        // notifyListeners();
      }
    } else {
      path = '';
    }

    print('prevpath2 : $totalPath');
    print('path2 : $path');
    posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: path);
    notifyListeners();
  }

  void onSelectDir(context, String path, String dir) async {
    print('onSelectDir 다');
    print('dir : $dir');
    final repoPath = path.split('/');
    // 경로 하나 추가해주고
    totalPath = totalPath != '' ? '$totalPath/$dir' : dir; // 경로 하나 추가해주고
    prevPath = prevPath != '' ? '$prevPath/$dir' : dir; // 경로 하나 추가해주고
    print('totalPath : $totalPath');
    print('prevpath3 : $prevPath');

    final owner = repoPath[0];
    final repo = repoPath[1];

    posts = await _postRepositoryImpl.getDir(owner: owner, repo: repo, path: prevPath);
    notifyListeners();
  }

  void onSelectFile(context, String path, String fileName) {}
}
