import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/file.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;
  PostViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  String contents = '';

  void onFetch(String path) async {
    List pathList = path.split('/');
    String owner = pathList[0];
    String repo = pathList[1];
    String dir = '';
    print(pathList.length);
    for (int i = 2; i < pathList.length; i++) {
      dir += '${pathList[i]}';
    }

    print('owner : $owner');
    print('repo : $repo');
    print('dir : $dir');
    contents = await _postRepositoryImpl.getFile(owner: owner, repo: repo, path: dir);
    print('contents : $contents');
    notifyListeners();
  }
}
