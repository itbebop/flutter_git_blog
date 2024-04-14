import 'package:flutter/foundation.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  PostListViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  List<Repo> repo = [];

  void onSearch(String owner) async {
    repo = await _postRepositoryImpl.getRepo(owner);
    notifyListeners();
  }
}
