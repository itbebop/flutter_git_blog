import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/repo_list/repo_list_view_model.dart';
import 'package:go_router/go_router.dart';
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
    final viewModel = context.watch<RepoListViewModel>();
    final user = viewModel.user;
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
                ),
              ),
              user != null
                  ? Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.sizeOf(context).width * 0.2,
                                backgroundImage: NetworkImage(user.avatarUrl),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: user.name,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWidget(
                                      text: user.html_url.split('/')[3],
                                      fontSize: 17,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.group),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                  child: Text(
                                                    user.followers.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                                const Text('followers'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                  child: Text(
                                                    user.following.toString(),
                                                    style: const TextStyle(fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                                const Text('following'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    user.location != ''
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.location_on),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(user.location),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                    user.email != ''
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.email),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(user.email),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                    user.company != ''
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.apartment),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(user.company),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.local_mall),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text('Total Public repos : '),
                                        ),
                                        Text(user.publicRepos.toString())
                                      ],
                                    ),
                                    user.blog != ''
                                        ? Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.home),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Text(user.blog),
                                              )
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              ...viewModel.state.respos.map((e) => SizedBox(
                    height: 30,
                    child: GestureDetector(
                      onTap: () {
                        viewModel.onSelectRepo(context, '${_queryTextEditingController.text.split('/')[0]}/${e.name}');
                        context.push('/post', extra: '${_queryTextEditingController.text.split('/')[0]}/${e.name}');
                      },
                      child: Text(
                        e.name!,
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

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  const TextWidget({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
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
