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
      decoration: const InputDecoration(
        labelText: 'Insert Owner or Owner/Repository...',
        labelStyle: TextStyle(color: Color(0xff171717)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0099FA),
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD7D7D7),
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        border: UnderlineInputBorder(),
      ),
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (String value) {
        viewModel.onSearch(value, _queryTextEditingController.text);
        viewModel.userSearch(value);
      },
    );
  }
}
