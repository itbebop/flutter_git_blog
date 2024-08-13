import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_git_blog/common/function/debouncer.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:flutter_git_blog/data/model/user.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/data/repository/user_repository_Impl.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_state.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_git_blog/prefs.dart';

class RepoListViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;

  RepoListViewModel({required UserRepositoryImpl userRepositoryImpl, required this.context, required PostRepositoryImpl postRepositoryImpl})
      : _postRepositoryImpl = postRepositoryImpl,
        _userRepositoryImpl = userRepositoryImpl;
  Repo? repo;
  final queryTextEditingController = TextEditingController();
  RepoListState _state = const RepoListState();
  RepoListState get state => _state;
  final UserRepositoryImpl _userRepositoryImpl;
  User? user;
  int selectedIndex = 0;
  String? queryText;
  BuildContext context;
  //bool _isLoading = false;
  bool isFocused = false;
  List<String> searchHistoryList = [];

  Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  void onFetch() {
    print('isFocused in Fetch: $isFocused');
  }

  void userSearch(String id) async {
    // _isLoading = true;
    notifyListeners();
    // repo까지 같이 검색하는 경우엔 아무것도 하지 않음
    !id.contains('/') ? user = await _userRepositoryImpl.getUser(id) : '';
    // _isLoading = false;
    notifyListeners();
  }

  void onSearchChanged(String query) {
    debouncer.run(() async {
      queryTextEditingController.value = queryTextEditingController.value.copyWith(text: query);
    });
  }

  void onSearch(String query) async {
    _state = state.copyWith(isLoading: true);

    notifyListeners();

    // history 저장
    // search history가 있는 경우
    if (Prefs.prefs.getStringList('search_history') != null) {
      // 검색어 중복이 없는 경우
      if (!Prefs.prefs.getStringList('search_history')!.contains(query)) {
        searchHistoryList.insert(0, query);
        await Prefs.prefs.setStringList('search_history', searchHistoryList);
        // 검색어 중복이 없는 경우
      } else {
        // searchHistoryList에서 중복 제거
        searchHistoryList = Prefs.prefs.getStringList('search_history') ?? [];
        searchHistoryList.remove(query);
        // 최근 검색어 가장 위로 insert
        searchHistoryList.insert(0, query);
        // search_history 초기화 후 저장
        await Prefs.prefs.remove('search_history');
        await Prefs.prefs.setStringList('search_history', searchHistoryList);
      }
      // search history가 없는 경우
    } else {
      searchHistoryList.insert(0, query);
      await Prefs.prefs.setStringList('search_history', searchHistoryList);
    }

    if (query.contains('/')) {
      // 바로 repo 선택
      onSelectRepo(query);
    } else {
      // repo만 서치
      _state = state.copyWith(
        respos: await _postRepositoryImpl.getRepo(query),
        isLoading: false,
      );
    }
    notifyListeners();
  }

  void onSelectRepo(repoName) async {
    String path = repoName;
    print('repoName: $repoName');
    print('queryText: $queryText');
    path.contains('/') ? path : path = '$queryText/$repoName';
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(isLoading: false);
    notifyListeners();
    GoRouter.of(context).push('/postlist', extra: path);
  }

  void onScrolledRepo(index) {
    selectedIndex = index;
  }

  void onTabSearchBar() async {
    searchHistoryList = Prefs.prefs.getStringList('search_history') ?? [];
    searchHistoryList = searchHistoryList.take(5).toList();
    notifyListeners();
  }

  void onDeleteHistory(index) async {
    searchHistoryList.removeAt(index);
    // search_history 초기화 후 저장
    await Prefs.prefs.remove('search_history');
    await Prefs.prefs.setStringList('search_history', searchHistoryList);
    notifyListeners();
  }
}
