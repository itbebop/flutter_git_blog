import 'package:flutter/material.dart';
import 'package:flutter_git_blog/presentation/post/post_view_model.dart';

class BookmarkViewModel with ChangeNotifier {
  BookmarkViewModel({required this.context});

  List bookmarks = [];
  String exPath = '/storage/emulated/0/Download';
  BuildContext context;
  onFetch() async {
    bookmarks = await readFavorites();
    List existingBookmark = bookmarks.map((e) => e['path']).toList();
    existingBookmark.forEach(print);

    notifyListeners();
  }
}
