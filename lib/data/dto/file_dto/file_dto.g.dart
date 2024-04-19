// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDto _$FileDtoFromJson(Map<String, dynamic> json) => FileDto(
      name: json['name'] as String?,
      path: json['path'] as String?,
      sha: json['sha'] as String?,
      size: json['size'] as int?,
      url: json['url'] as String?,
      htmlUrl: json['html_url'] as String?,
      gitUrl: json['git_url'] as String?,
      downloadUrl: json['download_url'] as String?,
      type: json['type'] as String?,
      content: json['content'] as String?,
      encoding: json['encoding'] as String?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FileDtoToJson(FileDto instance) => <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': instance.type,
      'content': instance.content,
      'encoding': instance.encoding,
      '_links': instance.links,
    };
