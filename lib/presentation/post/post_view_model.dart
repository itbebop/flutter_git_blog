import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_git_blog/data/model/file_info.dart';
import 'package:flutter_git_blog/data/repository/post_repository_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/catub.json');
}

Future<List<dynamic>> readFavorites() async {
  try {
    final file = await _localFile;
    dynamic decoded = [];
    if (await file.exists()) {
      print('### readFavorites: file exists');
      // Read the file
      final String contents = await file.readAsString();
      decoded = jsonDecode(contents);
    }
    List<dynamic> bookmarks = decoded is List ? decoded : [];
    return bookmarks;
  } catch (e) {
    throw Exception('#### error readFavorites: $e');
  }
}

// 저장소 권한 요청 함수
Future<bool> _requestStoragePermission() async {
  // 일반 저장소 권한 요청
  if (await Permission.storage.request().isGranted) {
    return true;
  }
  // Android 11(API 30) 이상에서 전체 저장소 접근 권한 요청
  if (await Permission.manageExternalStorage.request().isGranted) {
    return true;
  }
  return false; // 권한 거부 시 false 반환
}

class PostViewModel with ChangeNotifier {
  final PostRepositoryImpl _postRepositoryImpl;
  PostViewModel({required this.context, required PostRepositoryImpl postRepositoryImpl}) : _postRepositoryImpl = postRepositoryImpl;
  FileInfo? fileInfo;
  String decodedResult = '';
  String totalPath = '';
  String dir = '';
  BuildContext context;
  String exPath = getApplicationDocumentsDirectory().toString();
  bool isSaved = false;
  List<dynamic> bookmarks = [];

  void onFetch(String path) async {
    try {
      List pathList = path.split('/');
      String owner = pathList[0];
      String repo = pathList[1];

      for (int i = 2; i < pathList.length; i++) {
        dir += '/${pathList[i]}';
      }
      totalPath = '$owner/$repo$dir';
      // 즐겨찾기 읽어옴
      bookmarks = await readFavorites();
      //TODO:타입 수정해야함
      var existingBookmark = bookmarks.firstWhere((bookmark) => bookmark['path'] == totalPath, orElse: () => null);
      isSaved = existingBookmark != null;

      fileInfo = await _postRepositoryImpl.getFile(owner: owner, repo: repo, dir: dir);
      if (fileInfo != null) {
        decodedResult = base64Decode(fileInfo!.content);
      }

      notifyListeners();
    } catch (e) {
      print('error onFetch: $e');
    }
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

      if (decoded is List) {
        bookmarks = decoded;
      } else {
        bookmarks = []; // 예상과 다른 타입이면 빈 리스트 할당
      }

      var existingBookmark = bookmarks.firstWhere((bookmark) => bookmark['path'] == totalPath, orElse: () => null);

      if (existingBookmark != null) {
        bookmarks.removeWhere((bookmark) => bookmark['path'] == totalPath);
        isSaved = false;
      } else {
        bookmarks.add({'path': totalPath});
        isSaved = true;
      }
      // SnackBar 메시지 업데이트
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isSaved ? '$exPath에 즐겨찾기가 저장되었습니다!' : '$exPath에서 $dir이 삭제되었습니다!')));
      print('### existingBookmark: $existingBookmark');

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

    // Directory directory;
    // if (Platform.isAndroid) {
    //   directory = Directory("/storage/emulated/0/Download");
    // } else {
    //   directory = await getApplicationDocumentsDirectory();
    // }

    final directory = await getApplicationDocumentsDirectory();
    exPath = directory.path;

    // 파일 경로 설정
    final targetFile = File('$exPath/catub.json');

    // JSON 데이터 준비
    List<dynamic> existingList = [];
    if (await targetFile.exists()) {
      String existingContent = await targetFile.readAsString();
      // JSON 디코딩 결과가 리스트인지 확인
      dynamic decoded = jsonDecode(existingContent);
      if (decoded is List) {
        existingList = decoded;
      } else {
        // 디코딩된 데이터가 리스트가 아닌 경우, 적절한 처리가 필요
        existingList = [];
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
