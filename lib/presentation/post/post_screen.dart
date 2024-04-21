import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
import 'package:flutter_git_blog/presentation/post/post_view_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  // 처음에 viewModel의 onfetch를 실행하기 위해 stateful로 함
  final String path;
  const PostScreen(this.path, {super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<PostViewModel>();
    viewModel.onFetch(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: viewModel.totalPath,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                  onPressed: viewModel.onSave,
                  icon: viewModel.isSaved == false
                      ? const Icon(Icons.star)
                      : const Icon(
                          Icons.star,
                          color: LightAppColor.primaryColor,
                        )),
            )
          ],
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Markdown(
            data: viewModel.decodedResult,
          ),
        ),
      ),
    );
  }
}
