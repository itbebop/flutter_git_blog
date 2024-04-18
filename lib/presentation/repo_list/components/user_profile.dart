import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
import 'package:flutter_git_blog/data/model/user.dart';

class UserProfile extends StatelessWidget {
  final User user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white, boxShadow: const [BoxShadow(spreadRadius: 2, blurRadius: 3, offset: Offset(0, 6), color: Colors.black38)]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.sizeOf(context).width * 0.18,
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
          ),
        ),
      ),
    );
  }
}
