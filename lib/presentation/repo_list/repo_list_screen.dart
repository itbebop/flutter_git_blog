import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/show_dialog.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/repo_list.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/search_repo_bar.dart';
import 'package:flutter_git_blog/presentation/repo_list/components/user_profile.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class RepoListScreen extends StatefulWidget {
  const RepoListScreen({super.key});

  @override
  State<RepoListScreen> createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  FocusNode searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController(); // ScrollController 생성

  void moveScroll(value) {
    _scrollController.animateTo(value.toDouble(), duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RepoListViewModel>();
    final user = viewModel.user;
    viewModel.isFocused = searchFocusNode.hasFocus;

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
          actions: const [],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              // forceMaterialTransparency: false,
              backgroundColor: LightAppColor.whiteColor,
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              //collapsedHeight: MediaQuery.of(context).size.height * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                background: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: SearchRepoBar(
                            queryTextEditingController: viewModel.queryTextEditingController,
                            viewModel: viewModel,
                            searchFocusNode: searchFocusNode,
                          ),
                        ),
                        viewModel.isFocused
                            ? Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: viewModel.searchHistoryList.length + 1, // +1 to include the "더보기" button
                                    itemBuilder: (context, index) {
                                      if (index == viewModel.searchHistoryList.length) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: !viewModel.isMoreHistory
                                              ? Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        viewModel.loadMoreSearchHistory();
                                                      },
                                                      child: const Text('see more')),
                                                )
                                              : const SizedBox(),
                                        );
                                      }

                                      return ListTile(
                                        minVerticalPadding: 0,
                                        contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24.0),
                                        title: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.queryTextEditingController.text = viewModel.searchHistoryList[index];
                                                moveScroll(0);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Icon(Icons.history),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8),
                                                      child: Text(
                                                        viewModel.searchHistoryList[index],
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      ShowDialog(context, viewModel, index);
                                                    },
                                                    child: const Icon(Icons.clear),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        user != null ? UserProfile(user: user) : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: RepoList(viewModel: viewModel),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (value) {
            switch (value) {
              case 0:
                context.go('/');
              case 1:
                context.go('/bookmarks');

              case 2:
                context.push('/license');
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: LightAppColor.secondaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  color: Colors.black,
                ),
                label: 'Bookmarks'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                label: 'license'),
          ],
          selectedItemColor: LightAppColor.secondaryColor,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
