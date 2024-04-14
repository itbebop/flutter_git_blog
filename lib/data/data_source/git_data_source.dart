import 'dart:convert';

import 'package:flutter_git_blog/data/dto/post_dto/post_dto.dart';
import 'package:flutter_git_blog/data/model/repo.dart';
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

  Future<List<Repo>> getRepo(String owner) async {
    // repo의
    final response = await http.get(Uri.parse('$_baseUrl/users/$owner/repos'));

    final List bodies = jsonDecode(response.body);

    return bodies.map((e) => Repo.fromJson(e)).toList();
  }

  Future<PostDto> getPost({required String owner, required String repo, required String dir, required String file}) async {
    //void getGitData(String owner, String repo, String dir, String file) async {
    final response = await http.get(Uri.parse('$_baseUrl$owner/$repo/contents/$dir/$file'));

    final Map<String, dynamic> body = jsonDecode(response.body);
    final Map<String, dynamic> header = response.headers;
    header.removeWhere((key, value) => key != 'date' && key != 'last-modified');
    // print(header['last-modified']);
    // print(body['download_url']);

    Map<String, dynamic> combinedMap = {};
    combinedMap = mergeMaps(header, body);

    //print('_combinedMap: $combinedMap');
    final PostDto result = PostDto.fromJson(combinedMap);
    return result;
  }
}

// main() {
//   GitDataSource().getGitData('itbebop', 'TIL', 'daily', '20240411.md');
// }
