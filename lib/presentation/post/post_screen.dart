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
  void didChangeDependencies() {
    final viewModel = context.read<PostViewModel>();
    viewModel.onFetch(widget.path);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<PostViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Post Screen',
        ),
      ),
      body: SafeArea(
        child: Markdown(
          data: viewModel.contents ?? '실패',
        ),
      ),
    );
  }
}
