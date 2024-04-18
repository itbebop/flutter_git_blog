import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

class RepoList extends StatelessWidget {
  RepoListViewModel viewModel;
  final TextEditingController _queryTextEditingController;
  final BuildContext context; //TODO: 이렇게 context 보내는 게 맞는지?
  RepoList({super.key, required this.viewModel, required TextEditingController queryTextEditingController, required this.context}) : _queryTextEditingController = queryTextEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListWheelScrollView(
          itemExtent: 50,
          diameterRatio: 1.5,
          useMagnifier: true,
          magnification: 2,
          children: viewModel.state.respos
              .map((e) => SizedBox(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        viewModel.onSelectRepo(context, '${_queryTextEditingController.text.split('/')[0]}/${e.name}');
                        context.push('/post', extra: '${_queryTextEditingController.text.split('/')[0]}/${e.name}');
                      },
                      child: Text(
                        e.name!,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
