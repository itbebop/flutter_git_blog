// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
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
      date: json['date'] as String?,
      lastModified: json['last-modified'] as String?,
    );

Map<String, dynamic> _$PostDtoToJson(PostDto instance) => <String, dynamic>{
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
      'date': instance.date,
      'last-modified': instance.lastModified,
    };
