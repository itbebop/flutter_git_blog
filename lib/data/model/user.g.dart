// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      htmlUrl: json['htmlUrl'] as String,
      bio: json['bio'] as String,
      avatarUrl: json['avatarUrl'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
      blog: json['blog'] as String,
      company: json['company'] as String,
      publicRepos: json['publicRepos'] as int,
      location: json['location'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'htmlUrl': instance.htmlUrl,
      'bio': instance.bio,
      'avatarUrl': instance.avatarUrl,
      'followers': instance.followers,
      'following': instance.following,
      'blog': instance.blog,
      'company': instance.company,
      'publicRepos': instance.publicRepos,
      'location': instance.location,
      'email': instance.email,
      'type': instance.type,
    };
