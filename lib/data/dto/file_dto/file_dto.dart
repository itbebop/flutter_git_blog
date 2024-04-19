import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'file_dto.g.dart';

@JsonSerializable()
class FileDto {
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

  FileDto({
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
  });

  factory FileDto.fromJson(Map<String, dynamic> json) => _$FileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FileDtoToJson(this);
}
