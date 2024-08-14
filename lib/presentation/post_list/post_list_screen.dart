import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
import 'package:flutter_git_blog/presentation/post_list/post_list_view_model.dart';
import 'package:go_router/go_router.dart';
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

      viewModel.onFetch(owner: repoPath[0], repo: repoPath[1], path: widget.repoPath);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostListViewModel>();
    final dirs = viewModel.posts.where((element) => element.type == 'dir').toList();
    final files = viewModel.posts.where((element) => element.type == 'file').toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: TextWidget(
          text: viewModel.totalPath,
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: dirs
                        .map((e) => GestureDetector(
                              onTap: () => viewModel.onSelectDir(context, widget.repoPath, e.title),
                              child: Chip(
                                backgroundColor: LightAppColor.primaryColor,
                                shape: ContinuousRectangleBorder(
                                  side: const BorderSide(
                                    color: LightAppColor.primaryColor,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                label: Row(
                                  children: [
                                    const Icon(
                                      Icons.folder,
                                      color: LightAppColor.whiteColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextWidget(
                                        text: e.title.length > 30 ? '${e.title.substring(0, 30)}...' : e.title,
                                        fontColor: LightAppColor.whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList()),
                Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: files
                        .map((e) => GestureDetector(
                              onTap: () => viewModel.onSelectDir(context, widget.repoPath, e.title),
                              child: e.title.substring(e.title.length - 2) == 'md'
                                  ? GestureDetector(
                                      onTap: () => viewModel.context.push('/post', extra: '${viewModel.totalPath}/${e.title}'),
                                      // 읽을 수 있는 파일
                                      child: Chip(
                                        backgroundColor: Colors.transparent,
                                        shape: ContinuousRectangleBorder(
                                          side: const BorderSide(
                                            color: LightAppColor.primaryColor,
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        label: Row(
                                          children: [
                                            const Icon(Icons.file_copy_outlined),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: TextWidget(
                                                // overflow나지 않게
                                                text: e.title.length > 30 ? '${e.title.substring(0, 30)}...' : e.title,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  // 읽지 못하는 파일
                                  : Chip(
                                      backgroundColor: Colors.transparent,
                                      shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                          color: LightAppColor.greyColor,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      label: Row(
                                        children: [
                                          const Icon(
                                            Icons.file_copy_outlined,
                                            color: LightAppColor.secondaryColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: TextWidget(
                                              text: e.title,
                                              fontColor: LightAppColor.secondaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ))
                        .toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
