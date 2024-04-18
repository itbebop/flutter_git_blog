import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';

class RepoList extends StatelessWidget {
  final RepoListViewModel viewModel;

  const RepoList({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (index) {
          viewModel.onScrolledRepo(index);
        },
        itemExtent: 50,
        diameterRatio: 1.5,
        childDelegate: ListWheelChildLoopingListDelegate(
            children: viewModel.state.respos
                .map((e) => SizedBox(
                      height: 30,
                      child: GestureDetector(
                        onTap: () {
                          viewModel.onSelectRepo('${e.name}');
                          viewModel.context.push('/post', extra: '${viewModel.queryTextEditingController}/${e.name}');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: viewModel.selectedIndex == viewModel.state.respos.indexOf(e) ? Colors.blue : Colors.transparent),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 3,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              e.name!,
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
