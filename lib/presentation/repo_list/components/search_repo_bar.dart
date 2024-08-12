import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';

class SearchRepoBar extends StatelessWidget {
  final TextEditingController _queryTextEditingController;
  final RepoListViewModel viewModel;

  const SearchRepoBar({super.key, required TextEditingController queryTextEditingController, required this.viewModel}) : _queryTextEditingController = queryTextEditingController;

  @override
  Widget build(BuildContext context) {
    FocusNode searchFocusNode = FocusNode();
    viewModel.isFocused = searchFocusNode.hasFocus;
    searchFocusNode.addListener(() {
      // viewModel.isFocused = searchFocusNode.hasFocus;
      if (searchFocusNode.hasFocus) {
        // 포커스를 얻었을 때, history를 보여줌
        // 키보드가 올라오면서 순간적으로 focus가 없어지는 문제가 있어 delay줌
        Future.delayed(const Duration(milliseconds: 500), () {
          viewModel.onTabSearchBar();
        });
      } else {
        if (!searchFocusNode.hasFocus && searchFocusNode.context != null) {
          viewModel.isFocused = false;
        }
      }
    });

    return TextFormField(
      controller: _queryTextEditingController,
      focusNode: searchFocusNode,
      // autofocus: true,
      onTap: () => viewModel.onTabSearchBar(),
      decoration: InputDecoration(
        labelText: 'Insert [Owner] or [Owner/Repository]',
        labelStyle: const TextStyle(color: Color(0xff171717)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0099FA),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff0099FA),
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        // border: const UnderlineInputBorder(),
        suffix: GestureDetector(
          onTap: () {
            _queryTextEditingController.clear();
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Icon(Icons.clear),
          ),
        ),
      ),
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (String value) {
        viewModel.queryText = value;
        viewModel.onSearch(value);
        viewModel.userSearch(value);
      },
      onChanged: (value) {
        viewModel.onSearchChanged(value);
      },
    );
  }
}
