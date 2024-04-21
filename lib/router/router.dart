import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/screen/error_screen.dart';
import 'package:flutter_git_blog/common/screen/splash_screen.dart';
import 'package:flutter_git_blog/data/data_source/git_data_source.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:flutter_git_blog/data/repository/user_repository_Impl.dart';
import 'package:flutter_git_blog/presentation/bookmark_list/bookmark_list.dart';
import 'package:flutter_git_blog/presentation/bookmark_list/bookmark_view_model.dart';
import 'package:flutter_git_blog/presentation/post/post_screen.dart';
import 'package:flutter_git_blog/presentation/post/post_view_model.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_screen.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_view_model.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_screen.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RepoListViewModel(
            context: context, //TODO: context여기서 Viewmodel로 보내도 되는지, 화면 이동 등
            userRepositoryImpl: UserRepositoryImpl(GitDataSource()),
            postRepositoryImpl: PostRepositoryImpl(postDataSource: GitDataSource())),
        child: const RepoListScreen(),
      ),
    ),
    GoRoute(
      path: '/postlist',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => PostListViewModel(context: context, postRepositoryImpl: PostRepositoryImpl(postDataSource: GitDataSource())),
        child: PostListScreen(state.extra as String),
      ),
    ),
    GoRoute(
      path: '/post',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => PostViewModel(context: context, postRepositoryImpl: PostRepositoryImpl(postDataSource: GitDataSource())),
        child: PostScreen(state.extra as String),
      ),
    ),
    GoRoute(
      path: '/bookmarks',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => BookmarkViewModel(context: context),
        child: const BookmarkListScreen(),
      ),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
  ],
  errorBuilder: (context, state) {
    // 에러 페이지
    return const Error404Screen();
  },
);
