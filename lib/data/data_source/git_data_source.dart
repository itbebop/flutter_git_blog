import 'dart:convert';

import 'package:flutter_git_blog/data/dto/file_dto/file_dto.dart';
import 'package:flutter_git_blog/data/dto/post_dto/post_dto.dart';
import 'package:flutter_git_blog/data/dto/repo_dto/repo_dto.dart';
import 'package:flutter_git_blog/data/dto/user_dto/user_dto.dart';
import 'package:http/http.dart' as http;

Map<K, V> mergeMaps<K, V>(Map<K, V> map1, Map<K, V> map2, {V Function(V, V)? value}) {
  var result = Map<K, V>.of(map1);
  if (value == null) return result..addAll(map2);

  map2.forEach((key, mapValue) {
    result[key] = result.containsKey(key) ? value(result[key] as V, mapValue) : mapValue;
  });
  return result;
}

class GitDataSource {
  final _baseUrl = 'https://api.github.com';

  Future<List<RepoDto>> getRepo(String owner) async {
    // repo의
    final response = await http.get(Uri.parse('$_baseUrl/users/$owner/repos'));

    final List bodies = jsonDecode(response.body);

    return bodies.map((e) => RepoDto.fromJson(e)).toList();
  }

  Future<List<PostDto>> getPath({required String owner, required String repo, String? path}) async {
    final response = await http.get(Uri.parse('$_baseUrl/repos/$owner/$repo/contents/$path'));
    final List bodies = response.statusCode == 200 ? jsonDecode(response.body) : throw Exception('statusCode: ${response.statusCode}');

    return bodies.map((e) => PostDto.fromJson(e)).toList();
  }

  Future<FileDto> getPost({required String owner, required String repo, required String dir, required String file}) async {
    //void getGitData(String owner, String repo, String dir, String file) async {
    final response = await http.get(Uri.parse('$_baseUrl$owner/$repo/contents/$dir/$file'));

    // final Map<String, dynamic> body = jsonDecode(response.body);
    // final Map<String, dynamic> header = response.headers;
    // header.removeWhere((key, value) => key != 'date' && key != 'last-modified');
    // Map<String, dynamic> combinedMap = {};
    // combinedMap = mergeMaps(header, body);
    //print('_combinedMap: $combinedMap');
    //final FileDto result = FileDto.fromJson(combinedMap);

    return FileDto.fromJson(jsonDecode(response.body));
  }

  Future<UserDto> getUser(String user) async {
    final response = await http.get(Uri.parse('$_baseUrl/users/$user'));
    final jsonUser = await jsonDecode(response.body);

    return UserDto.fromJson(jsonUser);
  }
}

//TODO:오류 처리 어떻게 할지
// main() {
//   GitDataSource().getDir(owner: 'tomoyo519', repo: 'comment');
// }
