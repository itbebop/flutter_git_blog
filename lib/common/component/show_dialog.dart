import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';

Future<dynamic> ShowDialog(BuildContext context, RepoListViewModel viewModel, int index) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('title'),
          content: const Text('content'),
          actions: [
            FloatingActionButton.small(
              onPressed: () {
                viewModel.onDeleteHistory(index);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            FloatingActionButton.small(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            )
          ],
        );
      });
}
