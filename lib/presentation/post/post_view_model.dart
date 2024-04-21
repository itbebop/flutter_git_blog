import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/file_info.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PostViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;
  PostViewModel({required this.context, required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  FileInfo? fileInfo;
  String decodedResult = '';
  String totalPath = '';
  BuildContext context;
  bool isSaved = false;
  String exPath = '/storage/emulated/0/Download'; //TODO: default로 어떻게 설정해야할지
  String dir = '';

  void onFetch(String path) async {
    List pathList = path.split('/');
    String owner = pathList[0];
    String repo = pathList[1];

    for (int i = 2; i < pathList.length; i++) {
      dir += '/${pathList[i]}';
    }

    totalPath = '$owner/$repo$dir';
    fileInfo = await _postRepositoryImpl.getFile(owner: owner, repo: repo, dir: dir);
    if (fileInfo != null) {
      decodedResult = base64Decode(fileInfo!.content);
    }

    // 저장된 파일을 읽고 isSaved 상태를 업데이트
    final file = File('$exPath/catub.json');
    print('0. exPath: $exPath');
    if (await file.exists()) {
      print('1. 파일이 존재함');
      String contents = await file.readAsString();
      dynamic decoded = jsonDecode(contents);
      print('2. decoded: $decoded');
      List<dynamic> bookmarks = decoded is List ? decoded : [];
      print('3. decoded is List? ${decoded is List?}');
      var existingBookmark = bookmarks.firstWhere((bookmark) => bookmark['path'] == totalPath, orElse: () => null);
      isSaved = existingBookmark != null;
    } else {
      print('1. 파일이 존재하지 않음');
      isSaved = false;
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

    return decodedString;
  }

  void onSave() async {
    final file = File('$exPath/catub.json');
    List<dynamic> bookmarks = [];

    if (await file.exists()) {
      String contents = await file.readAsString();
      // 파일의 내용을 안전하게 처리하기 위한 수정
      dynamic decoded = jsonDecode(contents);
      print('4. decoded.runtimeType: ${decoded.runtimeType}');

      if (decoded is List) {
        bookmarks = decoded;
      } else {
        bookmarks = []; // 예상과 다른 타입이면 빈 리스트 할당
      }

      var existingBookmark = bookmarks.firstWhere((bookmark) => bookmark['path'] == totalPath, orElse: () => null);

      if (existingBookmark != null) {
        bookmarks.removeWhere((bookmark) => bookmark['path'] == totalPath);
        print('즐겨찾기 삭제됨');
        isSaved = false;
      } else {
        bookmarks.add({'path': totalPath});
        print('즐겨찾기 저장됨');
        isSaved = true;
      }
      // SnackBar 메시지 업데이트
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isSaved ? '$exPath에 즐겨찾기가 저장되었습니다!' : '$exPath에서 $dir이 삭제되었습니다!')));

      await file.writeAsString(jsonEncode(bookmarks));
    } else {
      await saveFile(totalPath);
      isSaved = true;
    }

    notifyListeners();
  }

  Future<void> saveFile(String totalPath) async {
    // 저장소 접근 권한 확인 및 요청
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    Directory directory;
    if (Platform.isAndroid) {
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    exPath = directory.path;

    // 파일 경로 설정
    final targetFile = File('$exPath/catub.json');

    // JSON 데이터 준비
    List<dynamic> existingList = [];
    if (await targetFile.exists()) {
      String existingContent = await targetFile.readAsString();
      // JSON 디코딩 결과가 리스트인지 확인
      dynamic decoded = jsonDecode(existingContent);
      print(decoded);
      if (decoded is List) {
        existingList = decoded;
      } else {
        // 디코딩된 데이터가 리스트가 아닌 경우, 적절한 처리가 필요
        existingList = [];
        print("Error: Expected a list, but got a different type.======");
      }
    }
    // 경로가 이미 리스트에 존재하는지 확인
    var existingBookmark = existingList.firstWhere((bookmark) => bookmark['path'] == totalPath, orElse: () => null);

    if (existingBookmark != null) {
      // 존재한다면 삭제
      existingList.removeWhere((bookmark) => bookmark['path'] == totalPath);
      isSaved = false;
    } else {
      // 존재하지 않는다면 추가
      existingList.add({'path': totalPath});
      isSaved = true;
    }

    // 수정된 리스트를 파일에 다시 저장
    await targetFile.writeAsString(jsonEncode(existingList));
  }
}
