import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class PostListScreen extends StatefulWidget {
  final String repo;
  const PostListScreen({super.key, required this.repo});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final _queryTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.repo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(widget.repo),
            ],
          ),
        ),
      ),
    );
  }
}
