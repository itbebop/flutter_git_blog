// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
  String? name;
  String? path;
  String? sha;
  int? size;
  String? url;
  @JsonKey(name: 'html_url')
  String? htmlUrl;
  @JsonKey(name: 'git_url')
  String? gitUrl;
  @JsonKey(name: 'download_url')
  String? downloadUrl;
  String? type;
  String? content;
  String? encoding;
  @JsonKey(name: '_links')
  Links? links;
  String? date;
  @JsonKey(name: 'last-modified')
  String? lastModified;

  PostDto({
    this.name,
    this.path,
    this.sha,
    this.size,
    this.url,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
    this.type,
    this.content,
    this.encoding,
    this.links,
    this.date,
    this.lastModified,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return _$PostDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostDtoToJson(this);

  @override
  String toString() {
    return 'PostDto(name: $name, path: $path, sha: $sha, size: $size, url: $url, htmlUrl: $htmlUrl, gitUrl: $gitUrl, downloadUrl: $downloadUrl, type: $type, content: $content, encoding: $encoding, links: $links, date: $date, lastModified: $lastModified)';
  }
}
