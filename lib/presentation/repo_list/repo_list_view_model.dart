import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/model/user.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/data/repository/user_repository_Impl.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_state.dart';
import 'package:go_router/go_router.dart';

class RepoListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  RepoListViewModel({required UserRepositoryImpl userRepositoryImpl, required PostRepositoryImpl postRepositoryImpl})
      : _postRepositoryImpl = postRepositoryImpl,
        _userRepositoryImpl = userRepositoryImpl;
  Repo? repo;

  RepoListState _state = const RepoListState();
  RepoListState get state => _state;
  final UserRepositoryImpl _userRepositoryImpl;
  User? user;

  bool _isLoading = false;

  void userSearch(String id) async {
    _isLoading = true;
    notifyListeners();

    user = await _userRepositoryImpl.getUser(id);
    _isLoading = false;
    notifyListeners();
  }

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
    }
    notifyListeners();
  }

  void onSelectRepo(context, value) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(isLoading: false);
    notifyListeners();
    GoRouter.of(context).push('/post', extra: value);
  }
}
