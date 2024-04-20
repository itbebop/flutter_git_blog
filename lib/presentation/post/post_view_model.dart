import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/file.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';

class PostViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;
  PostViewModel({required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  File? file;
  String decodedResult = '';

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
    print('owner : $owner');
    print('repo : $repo');
    print('dir : $dir');
    file = await _postRepositoryImpl.getFile(owner: owner, repo: repo, dir: dir);
    if (file != null) {
      print('content : ${file!.content}');

      decodedResult = base64Decode(file!.content);
    }

    notifyListeners();
  }

  String base64Decode(base64EncodedString) {
    print('replace전 $base64EncodedString');
    String modifiedString = base64EncodedString.toString().replaceAll('\n', ' ');
    //base64EncodedString.trim().replaceAll(RegExp(r'(\n){3,}'), "\n\n");
    //base64EncodedString.replaceAll(RegExp(r"\\n"), "");
    print('replace후 $modifiedString');
    // Base64 문자열을 디코드하여 바이트 배열로 변환
    String trimedString = modifiedString.replaceAll(' ', '');
    List<int> decodedBytes = base64.decode(trimedString);

    // 바이트 배열을 UTF-8 문자열로 디코드
    String decodedString = utf8.decode(decodedBytes);

    print('decodedString: $decodedString');

    return decodedString;
  }
}
