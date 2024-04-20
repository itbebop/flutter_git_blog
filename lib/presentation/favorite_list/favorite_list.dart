import 'package:flutter/material.dart';
import 'package:flutter_git_blog/common/color/light_app_color.dart';
import 'package:flutter_git_blog/common/component/text_widget.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            text: 'favorite',
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: LightAppColor.greyColor, width: 0.5)), // 라인효과
          ),
          child: BottomNavigationBar(
            onTap: (value) {
              switch (value) {
                case 0:
                  context.go('/');
                case 1:
                  context.go('/favorites');
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.star, color: LightAppColor.secondaryColor), label: 'Favorites'),
            ],
          ),
        ));
  }
}
