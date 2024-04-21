import 'dart:io';

import 'package:flutter/material.dart';

class FavoriteViewModel with ChangeNotifier {
  List favorites = [];
  String exPath = '/storage/emulated/0/Download';

  onFetch() {
    final file = File('$exPath/catub.json');
  }
}
