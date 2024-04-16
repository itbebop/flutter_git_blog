import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_view_model.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatefulWidget {
  // final String repo;
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  Widget build(BuildContext context) {
    final repoData = context.watch<PostListViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              //Text(),
            ],
          ),
        ),
      ),
    );
  }
}
