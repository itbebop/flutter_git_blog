// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoImpl _$$RepoImplFromJson(Map<String, dynamic> json) => _$RepoImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      fullName: json['fullName'] as String?,
      htmlUrl: json['htmlUrl'] as String,
    );

Map<String, dynamic> _$$RepoImplToJson(_$RepoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'htmlUrl': instance.htmlUrl,
    };
