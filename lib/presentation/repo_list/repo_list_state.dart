import 'package:flutter_git_blog/data/model/post.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'repo_list_state.freezed.dart';
part 'repo_list_state.g.dart';

@freezed
class RepoListState with _$RepoListState {
  const factory RepoListState({
    @Default(false) bool isLoading,
    @Default([]) List<Post> post,
    @Default([]) List<Repo> respos,
  }) = _RepoListState;

  factory RepoListState.fromJson(Map<String, dynamic> json) => _$RepoListStateFromJson(json);
}
