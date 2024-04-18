import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/repo_list.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/serch_repo_bar.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/user_profile.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset('assets/images/git_blog_white.png'),
        ),
        actions: const [
          AppBarTextButton(
            text: 'Repository List',
          ),
        ],
      ),
      body: SingleChildScrollView(
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
              RepoList(viewModel: viewModel),
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
