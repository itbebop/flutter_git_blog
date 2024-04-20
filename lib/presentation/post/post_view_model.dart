import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/file.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;
  PostViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  File? file;
  String decodedResult = '';
  String totalPath = '';

  void onFetch(String path) async {
    print('first path : $path');
    List pathList = path.split('/');
    String owner = pathList[0];
    String repo = pathList[1];
    String dir = '';
    print('pathList.length: ${pathList.length}');
    for (int i = 2; i < pathList.length; i++) {
      dir += '/${pathList[i]}';
    }

    totalPath = '$owner/$repo$dir';
    file = await _postRepositoryImpl.getFile(owner: owner, repo: repo, dir: dir);
    if (file != null) {
      print('content : ${file!.content}');

      decodedResult = base64Decode(file!.content);
    }

    notifyListeners();
  }

  String base64Decode(base64EncodedString) {
    // git api로 들어오는 '\n'을 없앰
    String modifiedString = base64EncodedString.toString().replaceAll('\n', '');
    // Base64 문자열을 디코드하여 바이트 배열로 변환
    List<int> decodedBytes = base64.decode(modifiedString);

    // 바이트 배열을 UTF-8 문자열로 디코드
    String decodedString = utf8.decode(decodedBytes);

    print('decodedString: $decodedString');

    return decodedString;
  }
}
