import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:provider/provider.dart';

class RepoListScreen extends StatefulWidget {
  const RepoListScreen({super.key});

  @override
  State<RepoListScreen> createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  final _queryTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PostListViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset('assets/images/git_blog_white.png'),
        ),
        actions: const [
          AppBarTextButton(
            text: 'Repository List',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextFormField(
                  controller: _queryTextEditingController,
                  decoration: InputDecoration(
                    hintText: '"Owner" or "Owner/Repository"',
                    hintStyle: TextStyle(color: Colors.blue[400]),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    suffix: ElevatedButton(
                      onPressed: () {
                        // 버튼 클릭 시 처리
                        print(_queryTextEditingController.text);
                        print(_queryTextEditingController.text.contains('/'));
                        !_queryTextEditingController.text.contains('/')
                            ? viewModel.onSearch(_queryTextEditingController.text, context)
                            : viewModel.onSelectRepo(context, '${_queryTextEditingController.text.split('/')[0]}/${_queryTextEditingController.text.split('/')[1]}');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // 버튼 텍스트 색상
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // 버튼 모양
                      ),
                      child: const Text('확인'),
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (String value) {
                    viewModel.onSearch(value, context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              ...viewModel.repos.map((e) => SizedBox(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PostListScreen(
                        //       repo: e,
                        //     ),
                        //   ),
                        // );
                        viewModel.onSelectRepo(context, '${_queryTextEditingController.text.split('/')[0]}/${e.name}');
                      },
                      child: Text(
                        e.name,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTextButton extends StatelessWidget {
  final String text;
  const AppBarTextButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
      ),
    );
  }
}
