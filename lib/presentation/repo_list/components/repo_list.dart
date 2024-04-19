import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
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
      height: MediaQuery.of(context).size.height * 0.47,
      child: SingleChildScrollView(
        child: Wrap(
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            children: viewModel.state.respos
                .map((e) => GestureDetector(
                      onTap: () {
                        viewModel.onSelectRepo(e.name);
                        viewModel.context.push('/post', extra: '${viewModel.queryTextEditingController}/${e.name}');
                      },
                      child: Chip(
                        backgroundColor: LightAppColor.whiteColor,
                        shape: ContinuousRectangleBorder(
                          side: const BorderSide(
                            color: LightAppColor.primaryColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: TextWidget(
                          text: e.name,
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
