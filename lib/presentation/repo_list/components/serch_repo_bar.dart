import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';

class SearchRepoBar extends StatelessWidget {
  final TextEditingController _queryTextEditingController;
  final RepoListViewModel viewModel;
  const SearchRepoBar({super.key, required TextEditingController queryTextEditingController, required this.viewModel}) : _queryTextEditingController = queryTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _queryTextEditingController,
      decoration: InputDecoration(
        hintText: '"Owner" or "Owner/Repository"',
        hintStyle: TextStyle(color: Colors.blue[400]),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        suffix: ElevatedButton(
          onPressed: () {
            // 버튼 클릭 시 처리
            viewModel.onSearch(_queryTextEditingController.text, context);
            viewModel.userSearch(_queryTextEditingController.text);
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
        viewModel.userSearch(value);
      },
    );
  }
}
