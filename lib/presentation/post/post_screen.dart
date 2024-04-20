import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Post Screen',
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Markdown(
            data: viewModel.decodedResult ?? 'post 실패',
          ),
        ),
      ),
    );
  }
}
