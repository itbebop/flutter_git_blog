import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_screen.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_view_model.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_screen.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RepoListViewModel(postRepositoryImpl: PostRepositoryImpl(postDataSource: GitDataSource())),
        child: const RepoListScreen(),
      ),
    ),
    GoRoute(
      path: '/post',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => PostListViewModel(postRepositoryImpl: PostRepositoryImpl(postDataSource: GitDataSource())),
        child: const PostListScreen(),
      ),
    ),
  ],
);
