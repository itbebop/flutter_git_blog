import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_screen.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_state.dart';

class RepoListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  RepoListViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  Repo? repo;

  RepoListState _state = const RepoListState();
  RepoListState get state => _state;

  void onSearch(String value, context) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    if (value.contains('/')) {
      // 바로 repo 선택
      onSelectRepo(context, value);
    } else {
      // repo만 서치
      _state = state.copyWith(
        respos: await _postRepositoryImpl.getRepo(value),
        isLoading: false,
      );
      //repos = await _postRepositoryImpl.getRepo(value);
    }
    notifyListeners();
  }

  void onSelectRepo(context, value) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    List keys = value.split('/');
    _state = state.copyWith(isLoading: false);
    _state = state.copyWith(isLoading: false, post: await _postRepositoryImpl.getDir(owner: keys[0], repo: keys[1]));
    notifyListeners();
    //posts = await _postRepositoryImpl.getDir(owner: keys[0], repo: keys[1]);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostListScreen(
                  repo: keys[1],
                )));
  }
}
