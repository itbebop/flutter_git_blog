import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
import 'package:flutter_git_blog/presentation/bookmark_list/bookmark_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookmarkListScreen extends StatefulWidget {
  const BookmarkListScreen({super.key});

  @override
  State<BookmarkListScreen> createState() => _BookmarkListScreenState();
}

class _BookmarkListScreenState extends State<BookmarkListScreen> {
  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<BookmarkViewModel>();

      viewModel.onFetch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BookmarkViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: ClipRRect(borderRadius: BorderRadius.circular(12.0), child: Image.asset('assets/images/logo.png')),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ClipRRect(borderRadius: BorderRadius.circular(12.0), child: Image.asset('assets/images/catub.png')),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: viewModel.bookmarks.isNotEmpty && viewModel.bookmarks.first != null
                        ? viewModel.bookmarks
                            .map((e) => GestureDetector(
                                  onTap: () => viewModel.context.push('/post', extra: e['path']),
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
                                            text: e['path'].toString().length > 30 ? '${e['path'].toString().substring(0, 30)}...' : e['path'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()
                        : viewModel.bookmarks
                            .skip(1) // 첫 번째 요소를 스킵합니다.
                            .map((e) => GestureDetector(
                                  onTap: () => viewModel.context.push('/post', extra: e['path']),
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
                                            text: e['path'].toString().length > 30 ? '${e['path'].toString().substring(0, 30)}...' : e['path'],
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
