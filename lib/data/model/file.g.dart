// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileImpl _$$FileImplFromJson(Map<String, dynamic> json) => _$FileImpl(
      name: json['name'] as String,
      size: json['size'] as num,
      htmlUrl: json['htmlUrl'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      encoding: json['encoding'] as String,
    );

Map<String, dynamic> _$$FileImplToJson(_$FileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'htmlUrl': instance.htmlUrl,
      'type': instance.type,
      'content': instance.content,
      'encoding': instance.encoding,
    };
