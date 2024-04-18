import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_view_model.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatefulWidget {
  final String repoPath;
  const PostListScreen(this.repoPath, {super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    final repoPath = widget.repoPath.split('/');
    Future.microtask(() {
      final viewModel = context.read<PostListViewModel>();
      print('repoPath.length : ${repoPath.length}');
      print('##widget.repoPath : ${widget.repoPath}');

      viewModel.onFetch(owner: repoPath[0], repo: repoPath[1], path: widget.repoPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostListViewModel>();
    final dirs = viewModel.posts.where((element) => element.type == 'dir').toList();
    final files = viewModel.posts.where((element) => element.type == 'file').toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            viewModel.totalPath,
            style: const TextStyle(fontSize: 10),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                    children: dirs
                        .map((e) => GestureDetector(
                              onTap: () => viewModel.onSelectDir(context, widget.repoPath, e.title),
                              child: Text(
                                e.title,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ))
                        .toList()),
                Column(
                    children: files
                        .map((e) => GestureDetector(
                              onTap: () => viewModel.onSelectFile(context, widget.repoPath, e.title),
                              child: Text(
                                e.title,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ))
                        .toList()),
              ],
            ),
          ),
        ));
  }
}
