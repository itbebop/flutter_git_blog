import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/repo_list.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/serch_repo_bar.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/user_profile.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class RepoListScreen extends StatefulWidget {
  const RepoListScreen({super.key});

  @override
  State<RepoListScreen> createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  final _queryTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RepoListViewModel>();
    final user = viewModel.user;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(borderRadius: BorderRadius.circular(12.0), child: Image.asset('assets/images/logo.png')),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              SizedBox(
                height: 50,
                width: 100,
                child: ClipRRect(borderRadius: BorderRadius.circular(12.0), child: Image.asset('assets/images/catub.png')),
              ),
            ],
          ),
          actions: const [],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: SearchRepoBar(queryTextEditingController: _queryTextEditingController, viewModel: viewModel),
                  ),
                  user != null ? UserProfile(user: user) : const SizedBox(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  RepoList(viewModel: viewModel),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: LightAppColor.greyColor, width: 0.5)), // 라인효과
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              switch (value) {
                case 0:
                  context.go('/');
                case 1:
                  context.go('/favorites');
              }
            },
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home, color: LightAppColor.secondaryColor), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: 'Repository'),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTextButton extends StatelessWidget {
  final String text;
  const AppBarTextButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
      ),
    );
  }
}
